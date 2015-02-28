
void setup ()
{
size (200, 200);
 
}
 
void draw (){
for (int a=20; a<200; a=a+20)
for (int b=30;b<200;b=b+20)
{
if (b>120 && b<160 && a>80 && a <150)
 
stroke (#1476C4);
 
else {
stroke(0);
}
ellipse (a, b, 5, 4);
stroke(0);
if (b<180) {
line (a, b+5, a, b+15);
}
if (a<190) {
line (a+5, b, a+15, b);
}
}}
