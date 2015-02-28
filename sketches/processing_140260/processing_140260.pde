
  
void setup() {
  size(800, 800);
  mapHeight=height;
  
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
float p1;


 
 

  
void draw() {
 pointNoise1(0);
 pointNoise2(0);
 pointNoise3(-250);
 pointNoise4(-250);
 pointNoise5(300);
}
  
  

void pointNoise1(float p1){
float nt1 = noise(t1);
  strokeWeight(nt1*height*0.5);
  stroke(x1 % width,random(0,225),nt1*height,20);
  point(x1 % width,nt1*height+p1);
   t1 = t1+0.05;
   x1++;
}
   
  void pointNoise2(float p2){
  float nt = noise(t);
  strokeWeight(x % width *0.2);
  stroke(random(0,225),x % width,nt*height,10);
  point(x % width, nt*height+p2);
   t = t+0.01;
   x++;
  }
  
  void pointNoise3(float p3){  
  float nt2 = noise(t2);
  strokeWeight(110);
  stroke(nt2 % width,random(0,225),x% width*0.5,10);
  point(x2 % width,nt2*height+p3);
  t2 = t2+0.03;
  x2++;
  }
  
  void pointNoise4(float p4){ 
  float nt3 = noise(t3);
  strokeWeight(100);
  stroke(nt3 % height*10,random(10,100),random(10,100),10);
  point( x3 % width,nt3*height+p4);
  t3 = t3+0.02;
  x3++;
  }
  
  void pointNoise5(float p5){
  float nt4 = noise(t4);
  strokeWeight(110);
  stroke(nt4 * height,random(100,200),random(50,250),10);
  point(x4 % width,nt4* height+p5);
  t4 = t4+0.05;
  x4++;
}
