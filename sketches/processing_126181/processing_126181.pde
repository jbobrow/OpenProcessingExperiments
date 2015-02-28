
//www.lby.me

int sizeX = 1920;
int sizeY = 1080;
int count = 200;
 
float[] x= new float[count];
float[] y= new float[count];
float[] sx= new float[count];
float[] sy= new float[count];
float[] s=  new float[count];

int i;
int j;
float d;
float c;


 void setup(){
   size(sizeX,sizeY);
   smooth();
   
   
   for(i=0;i<count;i++){
     x[i] = random(0,sizeX);
     y[i] = random(0,sizeY);
     sx[i] = random(-1,1);
     sy[i] = random(-1,1);
     s[i] = random(5,10);
   }
   
 }
 
 void draw(){
   background(0);
   noStroke();
   for(i=0;i<count;i++){
     c = (s[i]-5)/5*255;
     fill(c);
     ellipse(x[i],y[i],s[i],s[i]);
     x[i] += sx[i];
     y[i] += sy[i];
     if(x[i]<0) x[i] += sizeX;
     if(y[i]<0) y[i] += sizeY;
     if(x[i]>sizeX) x[i] -= sizeX;
     if(y[i]>sizeY) y[i] -= sizeY;
   }
   
   for(i=0;i<count;i++){
     if((mouseX-x[i])*(mouseX-x[i])+(mouseY-y[i])*(mouseY-y[i])<30000){
       stroke(255);
       line(mouseX,mouseY,x[i],y[i]);
     }
     for(j=i+1;j<count;j++){
       d = (x[i]-x[j])*(x[i]-x[j])+(y[i]-y[j])*(y[i]-y[j]);
       if(d<s[i]*s[j]*100){
         c = d/10000*255;
         stroke(c);
         line(x[j],y[j],x[i],y[i]);
       }
     }
   }
 }
 
 void changeSize(int x, int y){
   size(x,y);
   sizeX = x;
   sizeY = y;
 }

 
