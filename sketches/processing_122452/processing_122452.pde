
int x, y;  

  
void setup() {
  size(600, 600);
  background(1,44,4);
  noStroke();
  smooth();
    fill(255);   
}
  void draw() {
}

void mouseDragged(){
    ellipse(mouseX, mouseY, 1.7, 1.7);
   if(key == CODED){
    if(keyCode == LEFT){
      rect(mouseX, mouseY, 6.5, 6.5);
     }else if (keyCode == UP){
      ellipse(mouseX, mouseY, 1.7, 1.7);
     }else if (keyCode == RIGHT){
      ellipse(mouseX, mouseY,22,22);
      fill(1,44,4);//ERASER
     }else if (keyCode == DOWN){
     ellipse(mouseX, mouseY,11,11);
       fill(1,44,4);//eraser
  }
  }
   }

void keyPressed() {
  switch(key) {
    case 'w'://white
      fill(255);   
      break;
    case 'r'://red
      fill(222, 60, 192);   
      break;
    case 'b'://blue
      fill(100, 194, 255);
      break;
    case 'y'://yellow
      fill(250, 255, 10);
      break;
    case 'g'://green
      fill(108, 255, 98);   
      break;
    case 't'://brown
      fill(201, 104, 6);
      break;
    case 'o'://orange
      fill(255, 80, 31);
      break;
   case 'p'://purple
      fill(180, 7, 229);
      break;
   
   case 'k'://background
      fill(1, 44,4);
      break;
   case 'd'://delete
      background(1,44,4);   
      break;

}
}



