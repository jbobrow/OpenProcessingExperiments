
int[] i={4,10,5,8};int x=0;void setup(){frameRate(10);size(900,600);background(255);}void draw(){if(x<i.length-1)x++;else x=0;cursor(i[x]);}

