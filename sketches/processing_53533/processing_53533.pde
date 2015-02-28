
float y1=0;
float y2=0;
float y3=250;
float y4=250;
float y5=-10;
float y6=-10;
float y7=250;
float y8=250;
float x1=250;
float x2=-40;

void setup(){
  
  size(250,250);
  smooth();
  
}

void draw(){
  
  background(255);
  
   //Small Left Rectangle
  if (x2<40)
  {
   x2=x2+1; 
  }
  
  noStroke();
  fill(0);
  rect(x2,210,80,30);
  
  //Small Right Rectangle
  
  if (x1>130)
  {
   x1=x1-1.5; 
  }
  noStroke();
  fill(0);
  rect(x1,10,80,30);
 
 //Skinny Right Rectangle
  if (y7>10)
  {
   y7=y7-1.5;
  } 
  
  if (y8>230)
  {
   y8=y8-1.5; 
  }
  noStroke();
  fill(0);
  rect(10,y7,20,y8);
  
  //Skinny Left Rectangle
  if (y5<10)
  {
   y5=y5+1.5;
  } 
  
  if (y6<230)
  {
   y6=y6+1.5; 
  }
  noStroke();
  fill(0);
  rect(220,y5,20,y6);
  
  
 //Big Left Rectangle
 if (y1<10)
  {
   y1=y1+1.5;
  } 
  
  if (y2<190)
  {
   y2=y2+1.5; 
  }
  noStroke();
  fill(0);
  rect(40,y1,80,y2);
  
  // Big Right Rectangle
  if (y3>50)
  {
   y3=y3-1.6;
  } 
  
  if (y4>190)
  {
   y4=y4-1.6; 
  }
  noStroke();
  fill(0);
  rect(130,y3,80,y4);
  
  
  //Middle Circle
  strokeWeight(8);
  stroke(255);
  fill(#0fddf0);
  ellipse(125,125,125,125);  

}

