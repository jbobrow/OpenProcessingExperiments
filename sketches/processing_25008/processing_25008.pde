
float c1=255;
float c2=255;
float c3=255;
float x=0;
float angle=0;

void setup(){
  strokeWeight(5);
 frameRate(30);
 size(250,250);
 background(0);
 smooth();
 noCursor();
}

void draw(){

fill(0, 1);
 noStroke();
 ////////////////////////////////////
 rectMode(CENTER);
 rect(0,0, height*2, width*2);
 ////////////////////////////////////
 noFill();
 stroke(c1,c2,c3, 150);

  translate(mouseX, mouseY); 
  
  x += 0.3;
 rotate(x);

 
 ////////////////////////////////////
 rectMode(CORNER);
 float x1 = dist(mouseX, mouseY, pmouseX, pmouseY);

 rect(0,0, 10+x1, 10+x1);
 ////////////////////////////////////

}

 void keyPressed(){
   if(key == ' '){
 c1=random(255);
 c2=random(255);
 c3=random(255);
}
 }                              
