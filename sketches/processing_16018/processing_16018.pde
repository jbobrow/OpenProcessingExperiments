
int halfcir, wCen, yCen, clocir, halfcir1, halfcir2 ;  PImage a,b,c;
float[] x = new float[3000];
void setup(){
  size(360,600);
   a= loadImage("img1.png");
  b= loadImage("img2.png");
  c= loadImage("img3.jpg");
   noStroke();
fill(255,200);
for (int i = 0; i < x . length; i ++) {
  x[i] = random(-1000,200);
}
}
void draw(){
  b=loadImage("img3.jpg");

image(b,0,0,360,600);

  
  noStroke();
  noStroke();
  fill(225);
   b=loadImage("img2.png");

image(b,0,0,360,600);
   
 fill(198,143,172);
noStroke();
  for (int i = 0 ; i < x.length ; i++){
    x[i]+=1;
    float y = i * 10;
    image(b, x[i],y);
}
  
  


 
 //background color change   

   for (int y=0; y <= height; y +=40){  

  for (int x= 0; x <= width; x +=40){  

   fill (212,249,252,144); 
    ellipse(x,y,35,35); }
  }
  
 
  
 //back img
a=loadImage("img1.png");

image(a,0,0,360,600);


//time
wCen = width/2;
yCen = height/2;
 
  noStroke();
  smooth();
 
  fill(255);
  ellipse(180,303, 10, 10);
 
  float s = map(second(), 0,60,0 , TWO_PI) - HALF_PI;
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() % 12, 0, 12,0, TWO_PI) - HALF_PI;
  stroke(255);
  clocir =100;
  halfcir = 70;
  halfcir1 = clocir/2-10;
  halfcir2 = clocir/2;
  strokeWeight(2);
  line(180,303, cos(s) * halfcir1 +  wCen, sin(s) * halfcir1 +yCen);
  strokeWeight(5);
  line(180, 303, cos(m) * halfcir + wCen, sin(m) * halfcir + yCen);
  line(180, 303, cos(h) * halfcir2 + wCen, sin(h) * halfcir2 +yCen);
  //line
 float hh = map(hour(),0,24,40,600);
  float mm = map(minute(),0,60,20,600);
  float ss = map(second(),0,60,30,600);
  stroke(255,250,100);
  strokeWeight(2);
  line(hh,0,hh,600);
   stroke(255,250,100);  
  strokeWeight(2);
  line(mm,0,mm,600);
   stroke(200); 
  strokeWeight(2);
  line(ss,0,ss,600);  
  
 
 }

