
void setup(){
size(400,400);
}
void draw(){
fill (mouseX,mouseY,pmouseX,pmouseY);
background (125,250);
//light

line (0,0,400,400);
noStroke ();
float r = random (1,10);
fill (255,255,255, mouseY/1.4);
for (int i=5; i <=50; i+=5) {
  for (int j=10; j<=50; j+=5) {
    triangle (20*i,20*j,i,i,2/i,2/i);
}
}
//fan
stroke (0,0,0);
strokeWeight (1);
stroke (170,170,220);
fill (125,159,250,mouseX);
for (int i=10; i <=100; i+=10) {
  for (int j=10; j<=100; j+=10) {
    triangle (2.5*i,2.5*j,j,i, 2/i,2/j);
  }
}
fill (200,200,255, mouseY/2);
triangle (1,1,350,350, mouseX*2,mouseY*2);

}

