
int x = 30;
int y = 30;

int x2 = 30;
int y2 = 30;

int x3 = 20;
int y3 = 20;



int count = 0;
int a=0;



void setup() {
  
  size(500,500);
  background (225);
}

void draw() 


{
 while (count<30){

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
  
 
  
  
  x= x + 15;
  y= y + 15;
  
  x2= x2 + 15;
  y2= y2 + 15;
  
 


count++;

 }
 
}

