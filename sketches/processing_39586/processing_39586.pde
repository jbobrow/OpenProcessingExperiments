
float r= random(10,255);
float g=random (10,255);
float b=random (10,255);
float o= random(10,160);

void setup(){
 size(600, 400);
 background(255);
 smooth();
}
 
void draw(){
 frameRate(5);
 noStroke();
 fill(255,50);
 
 if (mousePressed) {
 
  fill(r,g,b,o);
 stroke(0);
 strokeWeight(random(1,25));
 bezier(0,height/2,random(0,width),random(0,height),random(0,width),random(0,height),width,height/3);
}
else {
fill(r,g,b,o);
strokeWeight(random(5,25));
 bezier(0,height/2,random(0,width),random(0,height),random(0,width),random(0,height),width,height/3);
}}

void keyPressed(){
  if(key =='s'){
    saveImage();}
   
}




