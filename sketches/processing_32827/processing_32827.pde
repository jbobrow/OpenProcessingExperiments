
int x = 20;
int y = 20;

int x2 = 20;
int y2 = 20;

int x3 = 20;
int y3 = 590;

int x4 = 590;
int y4 = 20;

// Lines 2
int x5 = 2;
int y5 = 10;

int x6 = 10;
int y6 = 10;

int x7 = 10;
int y7 = 295;

int x8 = 295;
int y8 = 10;

//circles

int a= 0;
int b= 0;

int c=0;
int d=0;

int e=0;
int f=0;

int g=0;
int h=0;

int count = 0;




void setup() {
  
  size(600,600);
  background (225);
}

void draw() 


{
 while (count<38){

  /*smooth();
  line(10,10,10,590);
  line(10,10,590,10);
  line(10,590,590,590);
  line(590,10,590,590);
  smooth();
//Lines  
/*line(20,20,590,590);
  line(590,20,20,590);
  
  
  /*line(20,20,495,5);*/
  smooth();
  line(x,y,590,10);
  line(x,y,590,10);
  
  /*line(20,20,5,495);*/
  line(x2,y2,10,590);
  line(x2,y2,10,590);
  
  
  /*line(10,10, 20,580);*/
  line(10,10, x3,y3);
  line(10,10, x3,y3);
  
  
  
  /*line(10,10, 20,580);*/
  line(10,10, x3,y3);
  line(10,10, x3,y3);
 
 
 
  /*line(10,10, 20,580);*/
  line(600,600, x4,y4);
  line(600,600, x4,y4);



  /*line(305,305, 20,20);

  line(305,305, 590,10);*/
 
 
  x= x + 15;
  y= y + 15;
  
  x2= x2 + 15;
  y2= y2 + 15;
  
  x3= x3 + 15;
  y3= y3 - 15;
  
  x4= x4 - 15;
  y4= y4 + 15;
  
 smooth();
  noFill();
 /* ellipse(300, 300, a, b);*/
 
  ellipse(e, f, a, b);
  
  ellipse(g, h, a, b);
  
  
  a = a + 5;
  b = b + 5;
  
 c = c + 5;
  d = d + 5;
  
  e = e + 5;
  f = f + 5;
  
  /*g = g +10;
  h = f+10;
 //
 /*
 // Lines 2
 
   /*line(20,20,495,5);
  line(x5,y5,295,5);
  
  /*line(10,10, 20,580);
  line(5,5, x6,y6);
  
  /*line(20,20,5,495);
  line(x7,y7,5,295);
  
  
  /*line(10,10, 20,580);
  line(300,300, x8,y8);
  
  
  /* x= x5 + 10;
  y5= y5 + 10;
  
  x6= x6 + 10;
  y6= y6 + 10;
  
  x7= x7 + 10;
  y7= y7 - 10;
  
  x8= x8 - 10;
  y8= y8 + 10;
 
 */ 

count++;

 }
 
}

