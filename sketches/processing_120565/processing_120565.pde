
void setup()
{
size(500, 500);
}
void draw(){
translate(width/2, height/2);
for (int d=0; d<360; d+=20) { 
pushMatrix();
rotate(radians(d)); 
translate(0, 100); 
fill(#B62319);
ellipse(0, 0, 10, 180);
popMatrix();
}

for (int a=0; a<360; a+=20) {
pushMatrix();
rotate(radians(a));
float lol = map(mouseX, 0, width, 0, 2*PI);
translate(width/2, height/2);
rotate(200+lol);
rectMode(CENTER);
fill(#000000);
rect(0, 0, 150, 280);
rect(0, 0, 35, 35);
popMatrix();
}

fill(#ffffff);
ellipse(0,0, 50,50);
}
