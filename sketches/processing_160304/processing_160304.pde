
//Triangle Patterns
//Create triangles with one vertex using mouse coords()
//Press mouse & drag to create triangles
//Click on top bar to cycle colors (vary mouseX for Hue)
//Press 'R' for clearing (& choosing random color)
//Press 'Space' for a screenshot
//Created by @rasagy

color myColor;

void setup() {
  size(600, 500);
  colorMode(HSB, 100);
  background(98);  
  randomizeColor(random(100));
}
void draw() { 
  if (mousePressed && mouseY>10) {
    //background(250,250,250,10);
    beginShape();
    fill(myColor,8);
    noStroke();
    vertex(width/4, height/2);
    vertex(width*3/4, height/2);
    vertex(mouseX, mouseY);
    endShape();
  }
}

void randomizeColor(float hue) {
  myColor=color(random(5)+hue, random(30)+60, random(20)+70);  
  strokeWeight(10);
  stroke(myColor);
  line(0,5,width,5);
}

void mousePressed() {
  //  setup();
  if(mouseY<10)
    randomizeColor(map(mouseX,0,width,0,100));
}

void keyPressed() {
  if (key == ' ')
  {
    saveFrame("/print/prism"+int(random(100))+".png");
//    setup();
  } else if (key == 'r' || key == 'R')
  {  
    setup();
  }
}


