
size(250, 250);
background(98,255,222);
smooth();

for(int y=-10; y<=300; y+=70){
  for(int x=-10; x<=300; x+=70){
    fill(100,100);
ellipse(x,y,96,96);}}



    strokeWeight(0.45);
stroke(255, 200);
for(
int i=0; i<250; i+=6)
for(
int j=0; j<250; j+=6)
{
  line(i,j,i+random(10),j+5);
  line(i,j,i-random(10),j+5);
}


for(int y=0; y<=270; y+=20){
  for(int x=0;x<=270; x+=20){
    fill(214,191,255,30);
    ellipse(x,y,40,40);}}




