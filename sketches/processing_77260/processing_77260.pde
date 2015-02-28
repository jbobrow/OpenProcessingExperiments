
//Alex Zajicek, Midterm Art Program

//To Do List:
//Add another interpretation of "classes"?
//Add a mode where it just draws lines based on sine/cosine stuff

int mode = 1;
int rainbowColor = 0;
int inkLevel = 100;
int mouseSpeed = 0;
float starXpos = 0;
float starYpos = 0;
float planetAngle = 0;
PImage asteroidImg;
SpaceLine[] spaceLines;
boolean spaceLinesVisible = false;

void setup(){
  size(800, 600);
  background(255);
  colorMode(HSB, 360, 100, 100, 100);
  asteroidImg = loadImage("MeteorDrawing(edit).png");
  imageMode(CENTER);
  smooth();
  spaceLines = new SpaceLine[500];
  for(int i = 0; i < spaceLines.length; i++){
    spaceLines[i] = new SpaceLine(random(width), random(height));
  }
}

void draw(){
  bottomBar();
  modeCall();
  if(spaceLinesVisible == true){
    spaceLinesButton();
  }
  //println(spaceLinesVisible);
}


void bottomBar(){ //creates the bar of options on the bottom
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(0, 0, 50);
  rect(0, height-50, width, 50); //gray bar on bottom
  fill(0, 0, 100);
  rect(10, height-40, 35, 35); //mode box
  rect(50, height-40, 35, 35); //mode box2
  fill(0, 0, 0);
  rect(width-40, height-40, 35, 35); // black bg button
  fill(0, 0, 100);
  rect(width-80, height-40, 35, 35); // white bg button
  rect(width-120, height-40, 35, 35); //critique button
  fill(0, 0, 0);
  textSize(15);
  text("Crit", width-115, height-17);
  fill(0, 0, 0);
  rect(width-160, height-40, 35, 35); //random star button
  fill(0, 0, 100);
  noStroke();
  ellipse(width-142, height-23, 8, 8);
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(0, 0, 0);
  rect(width-200, height-40, 35, 35); //random rectangle button
  fill(0, 0, 100);
  rect(width-193, height-33, 22, 22);
  fill(0, 0, 100);
  rect(width-240, height-40, 35, 35); //thirds grid button
  fill(0, 0, 0);
  textSize(11);
  text("3rds", width-235, height-25);
  text("Grid", width-235, height-13);
  fill(0, 0, 0);
  rect(width-280, height-40, 35, 35); //spaceLines button
  noStroke();
  fill(237, 28, 97, 50);
  ellipse(width-267, height-28, 10, 10);
  fill(237, 28, 97, 70);
  ellipse(width-260, height-23, 10, 10);
  fill(237, 28, 97, 90);
  ellipse(width-253, height-18, 10, 10);
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(0, 0, 100);
  rect(width-320, height-40, 35, 35);
  fill(0, 0, 0);
  textSize(9);
  text("Pattern", width-318, height-18);
}

void modeCall(){  //establishes Modes
    if(mode == 1){
    mode1();
    stroke(0, 0, 0);
    strokeWeight(1);
    fill(0, 0, 100);
    rect(10, height-40, 35, 35);
    fill(0, 0, 0);
    textSize(25);
    text("1", 20, height-15);
  } else if (mode == 2){
    mode2();
    stroke(0, 0, 0);
    strokeWeight(1);
    fill(0, 0, 100);
    rect(10, height-40, 35, 35);
    fill(0, 0, 0);
    textSize(25);
    text("2", 20, height-15);
  } else if (mode == 3){
    mode3();
    stroke(0, 0, 0);
    strokeWeight(1);
    fill(0, 0, 100);
    rect(10, height-40, 35, 35);
    fill(0, 0, 0);
    textSize(25);
    text("3", 20, height-15);
  } else if (mode == 4){
    mode4();
    stroke(0, 0, 0);
    strokeWeight(1);
    fill(0, 0, 100);
    rect(10, height-40, 35, 35);
    fill(0, 0, 0);
    textSize(25);
    text("4", 20, height-15);
  } else if (mode == 5){
    mode5();
    stroke(0, 0, 0);
    strokeWeight(1);
    fill(0, 0, 100);
    rect(10, height-40, 35, 35);
    fill(0, 0, 0);
    textSize(25);
    text("5", 20, height-15);
  } else if (mode == 6){
    mode6();
    stroke(0, 0, 0);
    strokeWeight(1);
    fill(0, 0, 100);
    rect(10, height-40, 35, 35);
    fill(0, 0, 0);
    textSize(25);
    text("6", 20, height-15);
  } else if (mode == 7){
    mode7();
    stroke(0, 0, 0);
    strokeWeight(1);
    fill(0, 0, 100);
    rect(10, height-40, 35, 35);
    fill(0, 0, 0);
    textSize(25);
    text("7", 20, height-15);
  }
}


void mode1(){
  if(mousePressed){
    inkLevel = inkLevel-2;
    strokeWeight(10);
    stroke(0, 0, 0, inkLevel);
    line(pmouseX, pmouseY, mouseX, mouseY);
  } else {
    inkLevel = 100;
  }
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(0, 0, 0);
  noStroke();
  ellipse(68, height-23, 25, 25);
}

void mode2(){
  mouseSpeed = (abs(mouseX-pmouseX) + abs(mouseY-pmouseY))/2;
  if(mousePressed){
    rainbowColor++;
    if (rainbowColor > 360){
      rainbowColor = 0;
    }
    strokeWeight(mouseSpeed);
    stroke(rainbowColor, 80, 70);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(rainbowColor, 80, 70);
  noStroke();
  ellipse(68, height-23, 25, 25);
}

void mode3(){
  if(mousePressed){
    starXpos = random(-25, 25);
    starYpos = random(-25, 25);
    starShape(mouseX+starXpos, mouseY+starYpos);
  }
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(0, 0, 0);
  noStroke();
  
  //The following code draws a star in Mode Box 2
  
  int angle = 0;
  int starSize;
  starSize = 15;
  angle = angle + 180;
  pushMatrix();
  translate(68, height-22);
  rotate(radians(180));
  noStroke();
  fill(47, 72, 94);
  beginShape();
    for(int i = 0; i < 360*2+1; i = i + 144){
    vertex(starSize*sin(radians(i)), starSize*cos(radians(i)));
    }
  endShape();
  popMatrix();
}

void mode4(){
  if(mousePressed){
    strokeWeight(20);
    stroke(0, 100, 100, 50);
    line(pmouseX, pmouseY+60, mouseX, mouseY+60);
    stroke(27, 100, 100, 50);
    line(pmouseX, pmouseY+40, mouseX, mouseY+40);
    stroke(57, 100, 100, 50);
    line(pmouseX, pmouseY+20, mouseX, mouseY+20);
    stroke(122, 100, 80, 50);
    line(pmouseX, pmouseY, mouseX, mouseY);
    stroke(237, 100, 93, 50);
    line(pmouseX, pmouseY-20, mouseX, mouseY-20);
    stroke(264, 100, 85, 50);
    line(pmouseX, pmouseY-40, mouseX, mouseY-40);
    stroke(285, 100, 85, 50);
    line(pmouseX, pmouseY-60, mouseX, mouseY-60);
  }
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(0, 0, 0);
  noStroke();
  fill(285, 100, 85);
  ellipse(68, height-35, 5, 5);
  fill(264, 100, 85);
  ellipse(68, height-31, 5, 5);
  fill(237, 100, 93);
  ellipse(68, height-27, 5, 5);
  fill(122, 100, 80);
  ellipse(68, height-23, 5, 5);
  fill(57, 100, 100);
  ellipse(68, height-19, 5, 5);
  fill(27, 100, 100);
  ellipse(68, height-15, 5, 5);
  fill(0, 100, 100);
  ellipse(68, height-11, 5, 5);
}

void mode5(){
  if(mousePressed){
  Planet(mouseX, mouseY);
  }
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(0, 0, 0);
  noStroke();
  fill(28, 56, 44);
  ellipse(68, height-33, 5, 5);
  ellipse(63, height-18, 2, 2);
  ellipse(65, height-25, 6, 6);
}

void mode6(){
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(0, 0, 0);
  noStroke();
  image(asteroidImg, 68, height-23, 30, 30);
}

void mode7(){
  stroke(0, 0, 100);
  strokeWeight(20);
  if(mousePressed){
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(0, 0, 100);
  ellipse(68, height-23, 25, 25);
}
    

void crit(){  //Code adapted from example on http://processing.org/reference/random_.html
  textSize(12);
  fill(random(0, 360), 54, random(20, 90));
  String[] words = { "I like how you did the lines.", "Do better.", "Meh.",
  "Do it at least 25 more times to refine it.", "It needs a lot of work.", "Just give up.",
  "You should start from a blank page.", "Why do you even want to be an artist?",
  "You should have put another hour into this.", "Your composition is awful.",
  "Did you even try?", "We need to talk about your work outside...", "Terrible.",
  "Unacceptable.", "I guess it's okayish.",
  "You should reconsider how you spend your time.", "Just go into accounting.",
  "It would be more successful if you studied Art History." };
  int crit = int(random(words.length));
  text(words[crit], random(5, width-225), random(20, height-100));
}

void starShape(float x, float y){
  int angle = 0;
  float starSize;
  starSize = random(1, 8);
  angle = angle + 180;
  pushMatrix();
  translate(x, y);
  rotate(radians(180));
  noStroke();
  fill(47, 72, 94, 100-((abs(starXpos) + abs(starYpos))/2)*4);
  beginShape();
    for(int i = 0; i < 360*2+1; i = i + 144){
    vertex(starSize*sin(radians(i)), starSize*cos(radians(i)));
    }
  endShape();
  popMatrix();
}

void randElls(){
  for(int i = 0; i < 151; i++){
    float ellSize = random(0, 3);
    noStroke();
    fill(0, 0, 100);
    ellipse(random(0, width), random(0, height-50), ellSize, ellSize);
  }
}

void randRects(){
  for(int i = 0; i < 51; i++){
    noStroke();
    fill(0, 0, 50, random(100));
    rect(random(0, width), random(0, height-50), random(5, 50), random(5, 50));
  }
}

void thirdsGrid(){
  noFill();
  stroke(0, 0, 50, 50);
  strokeWeight(1);
  for(int x = 0; x <= width; x = x + width/3){
    for(int y = 0; y <= height; y = y + height/3){
    rect(x, y, width/3, height/3);
    }
  }
}

void spaceLinesButton(){
  for(int i = 0; i < spaceLines.length; i++){
    spaceLines[i].moveLine();
    spaceLines[i].display();
  }
/*  strokeWeight(1);
  stroke(0, 0, 0);
  fill(rainbowColor, 80, 70);
  noStroke();
  ellipse(64, height-27, 10, 10);
  ellipse(68, height-23, 10, 10);
  ellipse(72, height-19, 10, 10);
  */
}
  
void Planet(float x, float y){
  planetAngle = planetAngle+10;
  float planetSize;
  float planetLight;
  planetSize = random(20);
  planetLight = random(100);
  pushMatrix();
  translate(mouseX-width/2, mouseY-height/2);
  x = 100*cos(radians(planetAngle));
  y = 100*sin(radians(planetAngle))*tan(radians(planetAngle));
  noStroke();
  fill(28, 56, 44, planetLight);
  ellipse(x+width/2, y+height/2, planetSize, planetSize);
  popMatrix();
}

void pmg2Pattern(){
  for(int i = 0; i < 25; i++){
    pushMatrix();
    translate(0, height/2);
    translate(i*50, 0);
    if(i%2 == 0){
      rotate(radians(180));
      imageFlip(asteroidImg, 0, 0, "h2");
    } else {
      imageFlip(asteroidImg, 0, 0, "h2");
    }
  popMatrix();
  }
}

class SpaceLine{
  float lineSpeedX = random(-5, 5);
  float lineSpeedY = random(-5, 5);
  float lineOpacity = 0;
  float opacityDir = .04;
  float x, y, speedX, speedY;
  SpaceLine(float _x, float _y){
    x = _x;
    y = _y;
    speedX = lineSpeedX;
    speedY = lineSpeedY;
  }
  void moveLine(){
    x+=speedX;
    y+=speedY;
    if(mousePressed){
      lineSpeedX = random(-5, 5);
      lineSpeedY = random(-5, 5);
      speedX = lineSpeedX;
      speedY = lineSpeedY;
    }
  }
  void display(){
    noStroke();
    lineOpacity = lineOpacity + opacityDir;
    if(lineOpacity < 0){
      opacityDir = .04;
    } else if(lineOpacity > 100){
      opacityDir = -.04;
    }
    fill(237, 28, 97, lineOpacity);
    ellipse(x, y, 10, 10);
  }
}


void mouseReleased(){
  if(mouseX > 10 && mouseX < 45 && mouseY > height-40 && mouseY < height-5){ //mode button
    if(mode == 1){
      mode = 2;
    } else if (mode == 2){
      mode = 3;
    } else if (mode == 3){
      mode = 4;
    } else if (mode == 4){
      mode = 5;
    } else if (mode == 5){
      mode = 6;
    } else if (mode == 6){
      mode = 7;
    } else if (mode == 7){
      mode = 1;
    }
  }
  if(mouseX > width-40 && mouseX < width-5 && mouseY > height-40 && mouseY < height-5){ //black bg button
    background(0, 0, 0);
  }
  if(mouseX > width-80 && mouseX < width-45 && mouseY > height-40 && mouseY < height-5){ //white bg button
    background(0, 0, 100);
  }
  if(mouseX > width-120 && mouseX < width-85 && mouseY > height-40 && mouseY < height-5){ //crit button
    crit();
  }
  if(mouseX > width-160 && mouseX < width-125 && mouseY > height-40 && mouseY < height-5){ //random ellipse generator
    randElls();
  }
  if(mouseX > width-200 && mouseX < width- 165 && mouseY > height-40 && mouseY < height-5){ //random rect generator
    randRects();
  }
  if(mouseX > width-240 && mouseX < width-205 && mouseY > height-40 && mouseY < height-5){ //Thirds grid button
    thirdsGrid();
  }
  if(mouseX > width-280 && mouseX < width-245 && mouseY > height-40 && mouseY < height-5){ //spaceLines button
    if(!spaceLinesVisible){
      spaceLinesVisible = true;
    } else if (spaceLinesVisible){
      spaceLinesVisible = false;
    }
    //println(spaceLinesVisible);
  }
  if(mouseX > width-320 && mouseX < width-285 && mouseY > height-40 && mouseY < height-5){ //pattern button
    pushMatrix();
    rotate(random(radians(360)));
    translate(-width/2, -height/2);
    pmg2Pattern();
    popMatrix();
  }
  if(mode == 6){
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(radians(random(0, 360)));
    image(asteroidImg, 0, 0);
    popMatrix();
  }
}

//imageFlip function by nick lally
//paste function at the bottom of your sketch, and use like this: imageFlip(imageName,x,y,"mode")
//modes are "v", "v2", "h", "h2"
//"v" mirrors vertically, "v2" mirrors top half vertically
//"h" mirrors horizontally, "h2" mirrors left half horizontally
void imageFlip(PImage imageName, int xPos, int yPos, String mode){

 //records original pixel config so it can set it back at the end
 imageName.loadPixels();
 int ogImage[] = new int[imageName.width*imageName.height];
 for(int i = 0; i < imageName.width*imageName.height; i++){
   ogImage[i] = imageName.pixels[i];
 }
 imageName.updatePixels();

 //"v2" flips the top half of the image across the x-axis
 if(mode == "v2"){
   imageName.loadPixels();
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = imageName.pixels[i*(imageName.width) + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);

 //"v" flips the entire image across the x-axis
 }else if(mode == "v"){
   imageName.loadPixels();
   int tempImage[] = new int[imageName.width*imageName.height];
   for(int i = 0; i < imageName.width*imageName.height; i++){
    tempImage[i] = imageName.pixels[i];
   }

   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = tempImage[i*(imageName.width) + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);

 //"h2" flips the left half of the image across the y-axis
 }else if(mode == "h2"){
   imageName.loadPixels();
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[i*imageName.width + j] = imageName.pixels[(i+1)*(imageName.width) - j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);

 //"h" flips the entire image across the y-axis
 }else if(mode == "h"){
   imageName.loadPixels();
   int tempImage[] = new int[imageName.width*imageName.height];
   for(int i = 0; i < imageName.width*imageName.height; i++){
    tempImage[i] = imageName.pixels[i];
   }
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(i+1)*(imageName.width) - j] = tempImage[i*imageName.width + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);
 } else {
   println("No mirror direction specified!");
   println("Use v, v2, h, or h2 for the 4th argument");
 }

 //resets image to original
 imageName.loadPixels();
 for(int i = 0; i < imageName.width*imageName.height; i++){
   imageName.pixels[i] = ogImage[i];
 }
 imageName.updatePixels();
}

