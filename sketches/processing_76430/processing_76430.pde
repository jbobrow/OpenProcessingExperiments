
//LEVI MOUSAW
//10-22-12


int diameter = 2;
int x = 0;
int y = 0;
int xChange = 1;

float angle;
float rad;

void setup(){
 size (800,800);
 background (0,0,0);
 angle = 0;
 smooth ();

 strokeWeight (1.5);
 stroke (32,178,170);
 frameRate (4);
}

void draw (){
  
  float bgcolor= abs(255*sin(radians(angle)));
 float x = 200*cos(radians(angle))*cos(radians(angle*2));
 float y = 200*sin(radians(angle))*cos(radians(angle/10));
 
 noFill();
 ellipse(angle/120,y+0,20,20);
  ellipse(angle/120,y+150,20,20);
   ellipse(angle/120,y+300,20,20);
    ellipse(angle/120,y+450,20,20);
     ellipse(angle/120,y+600,20,20);
      ellipse(angle/120,y+750,20,20);
 
 angle+=1;
  
  ellipse1();

  expand1(0,0);
  expand1(-200,-200);
  expand1(200,200);
  expand1(200,-200);
  expand1(-200,200);
  expand1(0,200);
  expand1(0,-200);
  expand1(200,0);
  expand1(-200,0);
  

}

//  ellipse(x,y,60,80);
 // x = x + xChange;
 // y = y + 1;
  //if(x < 150)
  //{
  //  xChange = xChange + 2;
// }
 // if(x >= 150)
 // {
  //  xChange = xChange - 2;


void ellipse1(){//FUNCTION

 for(int i = 0;i < 2; i++)
   ellipse (200,200,diameter,diameter);
   diameter = diameter + 10;
   fill (0,0,0,0);
  
 for(int i = 0;i < 2; i++)
   ellipse (200,400,diameter,diameter);
   diameter = diameter + 10;
   fill (0,0,0,0);
 
 for(int i = 0;i < 2; i++)
   ellipse (200,600,diameter,diameter);
   diameter = diameter + 10;
   fill (0,0,0,0);
 
 for(int i = 0;i < 2; i++)
   ellipse (400,200,diameter,diameter);
   diameter = diameter + 10;
   fill (0,0,0,0);

 for(int i = 0;i < 2; i++)
   ellipse (400,400,diameter,diameter);
   diameter = diameter + 10;
   fill (0,0,0,0);
  
 for(int i = 0;i < 2; i++)
   ellipse (400,600,diameter,diameter);
   diameter = diameter + 10;
  fill (0,0,0,0);

 for(int i = 0;i < 2; i++)
   ellipse (600,200,diameter,diameter);
   diameter = diameter + 10;
   fill (0,0,0,0);
 
 
 for(int i = 0;i < 2; i++)
   ellipse (600,400,diameter,diameter);
   diameter = diameter + 10;
   fill (0,0,0,10);
 
 for(int i = 0;i < 2; i++)
   ellipse (600,600,diameter,diameter);
   diameter = diameter + 10;
   fill (0,0,0,0);


   
 }



void expand1(int x, int y){//FUNCTION2

 ellipse(x+width/2,y+height/2,rad/2,rad/2);
  ellipse (x+width/2,y+height/2,2,2);
   //fill (0,0,0,10);
  angle+=100;
  rad+=5;
}

//void ellipse2(int x, int y){//FUNCTION3

//ellipse(angle/10,y+200,30,30);
//angle+=3;
//ellipse(x+width/2,y+height/2,5,5);



//void moveellipse(){ 
// ellipse (angle/30,y+300,360,360);
//angle+=8;
// ellipse (x+width/2,y+height/2,40,40);

// ellipse (angle/30,y+300,360,360);
//angle+=8;
// ellipse (x+width/2,y+height/2,60,60);
// 
 // ellipse (angle/30,y+300,360,360);
//angle+=8;
 //ellipse (x+width/2,y+height/2,60,60);
 
  // ellipse (angle/30,y+300,360,360);
//angle+=8;
// ellipse (x+width/2,y+height/2,60,60);
