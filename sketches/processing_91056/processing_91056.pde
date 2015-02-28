
PImage myImage;
PImage myImage2;


void setup(){
  size(800,800);
  myImage=loadImage("beautiful_blue_sky_hd_picture_166005.jpg");
  myImage2=loadImage("st.-augustine.jpg");
}

void draw(){
background(0);
image(myImage, 0, 0, 800, 800);
image(myImage2, 0, 700, 800,100);
fill(170, 0, 0);//House, fill in color
rect(350, 500, 302, 200);//Shape and positon of the house
stroke(0);//stroke of the roof
fill(129, 29, 29);//Color of the chimney
rect(400, 380, 30, 80);//shape and postion of the chimney, 
fill(75, 75, 75);//color of the top part of chimney
triangle(500, 350, 650, 500, 350, 500);//shape and position of the roof
fill(222, 222, 222);//color of the left window
rect(380, 510, 50, 50);//Shape and position of the left window
fill(222, 222, 222);//color of the right window
rect(580, 510, 50, 50);//shape and postion of the right window
fill(106, 70, 41);//color of the door
rect(475, 630, 50, 70);//shape and position of the door
fill(49, 49, 49);//color of the upper part of the chimney
rect(385, 360, 60, 30);//shape and position of the upper part of the chimney
}

void keyPressed(){
  if(keyPressed){
    tint(100, 100, 100);
  }
}

void mousePressed(){
  if(mousePressed){
   myImage=loadImage("tumblr_m5kgjqEZx21qep7kvo1_1280.jpg");

   
  }
}
    





