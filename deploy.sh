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
