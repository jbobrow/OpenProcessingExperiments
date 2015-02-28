


import netscape.javascript.*;

import ddf.minim.signals.*;
import ddf.minim.*;

AudioPlayer player;
Minim minim;

int h = 360;

void setup()
{
  size(500, 600);
  
  minim = new Minim(this);
  player = minim.loadFile("04 In Space.mp3");
  player.loop();
  stroke(0);
  smooth();

}


void draw()
{
  background(#000000);
  colorMode(RGB,256);
  
  color Color1, Color2;
  Color1 = color( random(256), random(256), random(256) );
  Color2 = color( random(256), random(256), random(256) );  
  
  int range = 200;
  
  
  //繝上こ繧､謠冗判
   for(int i = 0; i < player.left.size()-1; i++)
  {  if(h > 0){
      h -= 1;
    }else{
      h = 360; 
    }
    stroke(h,100,100);
    float x = random(width);
    float y = random(height);
  float r = random(10, 70);
    fill(0,100,100);
    ellipseMode(CENTER);
    
 
 
  
  // x蠎ｧ讓吶�蛟､繧知ap蜻ｽ莉､縺ｧ0-1縺ｫ螟画鋤縺励※縲，olor1縺ｨColor2縺ｮ荳ｭ髢楢牡縺ｫ螟画鋤
  color c = lerpColor(Color1, Color2, map(x, 0, width, 0, 1));
  
  // 蜀�ｒ謠冗判
  fill(c);
  ellipse(x, y, r, r);
 
  }
}
   


 

      

  


void stop()
{
  player.close();
  minim.stop(); 
  super.stop();


}




