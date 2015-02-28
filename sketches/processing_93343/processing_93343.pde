
//Gabriela Nisenbaum
//march 16, 2013
//Apples
 
float gravity = 0.25;
Apple billy = new Apple();
boolean clicked;
 
void setup () {
  size (500, 500);
  clicked = false;
}
void draw () {
  background (101, 198, 222);
  fill (116, 229, 79);
  rect (0, 450, width, 50);
  billy.display();
  if (clicked == true) {
  billy.fall();
  }
}


  
 void mouseClicked () {
  clicked = true;
 }
  
   
 class Apple {
  float x;
  float y;
  float w;
  float h;
  float speed;
   
  Apple () {
    x = 250;
    y = 70;
    w = 30;
    h = 50;
    speed = 0;
  }

  //functions
  void display () {
  //tree
  fill(38, 103, 26);
  ellipse(200, 110, 120, 120);
  ellipse(180, 140, 120, 120);
  ellipse(180, 170, 120, 120);
  ellipse(125, 230, 100, 100);
  ellipse(125, 70, 100, 100);
  ellipse(30, 70, 100, 100);
  ellipse(60, 50, 100, 100);
  ellipse(54, 137, 150, 150);
  fill(64, 46, 21);
  beginShape();
  curveVertex(0, 500);
  curveVertex(0, 500);
  curveVertex(5,375);
  curveVertex(2, 250);
  curveVertex(2, 250);
  vertex(125, 200);
  curveVertex(125, 200);
  curveVertex(125, 200);
  curveVertex(115, 375);
  curveVertex(130, 500);
  curveVertex(130, 500);
  endShape();
  fill(38, 103, 26);
  ellipse(105, 210, 90, 90);
  ellipse(30, 230, 100, 100);
     
  //apples
  fill (48, 157, 85);
  ellipse (225, y, 10, 5);
  strokeWeight (3);
  stroke (108, 78, 78);
  line (240, y+30, 230, y-5);
  noStroke();
  fill (255, 0, 0);
  ellipse (240, y+30, 40, 50);
     
  fill (48, 157, 85);
  ellipse (175, y, 10, 5);
  strokeWeight (3);
  stroke (108, 78, 78);
  line (190, y+40, 180, y-10);
  noStroke();
  fill (255, 0, 0);
  ellipse (190, y+40, 40, 50);
   
  fill (48, 157, 85);
  ellipse (180, y, 10, 5);
  strokeWeight (3);
  stroke (108, 78, 78);
  line (195, y-30, 180, y-20);
  noStroke();
  fill (255, 0, 0);
  ellipse (195, y-30, 40, 50);
   
  fill (48, 157, 85);
  ellipse (50, y, 10, 5);
  strokeWeight (3);
  stroke (108, 78, 78);
  line (70, y+20, 45, y-10);
  noStroke();
  fill (255, 0, 0);
  ellipse (70, y+20, 40, 50);
   
 /* fill (48, 157, 85);
  ellipse (100, y, 10, 5);
  strokeWeight (3);
  stroke (108, 78, 78);
  line (120, y+50, 90, y+50);
  noStroke();
  fill (255, 0, 0);
  ellipse (120, y+80, 40, 50);*/
  
   
  }
      void fall () {
    y = y + speed;
    speed = speed + gravity;
  }

   
   
   
}

