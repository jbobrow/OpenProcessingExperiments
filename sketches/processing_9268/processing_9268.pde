
 float y,a,r,t=0;
 int c,ys=40;
 
 void setup()
 { 
   size(400,400);
   smooth();
   noStroke();
   frameRate(60);
 }
 
 void draw() 
 { 
   background(255);
   for( y=ys/2; y<height; y+=ys ){
     a=t+y/200*PI;
     r=5+3*sin(a+PI/2);
     c=int((r)*20);
     r=r+5;
     fill(0,170,140,c);
     ellipse(width/2+width/8*sin(a),y,r,r);
     t+=0.003;
   }
 }
 

