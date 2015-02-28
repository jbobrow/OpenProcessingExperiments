
color c;

void setup(){
  size(400,390);
  background(255);
  c = color(0);
}

void draw() {
  stroke(0);
  strokeWeight(1);
  fill(255,0,0);
  rectangle(0);
  fill(255,143,5);
  rectangle(30);
  fill(255,247,5);
  rectangle(60);
  fill(133,255,5);
  rectangle(90);
  fill(0,170,18);
  rectangle(120);
  fill(2,191,226);
  rectangle(150);
  fill(2,60,227);
  rectangle(180);
  fill(105,0,255);
  rectangle(210);
  fill(195,0,255);
  rectangle(240);
  fill(255,0,226);
  rectangle(270);
  fill(255,255,255);
  rectangle(300);
  fill(0,0,0);
  rectangle(330);
  noStroke();
  fill(198,190,197);
  rect(0,360,400,30);
    
  mousePressed();

}

void rectangle(int i){
  rect(0,i,30,30);
}

void mousePressed() {
  if(mousePressed){
    if((mouseX >= 0 && mouseX <=30) && (mouseY >= 0 && mouseY <= 30)){
      c = color(255,0,0);
    }else if((mouseX >= 0 && mouseX <=30) && (mouseY >= 30 && mouseY <= 60)){
      c = color(255,143,5);
    }else if((mouseX >= 0 && mouseX <=30) && (mouseY >= 60 && mouseY <= 90)){
      c = color(255,247,5);
    }else if((mouseX >= 0 && mouseX <=30) && (mouseY >= 90 && mouseY <= 120)){
      c = color(133,255,5);
    }else if((mouseX >= 0 && mouseX <=30) && (mouseY >= 120 && mouseY <= 150)){
      c = color(0,170,18);
    }else if((mouseX >= 0 && mouseX <=30) && (mouseY >= 150 && mouseY <= 180)){
      c = color(2,191,226);
    }else if((mouseX >= 0 && mouseX <=30) && (mouseY >= 180 && mouseY <= 210)){
      c = color(2,60,227);
    }else if((mouseX >= 0 && mouseX <=30) && (mouseY >= 210 && mouseY <= 240)){
      c = color(105,0,255);
    }else if((mouseX >= 0 && mouseX <=30) && (mouseY >= 240 && mouseY <= 270)){
      c = color(195,0,255);
    }else if((mouseX >= 0 && mouseX <=30) && (mouseY >= 270 && mouseY <= 300)){
      c = color(255,0,226);
    }else if((mouseX >= 0 && mouseX <=30) && (mouseY >= 300 && mouseY <= 330)){
      c = color(255,255,255);
    }else if((mouseX >= 0 && mouseX <=30) && (mouseY >= 330 && mouseY <= 360)){
      c = color(0,0,0);
    }else if((mouseX >= 0 && mouseX <=400) && (mouseY >= 360 && mouseY <= 390)){
      background(255);
    }  
  
    strokeWeight(3);
    stroke(c);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}



