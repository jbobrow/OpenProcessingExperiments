
size(200, 200);
background(255);
int i;
for (i=-120;i<210;i+=20) {
fill(0);
ellipse(i+100, i*i/150+100, 4, 4);
if (i<100 && i>1) {
fill(0, 0, 0, i);
ellipse((i+30)*1.3, 60, 40, 40); 
}
}
