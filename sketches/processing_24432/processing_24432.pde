
//Written by Levi Berge 21/03/2011

//import processing.pdf.*;

void setup (){
  size (500, 1000);
  //beginRecord(PDF, "BubblesFinal.pdf");
  background(0, 0, 100);
  smooth ();
  //frameRate (1);
  }

void draw (){

stroke(0, 0, 80);
strokeWeight(3);
int count = 0;
while (count <32){
float d = random(300);
fill(100, 100, 255, 100);
ellipse(random(500), random(1000), d, d);
count = count + 1;
}

int count2 = 0;
while (count2 <15){
float d = random(120);
fill(100, 100, 255, 150);
ellipse(random(500), random(1000), d, d);
count2 = count2 + 1;
}
noLoop();

//endRecord();
}


