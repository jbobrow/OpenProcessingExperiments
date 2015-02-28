
color COLOR;
  color BLUE = color(0,0,255);
  color RED = color(255,0,0);
  int x,y;
  
void setup() {
  size(300,300);                        //size
  background(255);                      //background is white
  fill(0);                              //the line is black
  noLoop();
  line(100,0, 100,300);                 //left line
  line(200,0, 200,300);                 //right line
    
  line(0,100, 300,100);                 //top line
  line(0,200, 300,200); 
}

void draw() {
}

void mouseReleased(){
 if(mouseReleased){
  println("mousereleased");

  x = mouseX;
  y = mouseY;
  println("gotxy");
  if(COLOR == BLUE){
    COLOR == RED;
    println("RED");
  }
  else if(COLOR == RED){
    COLOR == BLUE;
  }
 
  println("if done");
  }
    fill(COLOR);
  ellipse(x,y,20,20);
  println("Ellipse");
}
