
PImage img;
float[] yCoord;
float[] speed;
int space=10;
 
void setup()
{
   img = loadImage("pour.jpg");
 // println(500/6);
  size (300,200);
  yCoord = new float [width/space+1];
  speed = new float [width/space+2];
  for(int i=0;i<yCoord.length;i=i+1) {
   
    yCoord[i]=0;
    speed[i]=random(5,8);
   
  }
   
  background(0);
  fill(0,90);
rect(0,0,width,height);
  stroke(56, 146,240);
  strokeWeight(5);
}
 
 void draw()
{
    
  background(0,300);
  image (img,0,0);
 
 
   for(int i=0;i<yCoord.length;i=i+1) {
     line(i*space,yCoord[i]-5,i*space,yCoord[i]);
    yCoord[i]= yCoord[i] + speed[i];
   // speed[i]=
  
  if (yCoord[i]>500)
  {yCoord[i]=0;
   
 
}
    
}
   
   
}


