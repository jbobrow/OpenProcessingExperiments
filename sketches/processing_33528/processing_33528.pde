
//variables//

PImage eye_open;
PImage eye_closed;
PImage start_screen;


//once//

void setup(){
  size(600,400);
  frameRate(30);
  smooth();
  background(255);




  eye_open = loadImage("eye_open.gif");
  eye_closed = loadImage("eye_closed.gif");
  start_screen = loadImage("start_screen.gif");


}


//over and over//

void draw(){
noStroke();

    }
    
    
    
  void keyPressed(){
if(key=='b' || key== 'B'){
  image(eye_open, 0,0);
  fill(0);
  ellipse(175,185,50,50);
  ellipse(410,185,50,50);

}  
if(key=='v' || key== 'V'){
  image(eye_open, 0,0);
  ellipse(175,185,25,25);
  ellipse(410,185,25,25);
  }
  if(key=='c' || key== 'C'){
  image(start_screen, 0,0);
 
  }
  
  }    

void mousePressed(){
  image(eye_closed, 0,0);
 
  }
  
void mouseReleased(){
  image(eye_open, 0,0);
   fill(255,10,10);
   ellipse(175,185,50,50);
   ellipse(410,185,50,50);
  

   }
   
   
  


