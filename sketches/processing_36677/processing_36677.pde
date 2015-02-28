

// comments go here

void setup()
{
  size(400,400);
  background(125);
  fill(255);
  noLoop();
  PFont fontA = loadFont("courier");
  textFont(fontA, 14);  
}

int e = 150;
int g = 170;
int a = 175;

int b = 210;
int c = 225;
int h = 230;
int d = 250;
int i = 250;
int k = 285;
int f = 300;




int j = 320;

int AA = 25;
int A = 50;
int B = 75;
int C = 100;

void draw(){  
//head
  line(a,b,c,b);
  line(a,d,c,d);
  line(a,b,a,d);
  line(c,d,c,b);
//body 
  line(a,b+A,c,b+A);
// 175,265,225,265
  line(a,d+B,c,d+B);
// 175,325,225,325
  line(a,b+A,a,d+B);
// 175,265,175,325
  line(c,d+B,c,b+A); // 225,325,225,265
//arms
  line(e,b+A,g,b+A);
  line(e,b+A,e,f);
  line(g,b+A,g,f);  
  line(e,f,g,f);
  
  line(h,b+A,h,f);
  line(i,b+A,i,f);
  line(h,b+A,i,b+A);
  line(h,f,i,f);   

//legs
  line(c,k+A,c,f+B);
  line(c-AA-5,k+A,c-AA-5,f+B);
  line(c-A,k+A,c-AA-5,k+A); 
  line(c,k+A,c-AA+5,k+A); 
  
  line(c-A,k+A,c-A,f+B);
  line(c-AA+5,k+A,c-AA+5,f+B);
  line(c-A,f+B,c-AA-5,f+B);
  line(c,f+B,c-AA+5,f+B);
  
  fill(0);
  ellipse(a+15,b+15,5,5);  
  ellipse(a+35,b+15,5,5);
  
  



}

