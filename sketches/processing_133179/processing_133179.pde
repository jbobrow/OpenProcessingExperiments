
void setup(){
  size(800,150);
smooth();
frameRate(100);
strokeWeight(0.5);
background(255,255,255);
}

void draw(){

translate(width/2+200,height/2);

for(int s = 0; s<10; s++) {
 // pushMatrix();

for(int i = 0; i<72; i++) {
  float myAngle = random(-10,0);
  rotate(radians(myAngle));
  float ellipseSize = map (s,0,10,5,100);
  stroke(int(random(0,i)),int(random(i,255-i)),int(random(0,i)),10);
{
  if(i < 10) {
    stroke(int(random(20,i+20)),int(random(i+100,255)),int(random(240,i+90)),50);
  }else{
    stroke(int(random(180,i+400)),int(random(i,70)),int(random(220,i+70)),10);
  }
}

line(0,0,ellipseSize,ellipseSize*15);
  translate(mouseX,mouseX+1);
}
//popMatrix();
}
}



