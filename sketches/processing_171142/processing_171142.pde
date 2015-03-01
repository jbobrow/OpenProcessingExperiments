
 float value1=1;
 float value2=1;
 float value3=1;
void setup(){
  size(600, 600);
  // Fons blanc per a pintar
  background(255);
 }

void draw(){
  if (keyPressed){
    if (key == '1') {
    fill (value1,value2,value3);
    rect (mouseX, mouseY, pmouseX, pmouseY);
  }
  if (key == '2') {
    fill(value1,value2,value3);
    ellipse (mouseX, mouseY, pmouseX,pmouseY);
}
  if (key == '3'){
    fill (random(255),value2,value3);
    triangle (mouseX, mouseY, mouseX+50, mouseY, mouseX+25,mouseY+50);
}
  
  if (key == 'w'){
    background(255);
    }
     if (key == '5'){
    value1 =1;
    value2 =1;
    value3=1;
  }

  }
}
void keyPressed() {
  if (key == 'r'){
    value1 = value1+1;
  }
  if (key == 'g'){
    value2 = value2+1;
  }   
  if (key == 'b'){
   value3 = value3+1;
  }
  
}



