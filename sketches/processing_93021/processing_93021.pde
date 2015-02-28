
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer Alice;
int num=4000;
float [] ax = new float [num];
float [] ay = new float [num];

color c4 = color(199, 203, 189, random(120, 255));
color c3 = color(30, 37, 29, random(120, 255));
color c2 = color(48, 44, 45, random(200, 255));
color c1 = color(2, 2,1,random(120, 255));

void setup()
{
  size(1200, 800, P3D);  
  minim = new Minim(this);
  Alice = minim.loadFile("Alice.mp3");
  Alice.loop();
  for (int i = 0; i<num; i++) {
    ax[i] =width/2;
    ay[i] =height/2;  
  }
  frameRate(30);
  background(239,240,250);


}


void draw()
{
  background(0,1,31); 
  for (int i = 1; i<num; i++) {
      ax[i-1] = ax[i];
      ay[i-1] = ay[i];
  }
  int scale=50;
  float level = sq(Alice.left.level()+Alice.right.level())*scale;
  float heigh = sq(Alice.left.get(Alice.left.size()-1)+Alice.left.get(Alice.left.size()-1))*scale;
  
  //Put a new value at the end of the array
   ax[num-1] += random(-heigh-level/10,heigh+level/10);
   ay[num-1] += random(-heigh-level/10,heigh+level/10);
  
  //Constrain all points to the screen
   ax[num-1] = constrain(ax[num-1], 0, width);
   ay[num-1] = constrain(ay[num-1], 0, height);
  
  for (int i = 1; i<num; i++) {
    //float cc = 50*(1-i/num);
    //strokeWeight(random(1, 5)); 
    stroke(255,230,174,200);
    strokeWeight(level/3+float (i)/num/3);
    //float deltaX=abs(ax[i]-ax[i-1]); float deltaY=abs(ay[i]-ay[i-1]);
    //float tempx1 = random(ax[i-1],ax[i-1]+deltaX/2);  float tempx2 = random(ax[i-1]+deltaX/2,ax[i]);
    //float tempy1 = random(ay[i-1],ay[i-1]+deltaY/2);  float tempy2 = random(ay[i-1]+deltaY/2,ay[i]);
    //bezier(ax[i-1],ay[i-1],random(0,width),random(0,height),random(0,width),random(0,height),ax[i],ay[i]);
    line(ax[i-1],ay[i-1],ax[i],ay[i]);
    int rd=int(random(0, 16)); 
  }

}

void stop()
{
  Alice.close();
  minim.stop();
  super.stop();
}


