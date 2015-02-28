
int radius=60; //head radius
int bodyW=197; //body width

//kinetic variables
float x=260; //x coord
float y=180; //y coord
float easing=0.05;

void setup(){
size(500,500);
smooth();
background(204); //background colour before movement
strokeWeight(2);
ellipseMode(RADIUS);
}

void draw(){
  float targetX=mouseX;
  x+=(targetX-x)*easing;
  
  if(mousePressed){
    x=260;
    y=200;
  }
  else {
    y=180;
  }
  background(204); //makes the background stay uncoloured from trail

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
   frameRate(10);
rect(x-10, y-80, 10,10);
rect(x-35, y-90, 12,12);
rect(x+78, y-90, 17, 17);
}

