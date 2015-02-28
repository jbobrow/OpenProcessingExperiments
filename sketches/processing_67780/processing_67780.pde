
PFont font;

void setup() {
  size(600, 600);
  background(150);
  smooth();
  font = loadFont("AlBayan-48.vlw");
  stroke(0);
  textFont(font,50);
}

void draw() {
  
  rect(0,0,30,20);
  
  if (mouseX < 30 && mouseY < 20){
    text("Erase", 50,50);
  }
  else {
   
    
  }
  
  
  if (keyPressed){
           if (key == '1'){
        strokeWeight(1);
    } else if (key == '2'){
        strokeWeight(2);
    } else if (key == '3'){
        strokeWeight(3);
    } else if (key == '4'){
        strokeWeight(4);
    } else if (key == '5'){
        strokeWeight(5);
    } else if (key == '6'){
        strokeWeight(6);
    } else if (key == '7'){
        strokeWeight(7);
    } else if (key == '8'){
        strokeWeight(8);
    } else if (key == '9'){
        strokeWeight(9);
    } else if (key == '0'){
        strokeWeight(10);
    } else if (key == 'g'){
        stroke(0,255,0);
        fill(0,255,0);
    } else if (key == 'r'){
        stroke(255,0,0);
        fill(255,0,0);
    } else if (key == 'b'){
        stroke(0,0,255);
        fill(0,0,255);
    } else if (key == 'w'){
        stroke(255);
        fill(255);
    } else if (key == 'B'){
        stroke(0);
        fill(0);
    } else if (key == 'y'){
        stroke(255,255,0);
        fill(255,255,0);
    } else if (key == 'p'){
        stroke(255,0,255);
        fill(255,0,255);
    } else if (key == 'l'){
        stroke(0,255,255);
        fill(0,255,255);
    }
  }
  
  
  if (keyPressed){
    if (key == 'L'){
      if (mousePressed && (mouseButton == LEFT)) {
        line(pmouseX, pmouseY, mouseX, mouseY);
      }
    } else if (key == 'R'){
      if (mousePressed){
        rectMode(CENTER);
        rect(mouseX,mouseY,40,40);
      }
    }
  }
  if (mouseX < 30 && mouseY < 20){
    mouseClicked();
    if (mousePressed){
      fill(255);
      rectMode(CORNER);
      rect(0,0,30,20);
      background(150);
    } 
  }
        
  
}


