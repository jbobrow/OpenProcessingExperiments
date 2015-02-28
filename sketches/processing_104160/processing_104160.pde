
int red=70;
int green=35;
int blue=35;
float a;

void setup() {
  size(600,600);
  frameRate(30);
}

void draw() {
  background(red,green,blue);
  
  if(blue<255)blue+=2;
  if(green<150)green++;
  if(red<50)red++;

  noStroke();
  fill(255,255,0);
  ellipse(80,a,60,60);
  a=a-5;
  if(a<0){
    a=height;
  }
  
   if(a<50) {
     noLoop();
   }
   
   
   for(int f=20;f<610;f+=75) {
   fill(100,250,50,180);
   ellipse(f,460,30,50);
 }
 
 for(int k=19;k<610;k+=75) {
   stroke(190,10,190);
   line(k,486,k,500);
 }
  noStroke();
  fill(50,250,100);
  rect(0,500,600,100);
   
   stroke(0);
   fill(0,180);
   rect(250,200,70,300);
   rect(320,300,70,200);
   rect(390,400,70,100);
   rect(180,280,70,220);
   
   for( int z=200 ; z<500 ;z+=5) {
     if (z < 300) {
       line(250,z,320,z);
     } else if (z<400) {
       line(250,z,390,z);
     } else {
       line(250,z,460,z);
     }
 }
 
 fill(0);
 rect(275,450,20,50);
 
 noStroke();
fill(255,130);
ellipse(300,100,200,60);
ellipse(400,120,150,40);
ellipse(445,80,170,50);
 
 

 
}
