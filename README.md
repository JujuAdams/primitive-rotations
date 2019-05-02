<h1 align="center">Primitive Rotations</h1>

### @jujuadams

Simple demo comparing two ways of rotating primitives in GameMaker - trigonometry and matrices.

**Spoiler warning**: Use matrices. The trig required to rotate a point in 2D on the CPU is pretty expensive. Using the GPU to rotate lots of points at once is not only faster for big shapes, it's easier to read too.