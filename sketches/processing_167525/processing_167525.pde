

//This definition creates a psychadelic expanding triangle and circle with random colours

float a=250;
float b=250;
float c=250;
float d=250;
float e=0;
//Define 4 variables and begin at 250, to ensure they all begin at the centre of the page,
//and define one variable at 0, to be the size of the ellipse

void setup(){
 size(500,500); 
 //Set the canvas size to 500x500px
}


void draw(){

  float r=random(255);
  float r2=random(255);
  float r3=random(255);
  //Generate 3 random numbers between 0 and 255 for the RGB stroke
  
  noFill();
  //Specify the triangles and circles to not be filled in
  
  stroke(r,r2,r3);
  //Create the random stroke RGB colour
  
  triangle(250,a,b,b,c,d);
  //Draw the triangle, with the values tied so that changes in the number will cause the 
  //3 points that create the triangle to move in the desired directions
  
  ellipse(250,250,e,e);
  //Draw the circle, from the centre of the page, with the variable e controlling its size
  
  a-=5;
  b+=5;
  c-=5;
  d+=5;
  e+=5;
  //Modify the variables and thus the movement by increasing and decreasing the relevant values
  
}
  


