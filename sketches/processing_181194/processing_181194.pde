
size(300,300);
scale(1);
background(0);
noStroke();


float mida = 160;
float inW = width/2;
float inH = 150;

ellipse(inW,inH,mida,mida);
rect(inW,inH-80,mida/2,mida/2);
rect(inW-80,inH,mida/2,mida/2);

ellipse(0,0,width,height);
ellipse(width,height,width,height);
