# ASL Boot
Initial booting sequence which decouples PCU initial setup from any specific flight/mission parameters.

## Boot API
Booting sequence requires a valid ```init/init.ks``` script to exist on the central file storage to be copied and executed.

Init script is expected to take a single parameter ```env``` of type ```Lexicon```.
It is also expected that during its execution ```env``` is extended with ```init``` attribute (type ```Lexicon```) which consists of at least one string attribute ```prg```.

After a successful run of the init file, boot sequence tries to copy and execute a script specified by ```env:init:prg``` path providing the environment to it once again.

### Example
Typical usage of boot sequence would be to assign it to PCU before leaving VAB/SPH while having a valid ```init/init.ks``` on the central storage, f.e.:
```
parameter env.
env:add("init", lex(
  "prg", "example.ks",
  "p1", "parameter 1",
  "p2", "parameter 2"
)).
```
This setup would result with both ```init/init.ks``` and ```example.ks``` copied to a local disk and executed.
Any script in ```example.ks``` would also have access to the environment as well and thus can use the declared parameters, f.e. ```env:init:p1``` or ```env:init:p2```.
