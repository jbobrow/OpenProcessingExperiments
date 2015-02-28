
float[] yCoord;
float[] speed;
int space=6;

void setup()
{
  
 // println(500/6);
  size (500,500);
  yCoord = new float [width/space+1];
  speed = new float [width/space+1];
  for(int i=0;i<yCoord.length;i=i+1) {
  
    yCoord[i]=0;
    speed[i]=random(6,8);
  
  }
  
  background(0);
  fill(0,5);
rect(0,0,width,height);
  stroke(56, 146,240);
  strokeWeight(5);
}





void draw()
{
   
  background(0,300);


   for(int i=0;i<yCoord.length;i=i+1) { 
     line(i*space,yCoord[i]-5,i*space,yCoord[i]);
    yCoord[i]= yCoord[i] + speed[i];
   // speed[i]=
 
  if (yCoord[i]>500)
  {yCoord[i]=0;
  

}
   
}
  
  
}

