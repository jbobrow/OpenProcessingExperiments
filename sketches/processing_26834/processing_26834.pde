
//Peter Pham z3290539 Assignment
//Painting program

//DECLARATIONS
int r;
int g;
int b;
int t = 255;
int sizeX = 25;
int sizeY = 25;
int rubSizeX = 25;
int rubSizeY = 25;
PFont f;


//INITIAL SETUP
void setup(){
 background(255);
 size(900, 900);
 smooth(); 
 f = loadFont("Dialog-16.vlw");
 noFill();
 noStroke();

//INSTRUCTIONS
 textFont(f);
 fill(0);
  text ("Press/Hold O to decrease brush size", 10, height-110);
  text ("Press/Hold P to increase brush size", 10, height-90);
  text ("Press/Hold K to decrease rubber size", 10, height-70);
  text ("Press/Hold L to increase rubber size", 10, height-50);
  text ("Press/Hold N to decrease opacity", 10, height-30);
  text ("Press/Hold M to increase opacity", 10, height-10);
  text ("S: Save as artwork.png", 714, height-70);
  text ("Left click: Pick Colour/Draw", 672, height-50);
  text ("Right click: Erase", 756, height-30);
  text ("Space bar: Clear Screen", 707, height-10);
  
}

//REPEAT

//void mouseMoved(){
//fill(r, g, b);
//stroke(0);
//background(255);
//ellipse(mouseX, mouseY, sizeX, sizeY);
//}

void draw(){
  //GREY PALETTE
  stroke(0);
  fill(200);
  rect(0, 0, 185, 80);
  noStroke(); 
  //COLOUR SELECTION RECTS
  fill(255, 0, 0);
  rect(10, 10, 25, 25);
  fill(0, 255, 0);
  rect(45, 10, 25, 25);
  fill(0, 0, 255);
  rect(80, 10, 25, 25);
  fill(100);
  rect(115, 10, 25, 25);
  fill(255);
  rect(150, 10, 25, 25);
  stroke(255, 0, 0);
  line(150, 10, 175, 35);
  line(175, 10, 150, 35);
  noStroke();
  fill(255, 0, 255);
  rect(10, 45, 25, 25);
  fill(0, 255, 255);
  rect(45, 45, 25, 25);
  fill(0);
  rect(115, 45, 25, 25);
  fill(255, 255, 0);
  rect(80, 45, 25, 25);
  fill(mouseX/2, mouseY/3, mouseX/4);
  rect(150, 45, 25, 25);
  //CURSOR
  if (mouseX < 185 && mouseY < 80){
  cursor(CROSS);
  } else {
  cursor(HAND);
  }
}

void mousePressed() {
    
//CHOOSING COLOUR + AFTEREFFECT
//FIRST ROW
    
  if (mouseX > 10 && mouseX < 35 && mouseY < 35 && mouseY > 10){
    fill(255, 0, 0);
    rect(7.5, 7.5, 30, 30);
    r = 255;
    g = 0;
    b = 0;
  }
  if (mouseX < 70 && mouseX > 45 && mouseY > 10 && mouseY < 35){
    fill(0, 255, 0);
    rect(42.5, 7.5, 30, 30);
    r = 0;
    g = 255;
    b = 0;
  }
  if (mouseX < 105 && mouseX > 80 && mouseY > 10 && mouseY < 35){
    fill(0, 0, 255);
    rect(77.5, 7.5, 30, 30);
    r = 0;
    g = 0;
    b = 255;
  }
  if (mouseX < 140 && mouseX > 115 && mouseY > 10 && mouseY < 35){
    fill(100);
    rect(112.5, 7.5, 30, 30);
    r = 100;
    g = 100;
    b = 100;
  }
  if (mouseX < 175 && mouseX > 155 && mouseY > 10 && mouseY < 35){
    stroke(255, 0, 0);
    strokeWeight(4);
    line(145, 5, 180, 40);
    line(180, 5, 145, 40);
    noStroke();
    strokeWeight(1);
}
  //SECOND ROW
   if (mouseX > 10 && mouseX < 35 && mouseY > 45 && mouseY < 70){
    fill(255, 0, 255);
    rect(7.5, 42.5, 30, 30);
    r = 255;
    g = 0;
    b = 255;
  }
   if (mouseX > 45 && mouseX < 70 && mouseY > 45 && mouseY < 70){
    fill(0, 255, 255);
    rect(42.5, 42.5, 30, 30);
    r = 0;
    g = 255;
    b = 255;
  }
   if (mouseX > 80 && mouseX < 105 && mouseY > 45 && mouseY < 70){
    fill(255, 255, 0);
    rect(77.5, 42.5, 30, 30);
    r = 255;
    g = 255;
    b = 0;
  }
   if (mouseX > 115 && mouseX < 135 && mouseY > 45 && mouseY < 70){
    fill(0);
    rect(112.5, 42.5, 30, 30);
    r = 0;
    g = 0;
    b = 0;
  }
   if (mouseX > 150 && mouseX  <180 && mouseY > 45 && mouseY < 70){
    fill(random(0, 255), random(0, 255), random(0,255));
    rect(147.5, 42.5, 30, 30);
    r = int(random(0, 255));
    g = int(random(0, 255));
    b = int(random(0, 255));
  }
   
  }
    
void mouseDragged() {
 if (mouseButton == RIGHT){
   fill(255);
   ellipse(mouseX, mouseY, rubSizeX, rubSizeY);
 } else {
   fill(r, g, b, t); 
   ellipse(mouseX, mouseY, sizeX, sizeY);
 }}
 
void keyPressed(){
  if (key == ' '){
  //CLEAR
  background(255);
  //INSTRUCTIONS
  textFont(f);
  fill(0);
  text ("Press/Hold O to decrease brush size", 10, height-110);
  text ("Press/Hold P to increase brush size", 10, height-90);
  text ("Press/Hold K to decrease rubber size", 10, height-70);
  text ("Press/Hold L to increase rubber size", 10, height-50);
  text ("Press/Hold N to decrease opacity", 10, height-30);
  text ("Press/Hold M to increase opacity", 10, height-10);
  text ("S: Save as artwork.png", 714, height-70);
  text ("Left click: Pick Colour/Draw", 672, height-50);
  text ("Right click: Erase", 756, height-30);
  text ("Space bar: Clear Screen", 707, height-10);
  }
  if (key == 's'){
   save("artwork.png");
  }
  //DECREASING TRANSPARENCY  
    if (key == 'n'){
    if (t > 5){
      t = t-5;
      fill(r,g,b,t);
    }else{
      t = t;
    }}
  //INCREASING TRANSPARENCY  
    if (key == 'm'){
    if (t < 255){
      t = t+5;
      fill(r,g,b,t);
    }else{
      t = t;
    }}
  //SIZE OF BRUSH
  if (key == 'p'){
  //LIMITING MAX. SIZE TO 100
    if (sizeX > 100 || sizeY > 100){
      sizeX = sizeX;
      sizeY = sizeY;
    } else {
      sizeX = sizeX + 1;
      sizeY = sizeY + 1;
    }}
  if (key == 'o'){
  //LIMITING MIN. SIZE TO 5  
    if (sizeX > 5 || sizeY > 5){
      sizeX = sizeX - 1;
      sizeY = sizeY - 1;
     
    }else{
     sizeX = sizeX;
      sizeY = sizeY;
    }}
  //SIZE OF RUBBER
  if (key == 'l'){
  //LIMITING MAX. SIZE TO 100
    if (sizeX < 100 || sizeY < 100){
      rubSizeX = rubSizeX + 1;
      rubSizeY = rubSizeY + 1;
      } else {
      rubSizeX = rubSizeX;
      rubSizeY = rubSizeY;
    }}
  if (key == 'k'){
  //LIMITING MIN. SIZE TO 5  
    if (rubSizeX > 5 || rubSizeY > 5){
      rubSizeX = rubSizeX - 1;
      rubSizeY = rubSizeY - 1;
     
    }else{
      rubSizeX = rubSizeX;
      rubSizeY = rubSizeY;
    }
}
    


}


//CLASSES

//CUSTOM FUNCTIONS


