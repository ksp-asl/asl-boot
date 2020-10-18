# Roxaero Boot
Initial booting sequence 

## Boot API
Booting sequence requires ```init/init.ks``` file to exist on the central file storage which must be a valid script taking a single parameter ```env``` of type ```Lexicon```. It is also expected that during its execution ```init/init.ks``` will add ```init``` attribute (```Lexicon```) to the environment which consists of at least one string attribute ```prg```. After a successfully run of the init file, boot sequence tries to copy & execute a script specified by ```env:init:prg``` path providing the environment to it once again.
