
int eSize;
int x, y;
 
void setup() {
  size(600, 600);    //SIZE
  background(255);   //white
  noStroke();
  smooth();
  fill(0);
}




void draw() {                 //draw
}
 
void mouseDragged(){          //main
  ellipse(mouseX, mouseY, 20, 20);
}
 
 
 

void keyPressed() {
 
  switch(key) {

  case 'q':          //color is BLACK
  fill(0);
  println("q");
  break;



  case 's':          //New
  background(255);
  println("s");
  break;
      
  case 'd':          //Eraser
  fill(255);
  println("d");
  break;
      
      
      
  case 'w':          //color is BLUE
  fill(0, 0, 255);
  println("w");
  break;    
      
  case 'e':          //color is GREEN
  fill(0, 255, 0);
  println("e");
  break;   
      
  case 'r':          //color is RED
  fill(255, 0, 0);
  println("r");
  break;   
      
  case 't':          //color is CYAN
  fill(0, 255, 255);
  println("t");
  break;    
      
  case 'y':          //color is YELLOW
  fill(255, 255, 0);
  println("y");
  break;   
      
  case 'u':          //color is PIMK
  fill(255, 0, 255);
  println("u");
  break;     
      
  case 'i':          //color is LIGHT-GREEN
  fill(128, 255, 0);
  println("i");
  break;    
      
  case 'o':          //color is PURPUL
  fill(168, 0, 168);
  println("o");
  break;   
      
  case 'p':          //color is FLESH
  fill(255, 128, 128);
  println("p");
  break;     
      
      
      
  case 'z':          //stamp-SQUARE(S)
  rect(mouseX, mouseY, 30, 30);
  println("z");
  break;   
  
  case 'x':          //stamp-SQUARE(M)
  rect(mouseX, mouseY, 50, 50);
  println("x");
  break;   
  
  case 'c':          //stamp-SQUARE(L)
  rect(mouseX, mouseY, 70, 70);
  println("c");
  break;   
  
  
  case 'v':          //stamp-CIRCLE(S)
  ellipse(mouseX, mouseY, 30, 30);
  println("v");
  break;  
  
  case 'b':          //stamp-CIRCLE(M)
  ellipse(mouseX, mouseY, 50, 50);
  println("b");
  break;  
  
  case 'n':          //stamp-CIRCLE(L)
  ellipse(mouseX, mouseY, 70, 70);
  println("n");
  break;  
  
  
  
  }
}



























