

 //Hundreds of lins are moving, in difffernt directions (up, down, rotate, etc). 
 //When they collide, they form connection, and continuing to move and connect 
 //with other lines.

 //Declares object array
 Funlines[]  funlines;


 
 void setup(){
   size(1000, 1000);
  background(255);
  //frameRate(20);
   
   //give the array a 100 spaces
   funlines = new Funlines [1000];


   //populates each space in the array with a randomly assigned line
   for(int i =0 ; i < funlines.length; i+=1){
     funlines[i] = new Funlines(random(1000),random(1000),random(1000),random(1000));
    }

    
   
 }
 
 void draw(){
     fill(255,100);
      rect(0,0,1000,1000);
   //cyclse throught all lines and moves and displays them
   for(int i =0 ; i < funlines.length;i+=5){
     funlines[i].display();
     funlines[i].move();
     
   }

 }

 
  class Funlines{
    float x,y,a,b,directionX, directionY, directionA, directionB;
  
  //constructor
   Funlines(float xpos, float ypos, float apos, float bpos){
     x= xpos;
     y= ypos;
     a= apos;
     b= bpos;
     
    directionX=5;
    directionY=7;
    directionA=5;
    directionB=8;
     

     
       
     
     
   }
   
   void display(){
     stroke(random(255),random(255),random(255),random(255));
     line(x,y,a,b);
     
  }

   void move(){
     x += directionX;
     y+= directionY;
     a+= directionA;
     b+= directionB;

     if( x >= 1000){
       directionX= -directionX;
     }
     if(x <= 0){
       directionX =- directionX;
     }
     if(y >= 1000){
       directionY = -directionY;
     }
     if(y <= 0){
       directionY = -directionY;
     }
     if( a >= 1000){
       directionA= -directionA;
     }
     if(a <= 0){
       directionA = -directionA;
     }
     if(b >= 1000){
       directionB = -directionB;
     }
     if(b <= 0){
       directionB = -directionB;
     }
     
   }
 
  }
  

