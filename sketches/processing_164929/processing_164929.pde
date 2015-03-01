
PImage eraser, death, quickScope;
int drip = 0;
float timer = 0.2;
int drip = 0;
float dripY = 0, dripX = 0, d = 0.0, e = 0.0, f = 0.0, g = 0.0, r = random(0, 600);

void setup(){
  size(600, 600);
  background(#FFFFFF);
  eraser = loadImage("Eraser-icon.png");
  death = loadImage("url.jpg");
  quickScope = loadImage("quickscope.jpg");
  
}
  
void draw(){
  
  //update(mouseX, mouseY);
  //timer += 0.0167;
  //drip += 1;
  
//Draw rainbow line  (Brush 1)
  strokeWeight(4);
  smooth();
    if(keyPressed){
      if(key == 'a'){
        float a = random(255), b = random(255), c = random(255);
        stroke(a, b, c);
        line(pmouseX, pmouseY, mouseX, mouseY);
      }
    }
    
// Crazy circles and triangle (Brush 2)
  if(keyPressed){
    if(key == 's'){
       noFill();
       strokeWeight(1);
       stroke(#000000);
       d = d + 0.04;
       e = cos(d)*2;
       scale(e);
       smooth();
       ellipse(mouseX, mouseY, 40, 40);
       f = f + 0.02;
       g = sin(f)*1.5;
       scale(g);
       triangle(mouseX, mouseY, mouseX+150, mouseY+150, r, 0 );
      
    }
  }
//Swag Yolo (Brush 3)
  if(keyPressed){
    if(key == 'd'){
       textSize(70);
       float a = random(255), b = random(255), c = random(255);
       fill(a, b, c);
       text("GET R3KT N00B", 50, 60);
       fill(a, b, c);
       textSize(60);
       text("GTA VII Confirmed!", 10, 500);
       textSize(40);
       fill(#21FF00);
       text("SWAG", mouseX, mouseY);
       fill(#FF001E);
       text("YOLO", mouseX-100, mouseY-100);
       filter(INVERT);
       death.resize(100, 100);
       image(death, 500, 300); 
       quickScope.resize(200, 200);
       image(quickScope, 250, 250);
    }
  }
//clear screen
  if(keyPressed) {
    if (key == ' '){
      fill(#FFFFFF);
      noStroke();
      rect(0,0,600,600);
    }
  }
}
  
/*  
//RGB, BD, MLG, Eraser
  textSize(50);
  float a = random(255), b = random(255), c = random(255);
  fill(a, b, c);
  text("RGB", 10,40);
  noFill();
  stroke(0);
  strokeWeight(3);
  rect(9, 0, 110, 50);    //Rectangle around "RGB"
  fill(0);
  text("BD", 150, 40);
  noFill();
  rect(140, 0, 90, 50);    //Rectangle around "BD"
  text("MLG", 250, 40);
  noFill();
  rect(240, 0, 130, 50);    //Rectangle around "Swag Yolo"
  eraser.resize(90, 70);
  image(eraser, 500, 0);
  
}
*/


