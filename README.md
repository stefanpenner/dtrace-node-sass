# dtrace-node-sass

A script to give insights into what node-sass is up to.

Current this only instruments:

* custom functions, such as those provided in https://github.com/sass-eyeglass/eyeglass/blob/ab308d492657f76144942b0bc34b71ccd1be3641/lib/functions/normalize-uri.js

TODO:

* trace native sass functions such a: https://github.com/sass-eyeglass/eyeglass/blob/ab308d492657f76144942b0bc34b71ccd1be3641/sass/assets.scss#L20
* trace either insteresting thing

## Steps

### On OSX, you'll need to disable SIP (System Integrity Protection)

1. Reboot the Mac and hold down Command + R keys simultaneously after you hear the startup chime, this will boot OS X into Recovery Mode

2. When the “OS X Utilities” screen appears, pull down the ‘Utilities’ menu at the top of the screen instead, and choose “Terminal”

3. Type the following command into the terminal then hit return:

  ```sh
  csrutil disable; reboot
  ```

### Begin tracing

```sh
sudo dtrace -s ./trace.d  -p <pid-of-process-using-node-sass>
```


### Thanks

@burkelibbey for supplementing my c skills.
