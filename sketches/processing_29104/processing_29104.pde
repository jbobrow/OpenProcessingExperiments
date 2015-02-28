
void setup(){
  size(600,600,P3D);
  background(0);
  smooth();
}


int x= 1;
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

     r= 1+(5*i); //radius
    
    fill(random(50,100),random(100,150),150,40);
   
    noStroke();
   
    x=x-2;
    rotateZ(radians(x));
   // rotateX(radians(x)); //angle of rotation of each circle wrt each other
    rotateY(radians(x));
    translate(0,i,i);
    box(i/4,1,i);
    
    popMatrix();
  
    i=i+0.25; //increment
    
    a-=0.1; //translation point
    //b+=0.1;

    
}
  
  } 
  






