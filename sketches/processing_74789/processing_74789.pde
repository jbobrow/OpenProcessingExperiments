
int counter = 1;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  stroke(0);
  line(40, 0, 40, 400);
  cursor(ARROW);
  if(mousePressed && mouseButton==LEFT && mouseX> 40) {
    changeColor();
    line(mouseX, mouseY, pmouseX, pmouseY);
  }

  fill(0);
  text("Delete", width - textWidth("Delete")-20, 380);
  
  if(mousePressed && mouseX > 350 && mouseX < 400 && mouseY > 370 && mouseY < 400) {
    background(255);
    stroke(0);
    line(40, 0, 40, 400);
  }
  
   noStroke();
   fill(0);
   rect(10, 10, 20, 20); 
   fill(255, 0, 0);
   rect(10, 40, 20, 20);
   fill(0, 255, 0);
   rect(10, 70, 20, 20);
   fill(0, 0, 255);
   rect(10, 100, 20, 20);
   fill(255, 255, 0);
   rect(10, 130, 20, 20);    
}

void mouseClicked() {
  if(mouseY>10 && mouseY<30 && mouseX >10 && mouseX < 30) {
    counter=1;
  }
  
  else if(mouseY>40 && mouseY<60 && mouseX >10 && mouseX < 30) {
    counter=2;
  }
  
  else if(mouseY>70 && mouseY<90 && mouseX >10 && mouseX < 30) {
    counter=3;
  }
  
  else if(mouseY>100 && mouseY<120 && mouseX >10 && mouseX < 30) {
    counter=4;
  }
  
  else if(mouseY>130 && mouseY<150 && mouseX >10 && mouseX < 30) {
    counter=5;
  }
}
  
// CHANGE THE COLOR
void changeColor() {
  
  if (counter==1) {
    stroke(0);
  }
  
   else if(counter==2) {
     stroke(255, 0, 0);
   }
   
   else if(counter==3) {
     stroke(0, 255, 0);
   }
   
   else if(counter==4) {
     stroke(0, 0, 255);
   }
   
   else if(counter==5) {
     stroke(255, 255, 0);
   }
}
