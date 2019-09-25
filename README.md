# Laravel Nova : compile-all-components
Compile all nova components in one single command run.


## How to
Follow the instructions below.


### Create new file: deploy_build.sh
```
#!/bin/sh
# Builds assets for each nova component.
# Executed by `npm run deploy`

for d in nova-components/*/ ;
    do (
        # Enter each component folder.
        cd "$d" &&

        # Install required packages for compile.
        npm install &&

        # Compille assets.
        # Cache clear done by latter deploy hook.
        npm run prod &&

        # Revert npm install.
        rm -rf node_modules
    );
done
```

### In file: package.json

Create new script, like so:
> "deploy": "chmod +x ./deploy_build.sh && ./deploy_build.sh"


### In command line: Run script

> npm run deploy

🎉🎉🎉🎉🎉🎉🎉🎉🎉
