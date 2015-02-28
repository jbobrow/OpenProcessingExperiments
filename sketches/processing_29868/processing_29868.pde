

void setup(){
  size(1000,1000);
  smooth();
}  
void draw()
{
 background(0);
 frameRate(10); 
  
 println(frameCount);
 

// float a=constrain(1000);
// float b=constrain(1000);
// float c=constrain(1000);
// float d=constrain(1000);
// float e=constrain(1000);
// float f=constrain(1000);
// float g=constrain(1000);
// float h=constrain(1000);
 
 

//   float a=random(-1000, 1000);
//   float b=constrain(frameRate,-1000,1000)/4;
//   float c=constrain(second()*constrain(frameRate,-1000,1000),-1000,1000);
//   float d=constrain(noise(-1000,1000)*3, -1000,1000);
//   float e=constrain(frameRate,1000,1000)*0.5;
//   float f=constrain(frameRate,-1000,1000)*second();
//   float g=constrain(random(-1000,1000)*4, -1000,1000);
//   float h=constrain(frameRate,-1000,1000)/second();


   float a=random(-1000, 1000);
   float b=random(-1000, 1000);
   float c=random(-1000, 1000);
   float d=random(-1000, 1000);
   float e=random(-1000, 1000);
   float f=random(-1000, 1000);
   float g=random(-1000, 1000);
   float h=random(-1000, 1000);
 
   quad(a,b,c,d,e,f,g,h);
}

