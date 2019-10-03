# Laravel Nova : compile-all-components
Compile all nova components in one single command run.


## How to
Follow the instructions below.


### Create new file: deploy.sh
```
#!/bin/sh
# Builds assets for each nova component.
# Executed by `npm run deploy`

# Install npm for root directory.
npm install --no-optional 

for d in ./nova-components/*/ ;
    do (
        # Enter each component folder.
        cd "$d"

        # Symlink to root's node_modules for faster deploy.
        if [ ! -L "node_modules" ]; then
            ln -s ../../node_modules/ node_modules
            echo "Created symlink in: $d"
        fi

        # Compille component assets.
        if [ -f "package.json" ]; then
            npm run prod
        fi
    );
done
```

### In file: package.json

Create new script, like so:
```
    "scripts": {
        ....
        "deploy": "chmod +x ./deploy.sh && ./deploy.sh"
    }
```



Add this dependency to devdependencies. This is required since most nova
components are having it as a required dependency.

```
    "devDependencies": {
        ....
        "laravel-nova": "^1.0"
    }
```

### In command line: Run script

> npm run deploy

🎉🎉🎉🎉🎉🎉🎉🎉🎉
