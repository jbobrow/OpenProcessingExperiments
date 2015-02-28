
int x = 20;
int y = 20;

int x2 = 20;
int y2 = 20;

int x3 = 20;
int y3 = 590;

int x4 = 590;
int y4 = 20;



int count = 0;
int a=0;



void setup() {
  
  size(600,600);
  background (225);
}

void draw() 


{
 while (count<38){

  smooth();
  line(10,10,10,590);
  line(10,10,590,10);
  line(10,590,590,590);
  line(590,10,590,590);
  smooth();
//Lines  
/*line(10,10,590,590);
  line(590,10,10,590);*/
  
  /*line(20,20,495,5);*/
  line(x,y,590,10);
  
  /*line(10,10, 20,580);*/
  line(10,10, x3,y3);
  
  /*line(20,20,5,495);*/
  line(x2,y2,10,590);
  
  
  /*line(10,10, 20,580);*/
  line(10,10, x3,y3);
 
 
 
  /*line(10,10, 20,580);*/
  line(600,600, x4,y4);

  x= x + 15;
  y= y + 15;
  
  x2= x2 + 15;
  y2= y2 + 15;
  
  x3= x3 + 15;
  y3= y3 - 15;
  
  x4= x4 - 15;
  y4= y4 + 15;
  
 //
 

  
 

 

 


count++;

 }
 
}

