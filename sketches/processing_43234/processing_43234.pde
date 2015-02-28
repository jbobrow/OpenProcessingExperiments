
//Author: Herbert Hsu
//Purpose: practice to make bouncing balls within the canvas
//Functioning: once a ball hits the boundry, the circle in the middle enlarges. 
//Reference: demos from Nik

float[]x=new float[3];
float[]y=new float[3];
float[]w=new float[3];
float[]h=new float[3];
float[]d=new float[3];
float a;

void setup(){
size (600, 400);
smooth();
for(int i=0;i<3;i++){
x[i]=random(width);
y[i]=random(height);
w[i]=random(10);
h[i]=random(10);

  ellipse(x[i],y[i],50,50);
}
 
}

void draw(){
  background(200);
 for(int i=0;i<3;i++){
   if (x[i]<25||x[i]>width-25){
   w[i]=-w[i];
   a+=5;
   //the effect is not good
   ellipse(300,200,a,a);
   }
   if(y[i]<25||y[i]>height-25){
   h[i]=-h[i];
   a+=5;
   ellipse(300,200,a,a);
   }
 fill(30,70,80);  
 x[i]=x[i]+w[i];
 y[i]=y[i]+h[i];
  ellipse(x[i],y[i],50,50);
 }
  
}

