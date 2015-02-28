
size (200, 200);
background (255);
 
void draw (){
for (int i=20; i<180; i=i+20)
for (int j=20;j<180;j=j+20)
{
if (j>100 && j<140 && i>60 && i <120) 
stroke (250,50, 0); 
else {
stroke(0);
}
ellipse (i, j, 10, 8);
stroke(0);
if (j<140) {
line (i, j+5, i, j+40);
}
if (i<150) {
line (i+5, j, i+20, j);
}
}}
