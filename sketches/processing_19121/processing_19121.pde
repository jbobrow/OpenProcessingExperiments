
//Use the arrow keys to manuver the dot around the Grid. Enjoy some music too.




import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
float lx=0;
float ly=0;
float posX = 121;
float posY = 120;
AudioPlayer player;;
Minim minim;

void setup(){
  size (250,250);
  background(0);
  minim= new Minim(this);
player = minim.loadFile("Armory.mp3",2000);
player.play();

}
 

   

 
void draw(){
 
  stroke (0,126,255,255);
  strokeWeight(1);
  point(lx,0);
  point(lx,20);
  point(lx,40);
  point(lx,60);
  point(lx,80);
  point(lx,100);
  point(lx,120);
 point(lx,140);
  point(lx,160);
  point(lx,180);
  point(lx,200);
  point(lx,220);
  point(lx,240);
  lx++;
  
 point(20,ly);
 point(40,ly);
  point(60,ly);
 point(80,ly);
 point(100,ly);
  point(120,ly);
 point(140,ly);
 point(160,ly);
 point(180,ly);
 point(200,ly);
 point(220,ly);
 point(240,ly);
  
           
 ly++;
  
 stroke(246,239,0);
 strokeWeight(2);
 point(posX,posY);
   
  }
 

  
  
void keyPressed (){
  point(posX,posY);
  
  strokeWeight(0);
 stroke(246,239,0);
 point(posX,posY);


  //control dot
  if(keyCode==LEFT){
 posX-=20;
 }
   if(keyCode==RIGHT){
 posX+=20;
 }
   if(keyCode==UP){
 posY-=20;
 }
   if(keyCode==DOWN){
 posY+=20;
   }
   strokeWeight(5);
   rect(posX,posY,5,5);

  
}

