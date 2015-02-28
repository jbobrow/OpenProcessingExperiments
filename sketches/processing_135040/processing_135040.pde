
float r1=0;
float g1=0;
float b1=0;
float rad1=0;

int xC=0;
int counter;
int yC=0;

void setup(){
   size(500,500);
   fill(255,255,255);
   frameRate(5);
   colorMode(HSB);
   counter=0;
   
}

void draw(){
 noStroke();
 color one=color(random(255),250,100,15);
 color two=color(random(255),250,100,5);

 for(int k=0;k<7;k++){
    for(int l=0; l<7;l++){
     fill(two);
     xC=80*k+40;
     yC=80*l+40;
     
     ellipse(xC,yC,rad1*sin(counter),rad1*sin(counter));
      
    }
 }
 
 
 
for(int i=0;i<7;i++){
     for(int j=0; j<7;j++){
       xC=80*i;
       yC=80*j;
 r1=random(0,255);
 g1=random(0,255);
 b1=random(0,255);
 rad1=80;
 fill(one);
 ellipse(xC,yC,rad1*sin(counter),rad1*sin(counter));
 counter++;
 
 
 
}}}
