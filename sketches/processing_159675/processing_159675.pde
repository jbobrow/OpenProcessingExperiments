
size(800,800);
colorMode(HSB);
background(214,60,42);

stroke(0);
double gradient=100;
//Blue speckled background (intentionally pixelated and mosaic-ed)
for (int i=0; i<width;i+=5){
  for (int j=0;j<height;j+=5){
    fill(150,86,(int)(random((int)(100-gradient))+gradient));
    rect(i,j,5,5);
    
  }
gradient-=.8;
}
  
//Moon

int x=height/2+100;
int y=height/2-150;
fill(0,0,360);
strokeWeight(3);
ellipse(x,y,300,300);
fill(0,0,225);
noStroke();
ellipse(x-91,y+35,30,30);
ellipse(x+17,y+10,35,35);
ellipse(x-12,y+80,10,10);
ellipse(x-30,y+42,5,5);
ellipse(x+100,y+35,30,30);
ellipse(x+120,y,30,30);
ellipse(x+75,y-60,30,30);
ellipse(x+42,y-42,30,30);

ellipse(x+91,y+35,30,30);
ellipse(x-17,y-10,35,35);
ellipse(x+12,y-80,10,10);
ellipse(x-30,y-42,5,5);
ellipse(x-100,y-35,30,30);
ellipse(x-120,y+25,30,30);
ellipse(x-75,y+60,30,30);
ellipse(x-42,y+42,30,30);


//Cloud 1
fill (191,1,67,200);
int a=height/2;
int b=width/2;

for (int i=0; i<random(10,20); i++){
a=(int)(height/2+random(-400,400));
b=(int)(width/2+random(-400,400));

beginShape();
curveVertex(a,b);
a+=(int)random(0,30);
b+=(int)random(-40,40);
curveVertex(a,b);
a+=(int)random(-25,40);
b+=(int)random(-40,75);
curveVertex(a,b);
a+=-10;
b+=-(int)random(0,30);
curveVertex(a,b);
a+=(int)random(-12,10);
b+=40;
curveVertex(a,b);
a+=(int)random(0,100);
b+=20;
curveVertex(a,b);
a+=-50;
b+=-(int)random(-40,40);
curveVertex(a,b);
a+=30;
b+=(int)random(-3,50);
curveVertex(a,b);
a+=10;
b+=(int)random(0,1)*200;
curveVertex(a,b);
a+=-10;
b+=(int)random(25,50);
curveVertex(a,b);
a+=300;
b+=-100;
curveVertex(a,b);
a+=(int)random(-100,50);
b+=90;
curveVertex(a,b);
a+=75;
b+=50;
endShape();
}


