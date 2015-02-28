
float deg = 0;

float y5=-10;
float y6=-10;
float y7=250;
float y8=250;

 
void setup ( ){
  
size(300, 300);
background (#1c7b96);
   
}
 
void draw ( ){
  
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
  fill(#31b8cc);
  rect(10,y7,70,y8);
   
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
  fill(#31b8cc);
  rect(220,y5,70,y6);
  
  //circle
  translate(150, 150);
  rotate(radians(deg));
   
  smooth( );
  stroke (0);
  
    ellipse(0, 15, 50, 50);
     
     int x=42;
  for(int i=0;i<6;i=i+1)
 
   deg++;
   
}

