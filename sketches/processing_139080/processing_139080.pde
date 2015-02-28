
void setup() {
  size(800,800);
  background(225,130,150);
}
float t = 0;
float x= 0;
float t1 = 0;
float x1= 0;
float t2 = 0;
float x2= 0;
float t3 = 0;
float x3= 0;
float t4 = 0;
float x4= 0;
float t5 = 0;
float x5= 0;
 


void draw(){
  


  
  float nt = noise(t);
  strokeWeight(x % width *0.2);
  stroke(random(0,225),x % width,nt*height,70);
  point(nt*height, x % width);
  point(nt*height+20, x % width);
  point(nt*height-20, x % width);
  point(nt*height+50, x % width);
  point(nt*height-50, x % width);
   t = t+0.01;
   x++;
   
  float nt1 = noise(t1);
  strokeWeight(nt1*height*0.2);
  stroke(x1 % width,random(0,225),nt1*height,20);
  point(nt1*height,x1 % width);
  point(nt1*height+20,x1 % width);
  point(nt1*height-20,x1 % width);
  point(nt1*height+50,x1 % width);
  point(nt1*height-50,x1 % width);
   t1 = t1+0.05;
   x1++;
   
  float nt2 = noise(t2);
  strokeWeight(40);
  stroke(nt2 % width,random(0,225),x% width*0.5,10);
  point(nt2*height, x2 % width);
  point(nt2*height+20, x2 % width);
  point(nt2*height-20, x2 % width);
  point(nt2*height+50, x2 % width);
  point(nt2*height-50, x2 % width);
  point(nt2*height+70, x2 % width);
  point(nt2*height-70, x2 % width);
  point(nt2*height+100, x2 % width);
  point(nt2*height-100, x2 % width);
  point(nt2*height, x2 % width);
  point(nt2*height+120, x2 % width);
  point(nt2*height-120, x2 % width);
  point(nt2*height+150, x2 % width);
  point(nt2*height-150, x2 % width);
  point(nt2*height+170, x2 % width);
  point(nt2*height-170, x2 % width);
  point(nt2*height+200, x2 % width);
  point(nt2*height-200, x2 % width);
  point(nt2*height+220, x2 % width);
  point(nt2*height-220, x2 % width);
  point(nt2*height+250, x2 % width);
  point(nt2*height-250, x2 % width);
  point(nt2*height+270, x2 % width);
  point(nt2*height-270, x2 % width);
  point(nt2*height+300, x2 % width);
  point(nt2*height-300, x2 % width);
   point(nt2*height+320, x2 % width);
  point(nt2*height-320, x2 % width);
  point(nt2*height+350, x2 % width);
  point(nt2*height-350, x2 % width);
  point(nt2*height+370, x2 % width);
  point(nt2*height-370, x2 % width);
  point(nt2*height+400, x2 % width);
  point(nt2*height-400, x2 % width);
  point(nt2*height+420, x2 % width);
  point(nt2*height-420, x2 % width);
  point(nt2*height+450, x2 % width);
  point(nt2*height-450, x2 % width);
  t2 = t2+0.003;
  x2++;
  
  float nt3 = noise(t3);
  strokeWeight(1000);
  stroke(nt3 % height*10,random(10,100),random(10,100),0.1);
  point(nt3*height, x3 % width);
  t3 = t3+0.02;
  x3++;
  
  float nt4 = noise(t4);
  strokeWeight(110);
  stroke(nt4 * height,random(100,200),random(50,250),10);
  point(x4 % width,nt4* height+300);
  t4 = t4+0.05;
  x4++;
  
}
  
