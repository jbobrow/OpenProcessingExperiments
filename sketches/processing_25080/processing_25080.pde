
float c1=255;
float c2=255;
float c3=255;

void setup(){
  smooth();
  size(250, 250);
  }

void draw(){
  frameRate(120);
  fill(0, 1);
  rectMode(CENTER);
  rect(height/2, width/2, height+50, width+50); 
 

  noStroke();
  fill(c1, c2, c3, 15);
  float s2 = random(20, 40);
  float a = 0;
  a += 70; 

  if(keyPressed) {
   if (key == 'a'){
   a += 40;
   }
 }
if(keyPressed) {
   if (key == 's'){
   a -= 10;
   }
 }

 
  ellipse(random(0, 500),random(0, 500), s2+a, s2+a);
 
}
 
 void keyPressed(){
   if(key == ' '){
c1=random(255);
c2=random(255);
c3=random(255);
}
 }              
