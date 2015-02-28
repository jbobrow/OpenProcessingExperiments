
void setup() {size(900, 900);
background(255,255,255);}
 
void draw() {funStrokes();}
 
void funStrokes(){
for(int i=0; i<400; i=i+1000)
{frameRate(10000000);
float r =random(167);
float s =random(55);
float t =random(389);
float v=random(400);
strokeWeight(400);
stroke(i,t,v);
line(i,v,s,t);}}
void mouseDragged()
{
  fill(random (255), random (255), random (255));
  ellipse (mouseX, mouseY, 1,9  );

}
