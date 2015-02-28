

Kid a;
Kid a2;

void setup(){
  background(250, 224, 25);
  fill (255, 255, 0);
  size(400, 400);
  smooth();
  a = new Kid ();
  a2 = new Kid ();
}


void draw() {
background(250, 224, 25);
a2.displayFace2();
a.displayFace();
a.move();
a2.move();
}

class Kid {
  float x =width/2;
  float y = height/2;
 
 void move() {
  x = mouseX; 
  y = mouseY;  
 
  }
 
   void displayFace() {
  stroke(0);
  fill(245, 218, 175);
  ellipse(x,y,200,200);
  // characters eyes
  fill(255);
  ellipse(x-50,y,50,60);
  ellipse(x+50,y,50,60);

  //characters pupils
  fill(8, 133, 255);
  ellipse(x-50, y, 30, 40);
  ellipse(x+50, y, 30, 40);
 
 //characters smile
 fill(255);
  ellipse(x+2,y+60, 16, 20);
  
   

  
   }


   void displayFace2() {
  stroke(0);
  fill(245, 218, 175);
  ellipse(x+120,y+120,100,100);
  
   fill(255);
  ellipse(x+100,y+110,20, 30);
  ellipse(x+140,y+110,20, 30);

  //characters pupils
  fill(8, 133, 255);
  ellipse(x+100, y+110, 10, 20);
  ellipse(x+140, y+110, 10, 20);
 
 //characters smile
 fill(255);
  ellipse(x+120,y+140, 10, 12);
   }  

}




