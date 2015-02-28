
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;

void setup() {

  background(0);
  size(600,400);
  frameRate(10); // very slow framerate to match the slow song
  smooth();
  
   minim= new Minim(this);
  player = minim.loadFile("dungeon.mp3");
  

}


void draw() {
       player.play();

  fill(0,100,100,10);
  ellipse(pmouseY+10,pmouseX+30,100,100); // this bit of code taken from Jamuel's coding



  fill(0,100,255,10);
  noStroke();
  ellipse(mouseX,mouseY,100,100);

  noStroke();

  /*  
   fill(0,0,random(105),1);
   rect(0,450,1200,1200); 
   
   fill(0,0,random(105),2);
   rect(0,475,1200,1200); 
   
   fill(0,0,random(105),3);
   rect(0,500,1200,1200); 
   
   
   fill(0,0,random(105),4);
   rect(0,525,1200,1200);
   
   fill(0,0,random(105),5);
   rect(0,550,1200,1200); 
   
   fill(0,0,random(105),6);
   rect(0,575,1200,1200); 
   
   fill(0,random(100),random(105),7);
   rect(0,600,1200,1200); 
   
   fill(0,random(100),random(105),8);
   rect(0,625,1200,1200); 
   */





  fill(0,0,random(100),21);
  rect(0,0,1200,1200); 





  fill(0,0,0,10); 
  rect(0,0,1200,1200);





 
}


void stop() {
  player.close();
  minim.stop();
  super.stop();
}

