
// 2013.10.02  in class practice
// TePangChiang  N76014087
// note: press left button to pull the circle for change color

void setup(){
  size(600,600);
  background(0);
  smooth();
}

void draw(){
  
  background(250);

  if (mousePressed){
    fill(mouseX/2,mouseY/2,(mouseX+400)/2,150);
  } else {
    noStroke();
    fill(mouseX-random(100),mouseY-random(100),random(255));
  }
    noStroke();
    ellipse(mouseX,mouseY,abs(mouseX-200),abs(mouseX-200));
    ellipse(mouseX+(mouseX-300),mouseY+(mouseY-300),abs(mouseX-250),abs(mouseX-250));
    fill(mouseX/2,mouseY/2,(mouseX+400)/2,150);
    ellipse(300,300,mouseX-100,mouseX-100);
    stroke(150);
    noFill();
    ellipse(300,300,(mouseX+100)/2,(mouseX+100)/2);
    ellipse(300,300,(mouseX+500)/4,(mouseX+500)/4);
    ellipse(300,300,600,600);
    ellipse(300,300,400+mouseY/2,400+mouseY/2);
    ellipse(300,300,400+mouseY*3/2,400+mouseY*3/2);
    line(300,0,300,300);
  }

void keyPressed() {
  saveFrame("screen-####.png");
}



