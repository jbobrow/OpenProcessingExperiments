
void setup(){
 size(600, 400);
 background(0);
 smooth();
}
 
void draw(){
 frameRate(8);
 fill(0,30);
 rect(0,0,width,height);
  
 stroke(255);
 strokeWeight(2);
 bezier(mouseY,height/2,random(0,width),random(0,height),random(0,width),mouseY+random(height),width,height/2);
}


