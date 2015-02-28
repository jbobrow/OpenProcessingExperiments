
int startX = 150;
int stopX = 230;
int startY = 400;
int stopY = 100;
float x = startX;
float y = startY;
float step = 0.007;
float mx= mouseX/10;
float pct = 0.0;
float angle =0.0;

int time1= 2000;
int time2= 8000;
int time3= 12000;

PImage img1;


void setup(){
  size(500,500);
  smooth ();
  img1= loadImage ("whitecar.svg");
  noStroke ();
}
void draw (){
   background (127,178,241);
     fill(1,70,0);
  rect(0,100,500,400);
 fill(89,89,89);//road
  beginShape();
  vertex(0,500);
  vertex(200,100);
  vertex(300,100);
  vertex(500,500);
  endShape(CLOSE);
  

fill(79,122,200);
 
  for (int x = 60; x < width; x += 2)
  {
float mx = mousePressed;//rain movement
float offsetA = random(-mx*500, mx*500);
float offsetB = random(-mx*500, mx*500);
beginShape();
fill(79,122,200);//rain
   vertex (250+offsetA,250-offsetB);
   vertex (251+offsetA,245-offsetB);
   vertex (252+offsetA,240-offsetB);
   vertex (251+offsetA,245-offsetB);
   vertex (252+offsetA,250-offsetB);
   vertex (251+offsetA,252-offsetB);
   endShape(CLOSE);
   noStroke();
  }
  fill(89,89,89);
  rect(250,250,50,50);
  int currentTime=millis();
  textSize(30);
  
  fill(0);
  textAlign(CENTER);
  if (currentTime>time1){//car movement
         if (pct<1.0){
  x = startX+((stopX-startX)* pct);
   y = startY+((stopY-startY)*pct);
    pct += step;
 }
 rect (x,y,y/2+10,y/2);
 //image (img1,x,y,y/2+10,y/2+10);
    }
  else {
    text("Ready...Set...Go!",200,60);
  }
      translate(mouseX,mouseY);
      scale(sin(angle)+1);
  fill(255,204,0);
   ellipse(mouseX,mouseY,50,50);
   angle +=0.1;
}


