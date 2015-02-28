
float c1=255;
float c2=255;
float c3=255;
float x=0;
float angle=0;
float fr = 60;
float r = 0;
void setup()
{
 size(250,250);
 background(0);
 noStroke();
 smooth();
}

void draw(){
  
frameRate(fr);
 float d = dist(mouseX, mouseY, pmouseX, pmouseY);
float r = random(-20, 10);
  translate(mouseX, mouseY); 
 fill(100, 1);
 
 ////////////////////////////////////
 rectMode(CENTER);
 rect(0,0, height*2, width*2);
 ////////////////////////////////////
 
 fill(c1,c2,c3, 150);
 
  x += 0.09;
 rotate(x);

 
 ////////////////////////////////////
 rectMode(CORNER);
 
 rect(0,0, 3, (20+d*5)+r);
  fill(0, 1);

 ////////////////////////////////////

 if(keyPressed) {
   if (key == 'q'){
   fr += 2; 
   }
 
 }
 if(keyPressed) {
   if (key == 'w'){
   fr -= 2; 
   }
 
 }
 ///////////////////////
 if(keyPressed) {
   if (key == 'a'){
   x += .2;
   }
 }
if(keyPressed) {
   if (key == 's'){
   x -= .2;
   }
 }

}

 void keyPressed(){
   if(key == ' '){
c1=random(255);
c2=random(255);
c3=random(255);
}
 }              
