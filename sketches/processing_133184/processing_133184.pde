
void setup(){
size(600, 400);
background(#E5568A);
strokeWeight(0.5);
frameRate(4.5);
smooth();
}
void draw()
{
translate (width/2, height/2);
pushMatrix();
fill(#FFF758);
for(int i=0; i<300; i=i+2)
{
 float myAngle = random (500, 300);
 rotate(radians(myAngle));
 float rectSize = map(i,0,300,50,10);
 rect(0,0, rectSize, rectSize);

}
popMatrix();

translate (width/4, height/4);
pushMatrix();
fill(#7858FF);
for(int i=0; i<300; i=i+2)
{
 float myAngle = random (500, 300);
 rotate(radians(myAngle));
 float rectSize = map(i,0,300,50,10);
 rect(0,0, rectSize, rectSize);
}
popMatrix();

translate (-375, -255);
pushMatrix();
fill(#50FFA3);
for(int i=0; i<300; i=i+2)
{
 float myAngle = random (500, 300);
 rotate(radians(myAngle));
 float rectSize = map(i,0,300,50,10);
 rect(0,0, rectSize, rectSize);
}
 popMatrix();


translate(230,300);
pushMatrix();
fill(#FFFFFF);
for(int i=0; i<300; i=i+2)
{
 float myAngle = random (500, 300);
 rotate(radians(myAngle));
 float rectSize = map(i,0,300,50,10);
 rect(0,0, rectSize, rectSize);
}
 popMatrix();

translate(300,125);
fill(#92CCFA);
pushMatrix();
for(int i=0; i<300; i=i+2)
{
 float myAngle = random (500, 300);
 rotate(radians(myAngle));
 float rectSize = map(i,0,300,50,10);
 rect(0,0, rectSize, rectSize);
}
 popMatrix();
 
 
translate(-180, -330);
fill(#D5A5F7);
for(int i=0; i<300; i=i+2)
{
 float myAngle = random (500, 300);
 rotate(radians(myAngle));
 float rectSize = map(i,0,300,50,10);
 rect(0,0, rectSize, rectSize);
}

 
translate(-120, -70);
fill(#3B3A35);
for(int i=0; i<300; i=i+2)
{
 float myAngle = random (500, 300);
 rotate(radians(myAngle));
 float rectSize = map(i,0,300,50,10);
 rect(0,0, rectSize, rectSize);
}

translate(-320, -170);
fill(#14551E);
for(int i=0; i<300; i=i+2)
{
 float myAngle = random (500, 300);
 rotate(radians(myAngle));
 float rectSize = map(i,0,300,50,10);
 rect(0,0, rectSize, rectSize);
}
translate(-420, -230);
fill(#F06722);
for(int i=0; i<300; i=i+2)
{
 float myAngle = random (500, 300);
 rotate(radians(myAngle));
 float rectSize = map(i,0,300,50,10);
 rect(0,0, rectSize, rectSize);

}
translate(-580, -330);
fill(#C6230A);
for(int i=0; i<300; i=i+2)
{
 float myAngle = random (500, 300);
 rotate(radians(myAngle));
 float rectSize = map(i,0,300,50,10);
 rect(0,0, rectSize, rectSize);
}
}


