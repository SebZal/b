## A Linux file system bookmark manager.

### Configuration

Add the following line to your .bashrc file:

```
. /script-directory/b.bash
```

### Usage

Display help: ```b``` or ```b -h```

Add current directory as bookmark with reference _ref_: ```b -c ref```

Delete bookmark with reference _ref_: ```b -d ref```

Change directory to the path pointed by reference _ref_: ```b ref```

List all bookmarks: ```b -l```

### Dependencies

- bash
- sed
