
PImage img; 

void setup(){
size(400,400);
img = loadImage("field.JPG");
image(img,0,0,400,400);
smooth();
frameRate(20);  //this adjusts the speed of the wind
}

void draw(){
strokeWeight(5);
noFill();
stroke(255,25);
float i=random(400);   //these set random variables for curve coordinates
float j=random(400); 
float i2=random(400);
float j2=random(400); 
float i3=random(400);
float j3=random(400); 
float i4=random(400);
float j4=random(400);
float i5=random(400);
float j5=random(400); 
float i6=random(400);
float j6=random(400); 
float i7=random(400);
float j7=random(400); 
float i8=random(400);
float j8=random(400);   
image(img,0,0,400,400);      
bezier(-100, width, 133, i, 266, j, 500, width);   //draw the curves
bezier(-100, width/2, 133, i2, 266, j2, 500, width/2);
bezier(-100, width/4, 133, i3, 266, j3, 500, width/4);
bezier(-100, 0, 133, i4, 266, j4, 500, 0);
bezier(-100, width, 133, i5, 266, j5, 500, width);
bezier(-100, width/2, 133, i6, 266, j6, 500, width/2);
bezier(-100, width/4, 133, i7, 266, j7, 500, width/4);
bezier(-100, 0, 133, i8, 266, j8, 500, 0);

}

