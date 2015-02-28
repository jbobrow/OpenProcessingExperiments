
//import ddf.minim.*;
//import ddf.minim.signals.*;
//import ddf.minim.analysis.*;
//import ddf.minim.effects.*;

//Minim minim;
//AudioPlayer song1;

float[] yCoord;
float[] speed;
float[] circles;
int space=6;
float size1=50;
int r=0;
int g=0;
int b=255;
void setup()
{
 //minim = new Minim(this);
 //song1 = minim.loadFile("2.aif");
 // println(500/6);
  size (500,500);
  smooth();
  yCoord = new float [width/space+1];
  speed = new float [width/space+1];
  for(int i=0;i<yCoord.length;i=i+1) {
  
    yCoord[i]=0;
    speed[i]=random(6,8);
  
  }
  circles = new float [50+1];
  for(int n=0;n<circles.length;n=n+1) {
    circles[n]=random(10,50);
  }
  
  background(0);
  fill(0,5);
rect(0,0,width,height);
  stroke(56, 146,240);
  strokeWeight(5);
  
}





void draw()
{
  fill(0,10);
  noStroke();
  rect(0,0,width,height);
  
 if(mousePressed == true)
  {
  noStroke();
    fill(150);
    for(int n=0;n<circles.length;n=n+1){
    ellipse(mouseX,mouseY,50,20);
    if (n>50)
    {
      r=int(random(255));
      g=int(random(255));
      b=int(random(255));
      n=0;
    }
    }  
  }
   stroke(56, 146,240);
  strokeWeight(5);
// background(0,300);
  

   for(int i=0;i<yCoord.length;i=i+1) { 
     line(i*space,yCoord[i]-5,i*space,yCoord[i]);
    yCoord[i]= yCoord[i] + speed[i];
   // speed[i]=
 
  if (yCoord[i]>500)
  {yCoord[i]=0;
  
  
  

}
//  if(mouseX,mouseY<yCoord[i])
 //{song1.loop(0);
 //} 
}
  
  
}

//void mousePressed()
//{
  //song1.loop(0);
//}
//void stop()
//{
  //song1.close();
  //minim.stop();
  //super.stop();
//}

