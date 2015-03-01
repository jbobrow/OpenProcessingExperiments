
//ex10 images
/* @pjs preload="empire200.jpg"; */
PImage img;
float r ;
float g ;
float b ;
r = random (0,255);
g= random (0,255);
b= random (0,255);
background (255);
size (600,200);

for (int i=0; i<600; i=i+100){
img = loadImage("empire200.jpg");
tint (r+i,g+i,b+i,150);
image(img,i,0, 150,200);

}



