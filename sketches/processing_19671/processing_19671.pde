
void setup(){
 size(250, 250);
smooth();
background(#3A87A5);
noFill();
strokeWeight(7);
frameRate(10);

}
 
float a;
float b;
 
void draw(){
   
  ellipseMode(CENTER);
   
  stroke(250,197,a); //colour of "emerging" sun
  noFill();
  ellipse(width,height,b,b);
 
 //setting the parameters for a & b
  a+=10;
  b+=10;
 
 //whenever a (colour) reaches 100, it resets to zero - gradient effect
 if (a>100){
    a=0;
  }
 
 //when the circle's radius hits 500, it resets to a clear screen and repeats 
  if (b>500){
    background(#3A87A5);
    b=0;
  }
}

