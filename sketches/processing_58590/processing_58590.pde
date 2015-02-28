
//variables - no. of objects, position, color & probabilities+percentage
int obj;
float posX, posY;
float r,g,b;
float prob; 
float per; 

//set window, bg &anti-alias
void setup(){
size(800,600);
background(0);
smooth();

//set variables
obj=100;
prob=25;
}

//set drawing
void draw(){
//set static image
noLoop();

//arcloop
for (int i=0; i<obj; i=i++)
{
   //arc diameters
  float pArc= random(50,100);
  //color values
  r=random(50,200); 
  g=random(70,120);
  b=random(100,200);
  
  //SET PERCENTAGE CONDITION
       if (random(100)<prob){
      
      posX=random(width/2-100,width/2+100); 
      posY=random(height/2-100,height/2+100);
      
      //reset values
      r=255; 
      g=176;
      b=23;
      pArc= 50;
     }
       else{
       
     posX=random(width); 
     posY=random(height);
     
     }

  //color & stroke
  noFill();
  //countour  
  strokeWeight (random(5));
  stroke(r,g,b);
  //arc size
  float b=random(0,PI);
  float bx=random(PI,3*PI);
  
  arc(posX,posY,pArc,pArc, b, bx);
}

saveFrame("line-####.png");
}

