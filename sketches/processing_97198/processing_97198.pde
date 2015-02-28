
void setup () 
{
size (200, 200);
background (255);

}

void draw (){
for (int i=30; i<180; i=i+30) 
for (int j=40;j<180;j=j+30) 
{
if (j>100 && j<140 && i>60 && i <130)

stroke (0,255, 0);

else {
stroke(0);
}
ellipse (i, j, 10, 8);
stroke(0);
if (j<140) {
line (i, j+5, i, j+30);
}
if (i<150) {
line (i+5, j, i+30, j);
}
}}
