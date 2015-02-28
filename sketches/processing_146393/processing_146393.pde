
int circleW=15;
int circleH=15;
int theSpace=circleW/3;
int redColor = int(random(10,255));
int greenColor= int(random(50,255));
int blueColor = int(random(200,255));


import controlP5.*;
ControlP5 cp5;


  
void setup(){
smooth () ;
  size(1440,900);
  background (0);
  noFill();
  stroke(255);
  strokeWeight(2);
  ellipse(720,350,450,450);

  PFont font = createFont("Replica-Mono", 20);

 
  textFont(font,18);
  fill(255, 255, 255);

  text("1.Trace the circle", 40, 55);
 fill(255, 255, 255);

  textFont(font, 18);

  text("2.Type your name", 40, 80);
 fill(255, 255, 255);

  textFont(font, 18);
  text("3.Press the number zero", 40, 105);

  
  textFont(font, 50);
  fill(255, 255, 255);
 String[] surface = { "TRUTH", "CHAOS", "EMPTY", "SEX", "ORDER" };
  int index1 = int(random(surface.length));
  text( surface[index1] , 640, 370);
 



   cp5 = new ControlP5(this);
   
   cp5.setColorForeground(100);
  cp5.setColorBackground(100);
  cp5.setColorActive(100);
  
  cp5.addTextfield("---------------------------------------------------------------------------")
    .setPosition(578, 700)
     .setSize(300, 40)
     .setFont(createFont("Replica-Mono",14))
     .setAutoClear(false)
     ;
 
}
  




   


void draw() {

   strokeWeight(random(.25,20));

   for (int i = 0; i < width-circleW/2; i = i+(circleW+theSpace)) {
    stroke(random(255), random(255), random(255), 150);
   }
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    
  } 
 
  }


void keyPressed() {
  if (key == '0') {
    saveFrame("images/artwork-####.png");;
    endRecord();
     setup();

  }

}


