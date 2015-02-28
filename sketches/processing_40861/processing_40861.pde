
int a= 1000;

void setup()
{size(a,a/2);
}
void draw()
{
  background(0);
   smooth();
   
stroke(200,100);
for (int l = mouseX-950; l<2000; l+=200) {
  for (int l2 = mouseY-850; l2<500; l2+=100) {
line (l,l2,500,250);

}
}

stroke(200,75);
for (int l3 = mouseX-850; l3<2000; l3+=200) {
  for (int l4 = mouseY-850; l4<500; l4+=100) {
line (l3,l4,500,250);

}
}

noStroke();
fill(50,250);
for (float e = mouseX/4-250-12.5; e<2000; e+=50) {
  for (int f = mouseY/4-125; f<2000; f+=50){
rect (e,f,25,25);
}
}

fill(150,250);
noStroke();

for (int b = mouseX/2-525; b<4000; b+=100) {
  for (int c = mouseY/2-200; c<4000; c+=100){
rect (b,c,50,50);
}
}

fill(255,250);
for (int x = mouseX-950; x<2000; x+=200) {
  for (int y = mouseY-650; y<2000; y+=200){
rect (x,y,100,100);
}
}



stroke(255);
line(500,250,500,245);
line(500,250,504,250);
line(500,250,500,255);
line(500,250,495,250);
}








