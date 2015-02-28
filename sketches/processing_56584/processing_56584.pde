
//kinetic variables
PImage img; //creating PImage variable for loaded image
float x=260; //x coord
float y=180; //y coord
float easing=0.01;
float offset =0;
int radius=60; //head radius
int bodyW=197; //body width

void setup(){
  size(500,500);
  smooth();
  ellipseMode(RADIUS);
  img=loadImage("alpine.png"); //draw image
}
void draw(){
  image(img,0,0,500,500);
  x+=random(-2,2);
  y+=random(0,1);

//Robot Body Parts  
//Neck
stroke(90);
fill(100,23,250,136);
rect(x,y-80,30,180);
//Antennae
strokeWeight(8);
line(x-10,y-80,400,130);
line(x-10,y-80,420,80);
//Body
noStroke();
fill(102);
ellipse(x+20, 380, 46, 46);
fill(0, 122, 135,135);
rect(x-50, 240, bodyW, 120);
fill(102,89,123,200);
rect(x-50, 280, bodyW, 10);
//Head
fill(200,89,89); //Teal colour
ellipse (x+28,y-80,80,radius);
fill (166,152,124);                 
ellipse(x+28, y-80, 15, 15);  
fill(0,200,123);
ellipse(x+28, y-80, 3, 3);
fill(160,256,15);
//lighting head
   fill(random(255), random(255), random(255));
   frameRate(10); //slows down the process
rect(x-10, y-80, 10,10);
rect(x-35, y-90, 12,12);
rect(x+78, y-90, 17, 17);
}

