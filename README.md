docker.mk
=========

`docker.mk` is a simple [Makefile](https://www.gnu.org/software/make/) that
implements some handy targets that you might find useful when developing
[Docker](https://www.docker.com/) images.


### Usage

If you are interested in using `docker.mk` in your project, all you have
to do is to add the following code snippet to your `Makefile`, where
`<dkrmk-version>` and `<dkrmk-image>` are the version of `docker.mk` you
want to use in your project and the name of the Docker image your project
is about.

```Makefile
.PHONY: ALWAYS

DKRMK_VSN := <dkrmk-version>

## Include docker.mk
##-------------------------------------------------------------------------
-include docker.mk

## docker.mk settings
##-------------------------------------------------------------------------
export

DKR_IMAGE := <dkrmk-image>

## docker.mk bootstrap
##-------------------------------------------------------------------------
DKRMK_VSN_FILE := .dkrmk-vsn-$(DKRMK_VSN)
DKRMK_URL      := https://github.com/efcasado/docker.mk
DKRMK_VSN_URL  := $(DKRMK_URL)/releases/download/$(DKRMK_VSN)/docker.mk
docker.mk: $(DKRMK_VSN_FILE)
$(DKRMK_VSN_FILE): ; rm -rf docker.mk && rm -rf .dkrmk-vsn-* && wget $(DKRMK_VSN_URL) && touch $(DKRMK_VSN_FILE)

%: ALWAYS; $(MAKE) -f docker.mk $*
ALWAYS:
```


### Author(s)

- Enrique Fernandez `<efcasado@gmail.com>`


### License

Copyright (c) 2005 Enrique Fernandez

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
