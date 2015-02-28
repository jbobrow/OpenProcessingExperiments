
size (200 ,200);
colorMode (HSB ,27 ,1.0 ,1.0);
for (int i = 0; i < 360; i++) {
stroke(i, 1, 1); // Matiz i
line(i, 0, i, 100);
for (float j = 0.0; j <= 1; j+=0.01) {
stroke (i,j ,1); // Saturação j
point (i ,100+100* j);
stroke (i,1,j); // Valor j
point (i ,200+100* j);
}
 
}
 
 
stroke(13,9,152);
strokeWeight(05);
int x=10 ;
int y=10;
for(x=05;x<200;x=x+10)
{
    for(y=10;y<200;y=y+20)
    {point(x,y);}
}
