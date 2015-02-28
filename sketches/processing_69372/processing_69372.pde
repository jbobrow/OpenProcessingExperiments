
/* 
This was my best attempt at recreating this piece of art
http://cdn2.brooklynmuseum.org/images/opencollection/objects/size3/72.4_SL1.jpg
I tried my best to duplicate the shapes of the painter, along
with the almost 3d effect of the painting. I also tired to utilize
white space in a similar way.

However, I ran into a lot of issues with color. I couldn't figure
out if there is a way to utilize transparancy, and also I couldn't
figure out if there was a polygon code- so I ended up having to make
a rectangle or 2, and a triangle to make up the pentagrams in the 
origional. Also the origional is created using sawdust, so there was
no way for me to perfectly replicate the color and it's consistancy.
*/


smooth();

stroke(220, 220, 0);
fill(220, 220, 0);
quad(0, 0, 25, 0, 25, 40, 0, 40);
quad(25, 0, 54, 0, 54, 50, 25, 40);

stroke(190, 40, 40);
fill(190, 40, 40);
quad(0, 45, 25, 45, 50, 55, 0, 55);

stroke(200, 150, 0);
fill(200, 150, 0);
quad(2, 60, 46, 60, 48, 64, 20, 70);
triangle(2, 60, 20, 70, 2, 70);

stroke(10, 10, 200);
fill(50, 50, 200);
triangle (30, 70, 49, 66, 52, 71);

stroke(220, 100, 0);
fill(220, 100, 0);
quad(60, 0, 80, 0, 80, 50, 60, 50);
quad(75, 50, 80, 50, 80, 75, 75, 75);
triangle(60, 50, 75, 50, 75, 74);

stroke(60, 25, 230);
fill(60, 25, 230);
quad (90, 0, 99, 0, 99, 99, 90, 99);

stroke(90, 170, 0);
fill(90, 190, 0);
quad (3, 82, 53, 82, 48, 76, 3, 76);

stroke(10, 180, 100);
fill(10, 180, 100);
quad (3, 95, 60, 95, 53, 85, 3, 85);



