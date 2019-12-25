## A Linux file system bookmark manager.

### Configuration

Add the following line to your .bashrc file:

```
. /path-to-script/b
```

### Usage

Display help:

```
b
```
or
```
b -h
```

Add current directory as bookmark with reference <ref>:
```
b -c <ref>
```

Delete bookmark with reference <ref>:
```
b -d <ref>
```

Change directory to the path pointed by the given reference:
```
b <ref>
```

List all bookmarks:
```
b -l
```

### Dependencies

- bash
- sed
