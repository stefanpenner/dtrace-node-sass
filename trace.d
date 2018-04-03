#!/usr/sbin/dtrace -qs

typedef struct Sass_Function {
  char*            signature;
} Sass_Function;

pid$target:binding.node:sass_custom_function*:entry {
  self->cb = (Sass_Function*) copyin(arg1,  sizeof (Sass_Function));
  self->signature = copyinstr((user_addr_t)self->cb->signature);

  self->timestamp = timestamp;
}

pid$target:binding.node:sass_custom_function*:return
/self->timestamp/
{
  self->duration = timestamp - self->timestamp;
  @count["total", self->signature] = count();
  @duration["duration (ns)", self->signature] = quantize(self->duration);
  @total["total (ns)", self->signature] = sum(self->duration);
}

tick-10sec
{
	printa(@count);
}
