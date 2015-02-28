
//Assignment 3.2 _ Drawing Machine Mock-up
//Wylie Robinson _ Srping 2011

//import processing.pdf.*;

void setup (){
  size (500,300);
  background (255);
  smooth ();
 // beginRecord(PDF, "Robinson_Project1_25.pdf");
}

int x=0;

void draw (){
  if (x%2==0){    //if second is even draw left
    stroke(.25);
    noFill();
    ellipse(width/4,height/2,random(width/2.5),random(height/1.5));
  } else {    //if second is odd draw right
    ellipse(3*width/4,height/2,random(width/2.5),random(height/1.5));
  }
  x++;
  if (x>=25){
    //endRecord();
    //exit();
    noLoop();
  }
}

