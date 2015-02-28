
void setup() {
size(640,480);
frameRate(30);
}

void draw() {

background (0,0,0);
  
//modes
ellipseMode(CENTER);
rectMode(CENTER);

//hair
fill(100);
noStroke();
rect(mouseX,mouseY-50,1,15);

//hair
fill(100);
noStroke();
rect(mouseX+2,mouseY-50,1,15);

//hair
fill(100);
noStroke();
rect(mouseX-4,mouseY-50,1,15);

//hair
fill(100);
noStroke();
rect(mouseX-6,mouseY-50,1,15);


//body 
smooth();
fill(255);
ellipseMode(CENTER);
ellipse(mouseX,mouseY,80,100);

//belly 
fill(100);
stroke(255);
ellipse(mouseX,mouseY+20,50,55);

//right arm 
fill(100);
noStroke();
ellipse(mouseX-38,mouseY+10,10,40);

//left arm 
fill(100);
noStroke();
ellipse(mouseX+38,mouseY+10,10,40);


//right eye 
fill(255);
stroke(0);
ellipse(mouseX-14,mouseY-21,15,25);

//left eye 
fill(255);
stroke(0);
ellipse(mouseX+14,mouseY-21,15,25);

//right eye 
fill(0);
stroke(0);
ellipse(mouseX-14,mouseY-18,5,7);

//left eye 
fill(0);
stroke(0);
ellipse(mouseX+14,mouseY-18,5,7);

//beak 
fill(245,127,30);
noStroke();
triangle(mouseX-10,mouseY-5,mouseX+10,mouseY-5,mouseX,mouseY+15);

//eyelid 
fill(mouseX,0,mouseY);
noStroke();
arc(mouseX-14,mouseY-21,15,25,PI,TWO_PI);

//eyelid 
fill(mouseX,0,mouseY);
noStroke();
arc(mouseX+14,mouseY-21,15,25,PI,TWO_PI);
}






