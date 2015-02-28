
void setup(){
  size(200,200);
  background(150,75,220);
  strokeWeight(3);
  smooth();
}
void draw(){
 stroke(220,150,random(75));
line(200,200,random(400),random(400));
stroke(75,random(150),250);
line(70,70,random(400),random(400));
stroke(250,150,random(50));
line(150,250,random(400),random(400));
stroke(150,0,random(0));
line(50,100,random(400),random(400));
stroke(100,255,random(0));
line(100,100,random(400),random(400));
}
