
void setup(){
  size(250,250);
background(0);
smooth();
}
 
void draw(){
 
 strokeWeight(random(2));
 noFill();
stroke(12,139,196, 70);
frameRate(2);
bezier(0,0,random(150),random(150),random(150),random(150), 250,0);
 
 
strokeWeight(1);
 noFill();
stroke(219,247,7, 65);
frameRate(2);
bezier(0,250,random(200),random(200),random(200),random(200),250,250);
 
}

