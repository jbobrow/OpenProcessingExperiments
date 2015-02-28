
int x = 5;
int y = 5;

int x2 = 5;
int y2 = 5;

int x3 = 5;
int y3 = 5;

float a= 0.5;
float b= 0.5;

float d= 0.2;
float e= 0.2;

int count = 0;




void setup() {
  
  size(500,500);
  background (0);
}

void draw() 


{
 while (count<55){
 stroke(204, 102, 2);
  smooth();
  line(5,5,5,495);
  line(5,5,495,5);
  line(5,495,495,495);
  line(495,5,495,495);
  
 /* line(5,5,495,495);
  line(495,5,5,495);*/
  
  /*line(20,20,495,5);*/
  line(x,y,495,5);
  
  
  
  /*line(20,20,5,495);*/
  line(x2,y2,5,495);
  
 
  
  
  x= x + 10;
  y= y + 10;
  
  x2= x2 + 10;
  y2= y2 + 10;
  
 noFill();
 ellipse(250, 250, a, b);
 ellipse(250, 250, d, e);
 

a = a + 13;
b = b + 13;
count++;

 }
 
}

