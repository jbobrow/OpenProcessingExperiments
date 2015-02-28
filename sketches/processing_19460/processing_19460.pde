
size(250, 250);
background(255,70,70);
smooth();




smooth();
stroke(139,110,178);
fill(255,50);
ellipse(0,250,180,180);
fill(255, 80);
ellipse(0,250,130,130);
fill(255,120);
ellipse(0,250,80,80);
fill(255,200);
ellipse(0,250,40,40);
fill(255,190);
ellipse(100,180,60,60);
fill(255,75);
ellipse(120,120,60,60);
fill(255,90);
ellipse(120,120,45,45);
fill(255,180);
ellipse(120,120,15,15);
fill(255,100);
ellipse(170,45,80,80);
fill(255,130);
ellipse(170,45,65,65);
fill(255,250);
ellipse(170,45,20,20);
fill(255,50);
ellipse(220,103,20,20);
fill(255,190);
ellipse(220,103,13,13);
fill(255,250);
ellipse(235,188,30,30);
fill(255,80);
ellipse(100,180,100,100);
fill(255, 90);
ellipse(100,180,90,90);
fill(255,105);
ellipse(130,76,30,30);
fill(255,150);
ellipse(130,76,22,22);
fill(255,250);
ellipse(130,76,15,15);
fill(255,200);
ellipse(170,45,40,40);
fill(255,150);
ellipse(230,65,58,58);
fill(255,190);
ellipse(230,65,24,24);
fill(255,180);
fill(255,80);
ellipse(235,188,140,140);
fill(255,100);
ellipse(235,188,120,120);
fill(255,150);
ellipse(235,188,70,70);



    strokeWeight(0.25);
stroke(255, 200);
for(
int i=0; i<280; i+=15)
for(
int j=0; j<280; j+=15)
{
  line(i,j,i+random(5),j+2);
  line(i,j,i-random(5),j+2);
}
//white lines in the background

for(int y=0; y<=270; y+=55){
  for(int x=0;x<=270; x+=55){
    fill(214,191,255,30);
    ellipse(x,y,30,30);}}
//small circles in the background



