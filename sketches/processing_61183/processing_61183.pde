
import controlP5.*;


RFont font;
String input = "FLIESEN";
float angle = 0;

ControlP5 controlP5;
  
float part1 = 30;
float part2 = 40;
float part3 = 40;





void setup() {
  
  size(800,300);

  background(255);
  noLoop();
  colorMode(RGB, 30);
  
  RG.init(this);
  font = new RFont("Impact.ttf");
  font.setSize(100);
  translate(300,100);
  font.draw(input);

  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("part1", 0, 300, 10, 10, 20, 200, 10);
  controlP5.addSlider("part2", 0, 300, 30, 10, 40, 200, 10);
  controlP5.addSlider("part3", 0, 300, 50, 10, 60, 200, 10);   
}

 
void draw() {
  noStroke();
          
  for (int i = 5; i <= width; i+=120) {
     for (int y = 20; y <= height; y+=12) {  
      fill(random(0,80),random(40,50), random(255,255));
      rect(i, y, 10, 10);
     }
     
    rect(300,100, 100, part1);
  fill(0, 15, 0);
  rect(400,100, 100, part3);
  fill(0, 0, 14);
  rect(500, 100, 100, part2);
  fill(30, 0, 0);
  }
}

void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}

void keyPressed() {
  if (key== 's' || key == 'S') {
    println("Frame abspeichern");
    saveFrame("fliesen.gif");
  }
  
  if(key == 'b' || key == 'B'){
    beginRecord(PDF,"fliesen.pdf");
  }
    
  if(key == 'e' || key == 'E'){
    endRecord();
  }
}


