
float r1=0;
float g1=0;
float b1=0;
float rad1=0;
float K=random(5,25);



float R=random(0,255);
float G=random(0,255);
float B=random(0,255);
int xC=0;
int counter;
int yC=0;

void setup(){
   size(928,500);
   fill(255,255,255);
   frameRate(50);
   colorMode(HSB);
   counter=0;
   
}

void draw(){
 noStroke();
 R=random(255);
 G=random(255);
 B=random(255);
 color one=color(R,G,B,K);
 color two=color(R,G,B,floor(K/3));
 
for(int i=0;i<13;i++){
     for(int j=0; j<7;j++){
       xC=80*i;
       yC=80*j;
 r1=random(0,255);
 g1=random(0,255);
 b1=random(0,255);
 rad1=80;
 fill(one);
 ellipse(xC,yC,rad1*sin(counter),rad1*sin(counter));
 fill(two);
 ellipse(xC+40,yC+40,rad1*sin(counter),rad1*sin(counter));
 counter++;
 
 
 
}}



}
