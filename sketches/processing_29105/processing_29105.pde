
void setup(){
  size(600,600);
  background(255);
  smooth();
}


int x= 12;
float i= 0;
 float r;
int a=600;
int b=20;


void draw() 
{
    noStroke();
 

    if (i<=150){ //no of times it runs
     
    pushMatrix();
    translate(a,a);

    // r= 1+(4*10); //radius
    
    fill(random(0,50),random(0,50),100,40);
   
    noStroke();
   
   x-=5;
    
    rotate(radians(x)); //angle of rotation of each circle wrt each other
    stroke(3,200-i);
    noFill();
    ellipse(0,i,54,54);
    
    popMatrix();
  
    i=i+0.25; //increment
    
    a-=0.1; //translation point
    //b+=0.1;

    
}
  
  } 
  






