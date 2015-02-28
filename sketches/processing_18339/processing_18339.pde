
float s =5 ;
float s2 =10;
float s3 = 16;
float s4 = 22;
float s5 = 28;
float trans = 255;
float trans2 = 0;
float fps = 500;
float x = 50;
float x2 = 100;
float x3 = 150;
float x4 = 200;
 
void setup() {
 size(250,250);
 smooth();
 background(50,0,0);
 frameRate(fps);
}
 
void draw() {
 background(60,30,60);
 stroke(255,127);
 strokeWeight(0.5);
 line(0,125,250,125);
 line(125,250,125,0);
 fill(0,trans2);
 ellipse(width/2,height/2,10,10);
 ellipse(width/2,height/2,30,30);
 ellipse(width/2,height/2,50,50);
 ellipse(width/2,height/2,70,70);
 ellipse(width/2,height/2,90,90);
 ellipse(width/2,height/2,110,110);
 ellipse(width/2,height/2,130,130);
 ellipse(width/2,height/2,150,150);
 ellipse(width/2,height/2,170,170);
 ellipse(width/2,height/2,190,190);
 ellipse(width/2,height/2,210,210);
 ellipse(width/2,height/2,230,230);
 ellipse(width/2,height/2,250,250);
 ellipse(width/2,height/2,270,270);
 ellipse(width/2,height/2,290,290);
 ellipse(width/2,height/2,310,310);
 ellipse(width/2,height/2,330,330);
 if(s>x){
 fill(255,trans-50);
 noStroke();
 ellipse(100,height/2,s2,s2);
 ellipse(150,height/2,s2,s2);
 ellipse(width/2,100,s2,s2);
 ellipse(width/2,150,s2,s2);
 s2-=0.05;
 }
 if(s>x2){
 ellipse(175,height/2,s3,s3);
 ellipse(75,height/2,s3,s3);
 ellipse(width/2,175,s3,s3);
 ellipse(width/2,75,s3,s3);
 s3-=0.05;
 }
 if(s>x3){
 ellipse(200,height/2,s4,s4);
 ellipse(50,height/2,s4,s4);
 ellipse(width/2,200,s4,s4);
 ellipse(width/2,50,s4,s4);
 s4-=0.05;
 }
 if(s>x4){
 ellipse(225,height/2,s5,s5);
 ellipse(25,height/2,s5,s5);
 ellipse(width/2,255,s5,s5);
 ellipse(width/2,25,s5,s5);
 s5-=0.05;
 }
 noFill();
 strokeWeight(3);
 stroke(255,trans);
 ellipse(width/2,height/2,s,s);
 stroke(255,trans-50);
 ellipse(width/2,height/2,s-6,s-6);
 stroke(255,trans-75);
 ellipse(width/2,height/2,s-12,s-12);
 stroke(255,trans-100);
 ellipse(width/2,height/2,s-18,s-18);
 stroke(255,trans-125);
 ellipse(width/2,height/2,s-24,s-24);
 stroke(255,trans-150);
 ellipse(width/2,height/2,s-30,s-30);
 stroke(255,trans-175);
 ellipse(width/2,height/2,s-36,s-36);
 s+=1.2;
 trans-=0.8;
 trans2+=0.15;
 
 if (s>300) {
 s = 5;
 s2 =10;
 s3 =16;
 s4 =22;
 s5 = 28;
 trans = 255;
 trans2 = 0;
 }
 
 if(s>250) {
   trans2-=1;
 }
}

