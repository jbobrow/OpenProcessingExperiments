
size(700, 700);
background(176, 240, 246);
smooth();
int spark=45;
int l=5;
int e=20;
strokeWeight(6);
strokeCap(PROJECT);
stroke(138, 43, 240);
line(spark*1, spark*1+l*0, spark*1+555+l*1, spark*1+e*0);
line(spark*2, spark*2+l*2, spark*2+555+l*2, spark*2+e*1);
line(spark*3, spark*3+l*4, spark*3+555+l*3, spark*3+e*2);
line(spark*4, spark*4+l*8, spark*4+555+l*4, spark*4+e*3);
line(spark*5, spark*5+l*16, spark*5+555+l*5, spark*5+e*4);
line(spark*6, spark*6+l*32, spark*6+555+l*6, spark*6+e*5);
line(spark*7, spark*7+l*64, spark*7+555+l*7, spark*7+e*6);
line(spark*8, spark*8+l*128, spark*8+555+l*8, spark*8+e*7);
noStroke();
fill(216, 191, 216);
ellipse(width/7-100, 6*height/7, 40, 40);

