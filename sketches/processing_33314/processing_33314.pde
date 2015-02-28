
PImage myImage;


void setup(){

size(720,90);
myImage=loadImage("liz.gif");
image(myImage,0,0);


}

void draw(){

  for(int i=0; i <width; i = i + 90)
    image(myImage,i,0);
    
    
    // No fourth argument means 100% opacity.
fill(249,250,73,127);
rect(0,0,90,90);

// 255 means 100% opacity.
fill(250,8,40,127);
rect(90,0,90,90);

// 75% opacity.
fill(8,33,250,127);
rect(180,0,90,90);

// 55% opacity.
fill(8,250,66,127);
rect(270,0,90,90);

// 25% opacity.
fill(250,194,8,127);
rect(360,0,90,90);

fill(26,21,6,127);
rect(450,0,90,90);

fill(17,242,240,127);
rect(630,0,90,90);

    
    
     
       
  }

 


