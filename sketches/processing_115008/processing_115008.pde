
import ddf.minim.*;

Minim minim; 
AudioPlayer player1;

int positionX = 0;
int positionY = 0;

void setup(){ 
  size(500,500);
  minim = new Minim(this); 
  player1 = minim.loadFile("evileye.mp3");

  

} void draw(){ 
if(keyPressed == true){ 
//if(mouseX > width) 
{ fill(255); 
noStroke();
rectMode(CENTER); 
rect(200,200,positionX++,20); 
rect(200,200,5,positionY++);
player1.play(); }

 pushMatrix();
  rotate(radians(45));
  fill(0);
  rect(200,200,positionX++,10);
  popMatrix();
  
pushMatrix();
  rotate(radians(-45));
  fill(255,255,255);
  rect(30,100,1,positionY++);
  popMatrix();  
  
  pushMatrix();
  rotate(radians(15));
  fill(0);
  rect(50,40,positionX++,10);
  popMatrix();
  
     float rad = 100;
   for(int a = 0; a<360; a+=5){
   float xoff = cos(radians(a))*rad;
       float yoff = sin(radians(a))*rad;
       fill(0);
       ellipse(width/2+xoff,height/2+yoff, 2, 2);
   }

pushMatrix();
  rotate(radians(-45));
  fill(255,0,0);
  rect(300,150,positionX++,15);
  popMatrix();

pushMatrix();
  rotate(radians(-45));
  fill(255,0,0);
  rect(300,100,positionX++,2);
  popMatrix();
  


}

else{ player1.pause(); } 

}


