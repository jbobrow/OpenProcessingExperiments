

float r = 100;
float g = 221;
float b = 180;
PImage img;

void setup(){
  size(1290,900);
  background(255);
  
  img = loadImage("003.png");
}

void draw(){
  background(r, g, b);
  if (mouseX > width/2) {
    r = r + 1;
  } 
  else {
    r = r - 1;
  }

  if (r > 255) {
    r = 255;
  } 
  else if (r < 0) {
    r = 0;
  }

image(img,0,0);

frameRate(10);
noFill();
ellipse(250,412,260,260);
ellipse(991,412,260,260);
stroke(random(255),random(255),random(255));
strokeWeight(5);



if (mouseButton==RIGHT){
   
  fill(255,0,random(255));
    ellipse(129,206,30,30);
    ellipse(269,205,30,30);
    ellipse(700,201.5,30,30);
    ellipse(926,204,25,25);
    
     ellipse(457.5,362,25,25);
     ellipse(537.5,362,25,25);
     ellipse(700,361,25,25);
     ellipse(782,361,25,25);
     
     rect(438,542,37,20);
     rect(519,542,37,20);
     
      fill(255,255,random(255));
     ellipse(458,417,25,25);
     ellipse(537,418,25,25);
     ellipse(619,418,30,30);
     ellipse(700,418,30,30);
     ellipse(782,418,25,25);
      rect(600,542,37,20);
      rect(680,542,37,20);
     
     fill(0,255,random(255));
     ellipse(458,480,30,30);
     ellipse(537,480,30,30);
     ellipse(700,480,30,30);
     ellipse(782,480,30,30);
     ellipse(1031,611.5,30,30);
     rect(762,542,37,20);
    
    
    noStroke();
 
 /*  noStroke();
  strokeWeight(5);
  rect(180,64,85,47);
  rect(430,35,120,47);
  rect(675,58,140,57);
*/


}


if (mouseButton==LEFT){
  
    fill(0,0,random(255));
    ellipse(200,204,30,30);
    ellipse(340.2,204.5,30,30);
    ellipse(455.7,201.8,30,30);
    
    ellipse(537,203,25,25);
    ellipse(618,203,25,25);
     ellipse(782,202,25,25);
     ellipse(856,204,25,25);
     
     ellipse(996,204,25,25);
     ellipse(1067,204,25,25);
     
     
     ellipse(455.7,292,25,25);
     ellipse(537,292,25,25);
     ellipse(619,292,30,30);
     ellipse(700,292,30,30);
     ellipse(782,292,25,25);
     
     ellipse(207,611.5,34,34);
     ellipse(372,611.5,34,34);
     ellipse(866,611.5,34,34);
     
    
     
     
     
    noStroke();
  
/*  noFill();
  stroke(0,0,255);
  strokeWeight(3);
  rect(280,64,65,47);
  rect(370,65,120,60);
  */
}  



/*
ellipse(mouseX,mouseY,30,30);
fill(#ff0000);
stroke(255,255,0);
strokeWeight(5);
*/



}





