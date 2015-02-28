

color RED = color(255,0,0);
color BLUE = color(0,0,255); 
color BLACK = color(0,0,0);
color COLOR = BLACK;
void setup(){
  size(300,300);                        //size
  background(255);                      //background is white
  noLoop();
  //PFont fontA = loadFont("courier");
  //textFont(fontA, 14); 
  fill(0);                              //the line is black
  line(100,0, 100,300);                 //left line
  line(200,0, 200,300);                 //right line
    
  line(0,100, 300,100);                 //top line
  line(0,200, 300,200);                 //bottom line
  noStroke();
  
}

void draw(){
}

void mousePressed(){


  int n = 9;
    if(mousePressed){
      if(COLOR == BLUE){
        println("BLUE to RED");
        COLOR = RED;

      }
      else if(COLOR == RED){
        println("RED to BLUE");
        COLOR = BLUE;
      }
      else{
        COLOR = BLACK;
        println("BLACK to RED");
        COLOR = RED;
      }
      get(mouseX,mouseY);
      if(mouseX >= 0 && mouseX <= 100 && mouseY >= 0 && mouseY <= 100){
        fill(COLOR);
        ellipse(50,50,50,50);
        println("1,1");
      }
      else if(mouseX >= 100 && mouseX <= 200 && mouseY >= 0 && mouseY <= 100){
        fill(COLOR);
        ellipse(150,50,50,50);
        println("1,2");
      }
      else if(mouseX >= 200 && mouseX <= 300 && mouseY >= 0 && mouseY <= 100){
        fill(COLOR);
        ellipse(250,50,50,50);
        println("1,3");
      }
      else if(mouseX >=00 && mouseX <= 100 && mouseY >= 100 && mouseY <= 200){
        fill(COLOR);
        ellipse(50,150,50,50);
        println("2,1");
      }
      else if(mouseX >= 100 && mouseX <= 200 && mouseY >= 100 && mouseY <= 200){
        fill(COLOR);
        ellipse(150,150,50,50);
        println("2,2");
      }
      else if(mouseX >= 200 && mouseX <= 300 && mouseY >= 100 && mouseY <= 200){
        fill(COLOR);
        ellipse(250,150,50,50);
        println("2,3");
      }
      else if(mouseX >= 0 && mouseX <= 100 && mouseY >= 200 && mouseY <= 300){
        fill(COLOR);
        ellipse(50,250,50,50);
        println("3,1");
      }
      else if(mouseX >= 100 && mouseX <= 200 && mouseY >= 200 && mouseY <= 300){
        fill(COLOR);
        ellipse(150,250,50,50);
        println("3,2");
      }
      else if(mouseX >= 200 && mouseX <= 300 && mouseY >= 200 && mouseY <= 300){
        fill(COLOR);
        ellipse(250,250,50,50);
        println("3,3");
      }
      
      
    }

  
}
