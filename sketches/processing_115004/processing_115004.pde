
  float x = 0;
  float speed = 1;
  float sinusKurve = 0;
  float xBen = 0;
  float yBen = 0;
  float benA = 0;
  float benB = 0;
  float benC = 0;
  float yArm = 0;
   
  float A = -30;
  float a = 50;
  float b = 75;
  float c = 150;
  float d = 200;
  float e = 125;

void setup(){
  size(400,400);
}
void draw(){  
  
  
  
background(38,213,210);
//Hus
stroke(0,0,0);
fill(210,22,9);
rect(80,60,150,120);
//Tag
stroke(0,0,0);
fill(0,0,0);
triangle(80,60,230,60,160,3);
//Græs
stroke(0,0,0);
fill(36,234,14);
rect(0,180,400,400);

//sky
noStroke();
fill(255,255,255,100);
ellipse(320,50,100,50);
ellipse(370,80,100,50);

//door
stroke(0,0,0);
fill(0,0,0);
rect(120,120,40,60);

//vindue
stroke(0,0,0);
fill(255,255,255);
rect(180,80,20,20);

//sol
stroke(0,0,0);
fill(250,221,1);
ellipse(35,25,50,50);


 x = x+0.05;
   
  A = A+speed;
   
  sinusKurve = 25 * cos(x);
   
  xBen = sinusKurve + A;
   
  yBen = sqrt(d*d-sinusKurve*sinusKurve);
   
  //hoved
  fill(0,0,0);
  ellipse(A,a,50,50);
   
  //krop
  line(A,b,A,c);
 
  //Ben1
  line(A,c,xBen,yBen);
   
 
  //Ben2
  benA = 25 * cos(x-PI);
   
  benB = benA + A;
   
  benC = sqrt(d*d-benA*benA);
   
  line(A,c,benB,benC);
   
   
  //Arm1
  line(A,c-40,xBen,yBen-110);
   
   
  //Arm2
  line(A,c-40,benB,benC-110);
   
}





