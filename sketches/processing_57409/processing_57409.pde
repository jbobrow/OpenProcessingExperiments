
PImage disco;
PImage party;
int x=150;
int direction=1;
int speed = 2;

void setup() { 
 size(600,300);
smooth();
strokeWeight(1);
//background(168,242,10); //background colour

disco = loadImage("disco.jpg");
party = loadImage("danceparty.jpg");



}

void draw() { 
  image(disco,0,0);


 
  if (keyPressed) {
    x=x+speed;
  }
 
  if (x>width) {
    x=0;
  }
 
 
 

  if (mousePressed){
 
  stroke(random(255),random(255),random(255));
  line(x+115, 180, mouseX, mouseY); 
  float mx = mouseX/3; 
  line(x+115, 180, mx, mouseY); 
  
}


//HEAD
smooth();
stroke(255,255,255);
fill(0);

if (mouseX<width/2){
ellipse(x,117,75,75);  
strokeWeight(2);
fill(255);
rect(x-20,110,15,12);
rect(x+20,110,15,12);
line(x-35,116,x-20,116);
line(x-5,116,x+20,116);
strokeWeight(4);
point(x+10,140);
}

if (mouseX>width/2){
ellipse(x,117,75,75);  
strokeWeight(2);
fill(75,222,63);
rect(x-20,110,15,12);
rect(x+20,110,15,12);
line(x-35,116,x-20,116);
line(x-5,116,x+20,116);
strokeWeight(3);
fill(255);
ellipse(x+10,140,10,15);
}



//NECK
strokeWeight(2);
  fill(205, 205, 193);
  rect(x-10, 160, 20, 5); //(x,y, width, height)
  rect(x-10, 170, 20, 5);
  rect(x-10, 180, 20, 5);

strokeWeight(3);
stroke(255,255,255);
//BODY
fill(0);
triangle(x-75, 190, x, 255, x+75, 190);

strokeWeight(2); //stroke thickness
//WHEELS
 ellipse(x-15, 260, 17, 17);
  ellipse(x+15, 260, 17, 17);



//ARMS

//RIGHT
 line(x+66, 200, x+110, 210);
  line(x+62, 205, x+107, 215);
  line(x+111, 212,x+114, 180);
  line(x+114, 212, x+117, 180);
  fill(255, 153, 18);
  ellipse(x+112, 212, 10, 10);
  ellipse(x+115, 180, 11, 11);

//LEFT


if(mouseX>width/2){
line(x-105,220,x-100,190);
line(x-108,220,x-103,190); 
ellipse(x-100,190,10,10);

}  

if(mouseX<width/2){
  line(x-105,220,x-127,190);
  line(x-108,220,x-130,190);
  ellipse(x-126,190,10,10);
}


line(x-64,202,x-106,220);
line(x-61,207,x-104,225);
ellipse(x-105,223,10,10);



}

