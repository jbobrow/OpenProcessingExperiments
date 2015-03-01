
Square[] shapes = new Square[100];

import controlP5.*;

ControlP5 MyController;

int R = 255;
int G = 255;
int B = 255;
int T = 255;
int D = 100;

boolean Shape = true;





void setup() {
  size(1000, 1000);
  background(0);
  smooth();
  instruct();
  MyController = new ControlP5(this);

  MyController.addSlider("T",0,255,255,15,25,100,10);
  MyController.controller("T").setColorForeground(#707070);
  MyController.controller("T").setColorBackground(#505050);
  MyController.controller("T").setColorLabel(#FFFFFF);
  MyController.controller("T").setColorActive(#FFFFFF);
  MyController.controller("T").setLabel("Opacity");
  
  MyController.addSlider("D",0,1000,100,15,40,100,10);
  MyController.controller("D").setColorForeground(#707070);
  MyController.controller("D").setColorBackground(#505050);
  MyController.controller("D").setColorLabel(#FFFFFF);
  MyController.controller("D").setColorActive(#FFFFFF);
  MyController.controller("D").setLabel("Diameter");

  MyController.addSlider("R",0,255,255,15,55,100,10);
  MyController.controller("R").setColorForeground(#FF0000);
  MyController.controller("R").setColorBackground(#505050);
  MyController.controller("R").setColorLabel(#FF0000);
  MyController.controller("R").setColorActive(#FF0000);
  MyController.controller("R").setLabel("Red");
  
  MyController.addSlider("G",0,255,255,15,70,100,10);
  MyController.controller("G").setColorForeground(#00FF00);
  MyController.controller("G").setColorBackground(#505050);
  MyController.controller("G").setColorLabel(#00FF00);
  MyController.controller("G").setColorActive(#00FF00);
  MyController.controller("G").setLabel("Green");
  
  MyController.addSlider("B",0,255,255,15,85,100,10);
  MyController.controller("B").setColorForeground(#0000FF);
  MyController.controller("B").setColorBackground(#505050);
  MyController.controller("B").setColorLabel(#0000FF);
  MyController.controller("B").setColorActive(#0000FF);
  MyController.controller("B").setLabel("Blue");
  
  MyController.addToggle("Shape",45,110,40,40);
  MyController.controller("Shape").setColorForeground(#707070);
  MyController.controller("Shape").setColorBackground(#707070);
  MyController.controller("Shape").setColorActive(#505050);
  MyController.controller("Shape").setLabel("    Shape");
  
  //MyController.addButton("Square", 0,20,75,40,40);
  //MyController.controller("Square").setLabel(" Square");
  
  //MyController.addButton("Circle", 1,70,75,40,40);
  //MyController.controller("Circle").setLabel("  Circle");
}

void draw() {
  background(0, 10);
  if (keyPressed)
    shapes = (Square[])append(shapes, new Square(mouseX, mouseY));  
    if(Shape==true) {
    drawRect();
  } else {
    drawEllipse();  
  }
  for (int i = 0; i<shapes.length; i++) {
    if (shapes[i]!=null)
      shapes[i].expandDiameter();    
  }
 instruct();
}

void instruct(){
  fill(255);
  textSize(13);
  text("Hold Any Key to Draw", 175, 40);
  text("Spacebar to Reset", 175, 55);
  text("Esc to Quit", 175, 70); 
}

void keyReleased(){
    if (key == ' '){
    shapes = new Square[100];
    setup();
    }
   
   /* if (key == 'a'){
      noLoop();
    }
    if (key == 'd'){
      loop();
    }
    if (key == 'w'){
      saveFrame("images/frame-###.png");
    }
    
   */
}

public class Square {
  int x;
  int y;
  int diam;
  int count; 

  public Square(int g, int h) {
    x = g;
    y = h;
    diam = 1;
    count = 0;
  }

  public void expandDiameter() {
    if (count == 0) {
      if (diam<D)
        diam++;
      else
        count = 1;
    }
    if (count == 1) {
      if (diam>0)
        diam--;
      else
        count = 0;
    }
  }
}

public void drawRect() {
  for (int i = 0; i<shapes.length; i++) {
    if (shapes[i]!=null)
      rect(shapes[i].x, shapes[i].y, shapes[i].diam, shapes[i].diam);
      fill(random(R),random(G),random(B),T);
      noStroke();      
  }
}

public void drawEllipse() {
  for (int i = 0; i<shapes.length; i++) {
    if (shapes[i]!=null)
      ellipse(shapes[i].x, shapes[i].y, shapes[i].diam, shapes[i].diam);
      fill(random(R),random(G),random(B),T);
      noStroke();    
  }
}

