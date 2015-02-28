
// comments go here


void setup()
{
  size(300,300);                        //size
  background(255);                      //background is white
  fill(0);                              //the line is black
  noLoop();
  //PFont fontA = loadFont("courier");
  //textFont(fontA, 14);  
  line(100,0, 100,300);                 //left line
  line(200,0, 200,300);                 //right line
   
  line(0,100, 300,100);                 //top line
  line(0,200, 300,200);                 //bottom line

  
}

void draw(){  
    

}

void mouseClicked() {
  color COLOR;
  color BLUE = color(0,0,255);
  color RED = color(255,0,0);
  COLOR = RED;
  while(true){
    get(mouseX,mouseY);
    if(COLOR = RED){
      COLOR = BLUE;
    }
    else if(COLOR = BLUE){
      COLOR = RED;
    }
    fill(COLOR);
    if(mouseX >= 0 && mouseY >= 0) {
      ellipse(50,50,50,50);
    }
  }
}


