
/*
Hart Boyd
Design 479
Exercise 01 "Self Portrait"
*/

size(100,100, P3D); //set window size

translate(50,20,0); //set position
rotateX(-10); //set x rotation
rotateY(4); //set y rotation
stroke(0,0,0); //set stroke to black
noFill(); //remove fill
box(50,15,20); //draw rectagle

translate(-20,-50,20); //set position
rotateX(10); //set x rotation
rotateY(10); //set y rotation
stroke(0,0,0); //set stroke to black
fill(100,200,200); //set fill teal
box(50,20,20); //draw rectangle

translate(0,0,0); //set position
rotateX(10); //set x rotation
rotateY(100); //set y rotation
stroke(0,0,0); //set stroke to black
fill(200,100,50); //fill to brown
box(20,20,50); //draw rectangle

translate(0,40,0); //set position
rotateX(6); //set x rotation
rotateY(4); //set y rotation
stroke(0,0,0); //set stroke to black
fill(90,70,255); //set fill color to purple
box(10,30,10); //draw rectangle

translate(-30,-15,-15); //set position
rotateX(10); //set x rotation
rotateY(5); //set y rotation
stroke(0,0,0); //set stroke to black
noFill(); // remove fill
box(10,70,20); //draw rectangle


