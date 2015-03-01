
int x = 0;
PImage img;
int count;

void setup() {
  size(600, 700);
  background(255);
    smooth();
       img = loadImage("PeachCGicon.png");
    image(img, 0, 0);
img.resize(300, 300);

  //palette background
  fill(224, 195, 147);
  rect(0, 0, 155, 700);
  //colors
  fill(0, 0, 0);
  ellipse(30, 50, 40, 40);
  fill(255, 255, 255);
  ellipse(90, 100, 40, 40);
  fill(255, 0, 0);
  ellipse(30, 150, 40, 40);
  fill(252, 110, 15);
  ellipse(90, 200, 40, 40);
  fill(254, 255, 8);
  ellipse(30, 250, 40, 40);
  fill(65, 175, 7);
  ellipse(90, 300, 40, 40); 
  fill(48, 60, 252);
  ellipse(30, 350, 40, 40);
  fill(26, 234, 255);
  ellipse(90, 400, 40, 40);
  fill(159, 26, 255);
  ellipse(30, 450, 40, 40);
  fill(252, 168, 233);
  ellipse(90, 500, 40, 40);
  fill(255, 57, 163);
  ellipse(30, 550, 40, 40);
  fill(255, 230, 191);
  ellipse(90, 600, 40, 40);
  fill(106, 65, 0);
  ellipse(30, 650, 40, 40);
}

 void draw(){

   
  if (mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  if (keyPressed) {

    }
    if (key == '1') {
      stroke(0, 0, 0);
    }
    if (key == '2') {
      stroke(255, 255, 255);
    }
     if (key == '3') {
      stroke(255, 0, 0);
    }
    if (key == '4') {
      stroke(252, 110, 15);
    }
    if (key == '5') {
      stroke(254, 255, 8);
    }
     if (key == '6') {
      stroke(65, 175, 7);
    }
    if (key == '7') {
      stroke(48, 60, 252);
    }
    if (key == '8') {
      stroke(26, 234, 255);
    }
    if (key == '9') {
      stroke(159, 26, 255);
    }
    if (key == '0') {
      stroke(252, 168, 233);
    }
     if (key == 'q') {
      stroke(255, 57, 163);
    }
    if (key == 'w') {
      stroke(255, 230, 191);
    }
    if (key == 'e') {
      stroke(106, 65, 0);
    }
    //crazy circles
    if (key == 'r') {
       stroke(random(255), random(255), random(255));
       strokeWeight(x++);
       }
   //size keys
    
    if (key == '+') {
       strokeWeight(x++);
    }
    if (x == 0) {
       x = 0;
    } else if (key == '-'){
      strokeWeight(x--);
    }
    // squares (t)
    if(key == 't'){
    if (mousePressed && (mouseButton == LEFT)) {
      fill(random(255),random(256),random(256));
      noStroke();
      rect(mouseX,mouseY,30,30);}
      }
    

   
if(keyPressed){
    if (key == 'd') {
      image(img, mouseX-75,mouseY-75,150,150);
   
  }
  
    
  }

 
    }
      


      






