
int x,y; 
int eSize;

  
  void setup() {
   size(600,600);     
   fill(0);
   smooth();
   noStroke();
    background(255,255,255);
}
  
  void draw(){       
  }
  
  void keyPressed(){
 
  

switch(key){
  case'a':
  background(255);
  break;


  case'w':
  fill(255);
  break;
  
case'g':
fill(mouseX,mouseY,random(155));
break;  //utikomuzahyouniyotteirogakawaru

case'b':
  fill(0);
  break;
  
}
  }


void mouseDragged() { 
  ellipse(mouseX,mouseY,random(10,50),random(10,50));
 ellipse(mouseX+random(10,50),mouseY+random(10,50),random(10,50),random(10,50));
   ellipse(mouseX-random(10,50),mouseY-random(10,50),random(10,50),random(10,50)); 
  }



