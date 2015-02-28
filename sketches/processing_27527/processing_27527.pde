
void setup()
{
  size(500,500);
  background(0);
  smooth();
  frameRate(20);
}
float l=100;
float i=100;
float a = 20;
float b = 300;
float c = 70;
float d = 450;
float e = 200;
float r = 0;

void mousePressed(){
  
    l=pmouseX;
    i=pmouseY;
    e=mouseX;
    a=400;
    b=100;
    stroke(random(1,255),i,e/2);
   
    }
void draw()
{
  background(0);
  stroke(255,255,255,70);
  line(100,i,250,240);
  line(i,l,250,250);
  line(100,i,250,250);
  line(i,b,250/2,250/2);
  line(a,l,250,250);
  line(i,c,250/2,250);
  line(b,i,250,250/2);
  line(i,i,250,250);
  line(c,l,250/2,250);
  line(c,b,250,250);
  line(b,b,250,250/2);
  line(l,i,250,250);
  line(l,300,250/2,250);
  line(i,c,250,250);
  line(b,i,250,250/2);
  line(e,c,250,250);
  line(l,500,250/2,250);
  line(a,250,250,250);
   i=i+3;
   d=d++;
   a=a*2;
   b=b/10;
   c=c/2;
   e=e+10;
 if(c<i/20){
    a = 300;
  }
 if (i>500){
    i=random(-500,500);
    l=random(-500,500);
  } 
  if (b>500){
    b=random(0,500);
  } 
   if (c>500){
    c=-450;
  } 
   if (d>550){
   d=random(0,300);
  } 
   if (e>500){
    e=300;
   ;
  }
   for(int t=0;t<10;t=t+5){
      stroke(150,40);
      fill(150,150,150,20);
      quad(random(300,1000),random(0,500),random(30,700),random(30,700),i,250,e,250);
      quad(250,250,random(0,500),a,c,random(0,500),random(0,500),random(0,500));
  }
}


    



