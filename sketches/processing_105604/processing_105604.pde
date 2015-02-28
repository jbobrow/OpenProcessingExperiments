
//Anay Patel
//Creature Movement: Has your creature follow your mouse.
//08/05/2013

void setup(){
size(500,500);
  }

import java.util.Scanner;

void draw(){
  myBoredCreature()
}

void myBoredCreature(){
      background(0,0,0);  
  int originX = mouseX-200;
  //body
fill(128,128,90);
ellipse(originX+250,mouseY+250,250,350);

//head
fill(200,0,0);
ellipse(originX+250,mouseY+50,100,100);

//face
fill(128,0,128);
ellipse(originX+230,mouseY+30,15,7);
ellipse(originX+270,mouseY+30,15,7);
fill(0,128,0);

//arms
fill(128,0,128);
ellipse(originX+140,mouseY+190,50,50);
ellipse(originX+360,mouseY+193,50,50);

//legs
fill(128,0,128);
rect(originX+190,mouseY+380,25,100);
rect(originX+290,mouseY+380,25,100);
}

void myHappyCreature(){
      background(0,0,0);  
    int originX = mouseX-200;
  //body
fill(128,128,90);
ellipse(originX+250,mouseY+250,250,350);

//head
fill(200,0,0);
ellipse(originX+250,mouseY+50,100,100);

//face
fill(128,0,128);
ellipse(originX+230,mouseY+30,15,7);
ellipse(originX+270,mouseY+30,15,7);
fill(0,128,0);

//arms
fill(128,0,128);
ellipse(originX+140,mouseY+190,50,50);
ellipse(originX+360,mouseY+193,50,50);

//legs
fill(128,0,128);
rect(originX+190,mouseY+380,25,100);
rect(originX+290,mouseY+380,25,100);
}
