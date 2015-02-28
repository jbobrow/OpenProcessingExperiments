
void setup(){
  size(500,500);
}

int value= 0;
color w = color(255);
color r = color(255,0,0);
color g = color(0,255,0);
color b = color(0,0,255);
color gr =color(200);
color squareColor = gr;
color circleColor = gr;
color triangleColor = gr;

void draw(){

  background(255);
  
  drawSquare(100, 400);
  drawCircle(250, 400);
  drawTriangle(400,350);
  
  pushMatrix();
  noStroke();
  fill(r);
    rect(100, 100, 100, 100);
    fill(g);
    rect(250, 100, 100, 100);
    fill(b);
    rect(400, 100, 100, 100);
 popMatrix();
  
}

void drawSquare(int theX, int theY){
  rectMode(CENTER);
  fill(squareColor);
  rect(theX, theY, 100, 100);
}
  
  void drawCircle(int theX, int theY){
  ellipseMode(CENTER);
 fill(circleColor);
  ellipse(theX, theY, 100, 100);
}
  
  void drawTriangle(int theX, int theY){
 rectMode(CENTER);
 fill(triangleColor);
  triangle(400, 350, 400-60, 350+100, 400+60, 350+100);
}
  
  void mousePressed(){
    
    println(mouseX+","+mouseY);
    if (mouseX>50 && mouseX<150 && mouseY>350 && mouseY<450) {
      println("square clicked");
       squareColor = r;
       
      //fill (r);
      //drawSquare(100, 400);
      
    } if (mouseX> 200 && mouseX<300 && mouseY>350 && mouseY<450) { 
      circleColor = g;
      //fill (g);
      //drawCircle(250, 400);
    } if (mouseX> 350 && mouseX<450 && mouseY>350 && mouseY<450){   
      triangleColor = b;
      //fill (b);  
       //drawTriangle(250, 400);
       
    }
  //  return drawSquare; return drawCircle; return drawTriangle;
  
  
  
  }
 
