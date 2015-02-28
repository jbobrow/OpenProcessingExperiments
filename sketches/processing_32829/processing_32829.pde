
int x = 60;
int y = 60;

int x2 = 60;
int y2 = 60;

int x3 = 60;
int y3 = 580;

int x4 = 580;
int y4 = 60;



int count = 0;
int a=0;



void setup() {
  
  size(600,600);
  background (225);
}

void draw() 


{
 while (count<35){

 /* smooth();
  line(10,10,10,590);
  line(10,10,590,10);
  line(10,590,590,590);
  line(590,10,590,590);
  smooth();
//Lines  
line(60,60,590,590);
  line(580,60,60,580);
  
 
  /*line(20,20,495,5);*/
  smooth();
  line(x,y,580,60);
  
  /*line(20,20,5,495);*/
  line(x2,y2,60,580);
  
  
  /*line(10,10, 20,580);*/
  line(60,60, x3,y3);
  
  
  
  /*line(10,10, 20,580);*/
  line(60,60, x3,y3);
 
 
 
  /*line(10,10, 20,580);*/
  line(580,580, x4,y4);



  /*line(305,305, 20,20);

  line(305,305, 590,10);*/
 
 
  x= x + 10;
  y= y + 10;
  
  x2= x2 + 10;
  y2= y2 + 10;
  
  x3= x3 + 10;
  y3= y3 - 10;
  
  x4= x4 - 10;
  y4= y4 + 10;
  
 //
 
 count++;

 }
 
}

