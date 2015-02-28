
Snake[] snakes = new Snake[10];
SnakeBlue[] snakesBlue = new SnakeBlue[10];
SnakeRed[] snakesRed = new SnakeRed[9];
SnakeOrange[] snakesOrange = new SnakeOrange[7];
int snakesCreated;
float degree;
boolean displayBadger;
boolean displayInitialBadger=true;
boolean gameOver=false;
//displayBadger=game start
PFont font;
int level = 1;
int score=5000;
int scoreModifier=1;
//PImage mushroom;

void setup() {
  size(1024,768);
  //mushroom = loadImage("mushroom.png");
  font = loadFont("SansSerif-48.vlw");
  textFont(font,32);
  for(int i=0;i<snakes.length;i++){
    color start = color(0,255,0);
    color end = color(0,55,0);
    color green = lerpColor(start,end,i*.1);
    snakes[i]=new Snake(random(300,width-300),random(height),random(360),green);
  }
  for(int i=0;i<snakesBlue.length;i++){
    color start = color(0,0,200);
    color end = color(0,0,0);
    color blue = lerpColor(start,end,i*.1);
    snakesBlue[i]=new SnakeBlue(random(300,width-300),random(height),random(360),blue);
  }
  for(int i=0;i<snakesRed.length;i++){
    color start = color(255,0,0);
    color end = color(55,0,0);
    color red = lerpColor(start,end,i*.11);
    snakesRed[i]=new SnakeRed(random(300,width-300),random(height),random(360),red);
  }
  for(int i=0;i<snakesOrange.length;i++){
    color start = color(255,255,0);
    color end = color(55,55,0);
    color orange = lerpColor(start,end,i*.14);
    snakesOrange[i]=new SnakeOrange(random(300,width-300),random(height),random(360),orange);
  }
}

void draw() {
  background(255);
  rectMode(CORNER);
  strokeWeight(20);
  fill(255);
  rect(0,0,width,height);
  rectMode(CENTER);
  strokeWeight(1);
  if (level>=1){
    for(int i=0;i<snakes.length;i++){snakes[i].createSnake();}
  }
  if (level>=2){
    for(int i=0;i<snakesBlue.length;i++){snakesBlue[i].createSnakeBlue();}
  }
  if (level>=3){
    for(int i=0;i<snakesRed.length;i++){snakesRed[i].createSnakeRed();}
  }
  if (level>=4){
    for(int i=0;i<snakesOrange.length;i++){snakesOrange[i].createSnakeOrange();}
  }
  if (displayBadger==true){
    score=score-scoreModifier;
    if (level==1 && mouseX>=1000){level++;score=score+5000;}
    if (level==2 && mouseX<=24){level++;score=score+5000;}
    if (level==3 && mouseX>=1000){level++;score=score+5000;}
    if (level==4 && mouseX<=24){level++;scoreModifier=0;score=score+5000;}
    loadPixels();
    int pixelLocation=mouseX+mouseY*width;
    if (brightness(pixels[pixelLocation]) < 255){gameOver=true;}
    if (score==0){gameOver=true;}
  }
  if(displayBadger==true){badger();}
  if(displayInitialBadger==true){initialBadger();}
  if(level==1){mushroom();}
  if(level==2){mushroom2();}
  if(level==3){mushroom();}
  if(level==4){mushroom2();}
  degree=random(360);
  fill(255,0,0);
  if (gameOver==true){rect(width/2,height/2,width,height);scoreModifier=0;level=0;}
  fill(0);
  text(score,100,100);
}

void mousePressed(){
  if(mouseX>=20&&mouseX<=40&&mouseY>=374&&mouseY<=394){displayBadger=true;}
  if(mouseX>=20&&mouseX<=40&&mouseY>=374&&mouseY<=394){displayInitialBadger=false;}
}

void keyPressed(){
  if(displayBadger==true){
  if(key=='1')snakes[0].isRotating= ! snakes[0].isRotating;
  if(key=='2')snakes[1].isRotating= ! snakes[1].isRotating;
  if(key=='3')snakes[2].isRotating= ! snakes[2].isRotating;
  if(key=='4')snakes[3].isRotating= ! snakes[3].isRotating;
  if(key=='5')snakes[4].isRotating= ! snakes[4].isRotating;
  if(key=='6')snakes[5].isRotating= ! snakes[5].isRotating;
  if(key=='7')snakes[6].isRotating= ! snakes[6].isRotating;
  if(key=='8')snakes[7].isRotating= ! snakes[7].isRotating;
  if(key=='9')snakes[8].isRotating= ! snakes[8].isRotating;
  if(key=='0')snakes[9].isRotating= ! snakes[9].isRotating;
  if(key=='q')snakesBlue[0].isRotatingBlue= ! snakesBlue[0].isRotatingBlue;
  if(key=='w')snakesBlue[1].isRotatingBlue= ! snakesBlue[1].isRotatingBlue;
  if(key=='e')snakesBlue[2].isRotatingBlue= ! snakesBlue[2].isRotatingBlue;
  if(key=='r')snakesBlue[3].isRotatingBlue= ! snakesBlue[3].isRotatingBlue;
  if(key=='t')snakesBlue[4].isRotatingBlue= ! snakesBlue[4].isRotatingBlue;
  if(key=='y')snakesBlue[5].isRotatingBlue= ! snakesBlue[5].isRotatingBlue;
  if(key=='u')snakesBlue[6].isRotatingBlue= ! snakesBlue[6].isRotatingBlue;
  if(key=='i')snakesBlue[7].isRotatingBlue= ! snakesBlue[7].isRotatingBlue;
  if(key=='o')snakesBlue[8].isRotatingBlue= ! snakesBlue[8].isRotatingBlue;
  if(key=='p')snakesBlue[9].isRotatingBlue= ! snakesBlue[9].isRotatingBlue;
  if(key=='a')snakesRed[0].isRotatingRed= ! snakesRed[0].isRotatingRed;
  if(key=='s')snakesRed[1].isRotatingRed= ! snakesRed[1].isRotatingRed;
  if(key=='d')snakesRed[2].isRotatingRed= ! snakesRed[2].isRotatingRed;
  if(key=='f')snakesRed[3].isRotatingRed= ! snakesRed[3].isRotatingRed;
  if(key=='g')snakesRed[4].isRotatingRed= ! snakesRed[4].isRotatingRed;
  if(key=='h')snakesRed[5].isRotatingRed= ! snakesRed[5].isRotatingRed;
  if(key=='j')snakesRed[6].isRotatingRed= ! snakesRed[6].isRotatingRed;
  if(key=='k')snakesRed[7].isRotatingRed= ! snakesRed[7].isRotatingRed;
  if(key=='l')snakesRed[8].isRotatingRed= ! snakesRed[8].isRotatingRed;
  if(key=='z')snakesOrange[0].isRotatingOrange= ! snakesOrange[0].isRotatingOrange;
  if(key=='x')snakesOrange[1].isRotatingOrange= ! snakesOrange[1].isRotatingOrange;
  if(key=='c')snakesOrange[2].isRotatingOrange= ! snakesOrange[2].isRotatingOrange;
  if(key=='v')snakesOrange[3].isRotatingOrange= ! snakesOrange[3].isRotatingOrange;
  if(key=='b')snakesOrange[4].isRotatingOrange= ! snakesOrange[4].isRotatingOrange;
  if(key=='n')snakesOrange[5].isRotatingOrange= ! snakesOrange[5].isRotatingOrange;
  if(key=='m')snakesOrange[6].isRotatingOrange= ! snakesOrange[6].isRotatingOrange;
  }
}
void initialBadger(){
  fill(50);
  ellipse(30,height/2,20,20);
}

void badger(){
  pushMatrix();
  translate(mouseX,mouseY);
  fill(50);
  ellipse(0,0,20,20);
  popMatrix();
}

class SnakeBlue{
  float x,y;
  color snakeColorBlue;
  boolean isRotatingBlue=false;
  float degreeBlue;
  int snakeCreatedBlue;
  float myInitialRotateBlue;
  
  SnakeBlue(float myX, float myY, float initialRotateBlue, color blue){
    x=myX; y=myY;
    myInitialRotateBlue=initialRotateBlue;
    snakeColorBlue = blue;
  }
  
void createSnakeBlue(){
  pushMatrix();
  translate(x,y);
  rotate(myInitialRotateBlue);
  rotate(degreeBlue);
  if(isRotatingBlue){degreeBlue+=.01;}
  fill(snakeColorBlue);
  noStroke();
  beginShape();
    vertex(100/1.2,-118/1.2);
    bezierVertex(66/1.2,-70/1.2,82/1.2,-24/1.2,104/1.2,52/1.2);
    bezierVertex(114/1.2,122/1.2,56/1.2,88/1.2,40/1.2,56/1.2);
    bezierVertex(24/1.2,28/1.2,-66/1.2,-8/1.2,-98/1.2,48/1.2);
    bezierVertex(-132/1.2,104/1.2,-116/1.2,100/1.2,-126/1.2,124/1.2);
    bezierVertex(-138/1.2,148/1.2,-166/1.2,156/1.2,-206/1.2,120/1.2);
    bezierVertex(-240/1.2,94/1.2,-240/1.2,-30/1.2,-244/1.2,108/1.2);
    bezierVertex(-244/1.2,140/1.2,-186/1.2,176/1.2,-160/1.2,182/1.2);
    bezierVertex(-132/1.2,186/1.2,-108/1.2,196/1.2,-82/1.2,132/1.2);
    bezierVertex(-62/1.2,76/1.2,-20/1.2,44/1.2,22/1.2,126/1.2);
    bezierVertex(72/1.2,198/1.2,162/1.2,210/1.2,172/1.2,110/1.2);
    bezierVertex(174/1.2,50/1.2,168/1.2,42/1.2,146/1.2,10/1.2);
    bezierVertex(142/1.2,6/1.2,124/1.2,-62/1.2,162/1.2,-76/1.2);
    bezierVertex(162/1.2,-76/1.2,110/1.2,-82/1.2,100/1.2,-118/1.2);
    endShape(CLOSE);
  beginShape();
    vertex(248/1.2,-118/1.2);
    bezierVertex(254/1.2,-92/1.2,254/1.2,-76/1.2,212/1.2,-74/1.2);
    bezierVertex(156/1.2,-70/1.2,132/1.2,-76/1.2,110/1.2,-100/1.2);
    bezierVertex(82/1.2,-126/1.2,88/1.2,-138/1.2,116/1.2,-176/1.2);
    bezierVertex(142/1.2,-214/1.2,200/1.2,-214/1.2,234/1.2,-164/1.2);
    bezierVertex(226/1.2,-150/1.2,240/1.2,-120/1.2,248/1.2,-118/1.2);
    endShape(CLOSE);
  stroke(0);
  popMatrix();
  }
}
void mushroom(){
  pushMatrix();
  fill(200,120,0);
  translate(1000, 384);
  //image(mushroom,20,20);
  ellipse(0,0,20,20);
  ellipse(0,100,20,20);
  ellipse(0,200,20,20);
  ellipse(0,300,20,20);
  ellipse(0,-100,20,20);
  ellipse(0,-200,20,20);
  ellipse(0,-300,20,20);
  popMatrix();
}

void mushroom2(){
  pushMatrix();
  fill(200,120,0);
  translate(24, 384);
  ellipse(0,0,20,20);
  ellipse(0,100,20,20);
  ellipse(0,200,20,20);
  ellipse(0,300,20,20);
  ellipse(0,-100,20,20);
  ellipse(0,-200,20,20);
  ellipse(0,-300,20,20);
  popMatrix();
}
class SnakeOrange{
  float x,y;
  color snakeColorOrange;
  boolean isRotatingOrange=false;
  float degreeOrange;
  int snakeCreatedOrange;
  float myInitialRotateOrange;
  
  SnakeOrange(float myX, float myY, float initialRotateOrange, color orange){
    x=myX; y=myY;
    myInitialRotateOrange=initialRotateOrange;
    snakeColorOrange = orange;
  }
  
void createSnakeOrange(){
  pushMatrix();
  translate(x,y);
  rotate(myInitialRotateOrange);
  rotate(degreeOrange);
  if(isRotatingOrange){degreeOrange+=.01;}
  fill(snakeColorOrange);
  noStroke();
  beginShape();
    vertex(100/1.2,-118/1.2);
    bezierVertex(66/1.2,-70/1.2,82/1.2,-24/1.2,104/1.2,52/1.2);
    bezierVertex(114/1.2,122/1.2,56/1.2,88/1.2,40/1.2,56/1.2);
    bezierVertex(24/1.2,28/1.2,-66/1.2,-8/1.2,-98/1.2,48/1.2);
    bezierVertex(-132/1.2,104/1.2,-116/1.2,100/1.2,-126/1.2,124/1.2);
    bezierVertex(-138/1.2,148/1.2,-166/1.2,156/1.2,-206/1.2,120/1.2);
    bezierVertex(-240/1.2,94/1.2,-240/1.2,-30/1.2,-244/1.2,108/1.2);
    bezierVertex(-244/1.2,140/1.2,-186/1.2,176/1.2,-160/1.2,182/1.2);
    bezierVertex(-132/1.2,186/1.2,-108/1.2,196/1.2,-82/1.2,132/1.2);
    bezierVertex(-62/1.2,76/1.2,-20/1.2,44/1.2,22/1.2,126/1.2);
    bezierVertex(72/1.2,198/1.2,162/1.2,210/1.2,172/1.2,110/1.2);
    bezierVertex(174/1.2,50/1.2,168/1.2,42/1.2,146/1.2,10/1.2);
    bezierVertex(142/1.2,6/1.2,124/1.2,-62/1.2,162/1.2,-76/1.2);
    bezierVertex(162/1.2,-76/1.2,110/1.2,-82/1.2,100/1.2,-118/1.2);
    endShape(CLOSE);
  beginShape();
    vertex(248/1.2,-118/1.2);
    bezierVertex(254/1.2,-92/1.2,254/1.2,-76/1.2,212/1.2,-74/1.2);
    bezierVertex(156/1.2,-70/1.2,132/1.2,-76/1.2,110/1.2,-100/1.2);
    bezierVertex(82/1.2,-126/1.2,88/1.2,-138/1.2,116/1.2,-176/1.2);
    bezierVertex(142/1.2,-214/1.2,200/1.2,-214/1.2,234/1.2,-164/1.2);
    bezierVertex(226/1.2,-150/1.2,240/1.2,-120/1.2,248/1.2,-118/1.2);
    endShape(CLOSE);
  stroke(0);
  popMatrix();
  }
}
class SnakeRed{
  float x,y;
  color snakeColorRed;
  boolean isRotatingRed=false;
  float degreeRed;
  int snakeCreatedRed;
  float myInitialRotateRed;
  
  SnakeRed(float myX, float myY, float initialRotateRed, color red){
    x=myX; y=myY;
    myInitialRotateRed=initialRotateRed;
    snakeColorRed = red;
  }
  
void createSnakeRed(){
  pushMatrix();
  translate(x,y);
  rotate(myInitialRotateRed);
  rotate(degreeRed);
  if(isRotatingRed){degreeRed+=.01;}
  fill(snakeColorRed);
  noStroke();
  beginShape();
    vertex(100/1.2,-118/1.2);
    bezierVertex(66/1.2,-70/1.2,82/1.2,-24/1.2,104/1.2,52/1.2);
    bezierVertex(114/1.2,122/1.2,56/1.2,88/1.2,40/1.2,56/1.2);
    bezierVertex(24/1.2,28/1.2,-66/1.2,-8/1.2,-98/1.2,48/1.2);
    bezierVertex(-132/1.2,104/1.2,-116/1.2,100/1.2,-126/1.2,124/1.2);
    bezierVertex(-138/1.2,148/1.2,-166/1.2,156/1.2,-206/1.2,120/1.2);
    bezierVertex(-240/1.2,94/1.2,-240/1.2,-30/1.2,-244/1.2,108/1.2);
    bezierVertex(-244/1.2,140/1.2,-186/1.2,176/1.2,-160/1.2,182/1.2);
    bezierVertex(-132/1.2,186/1.2,-108/1.2,196/1.2,-82/1.2,132/1.2);
    bezierVertex(-62/1.2,76/1.2,-20/1.2,44/1.2,22/1.2,126/1.2);
    bezierVertex(72/1.2,198/1.2,162/1.2,210/1.2,172/1.2,110/1.2);
    bezierVertex(174/1.2,50/1.2,168/1.2,42/1.2,146/1.2,10/1.2);
    bezierVertex(142/1.2,6/1.2,124/1.2,-62/1.2,162/1.2,-76/1.2);
    bezierVertex(162/1.2,-76/1.2,110/1.2,-82/1.2,100/1.2,-118/1.2);
    endShape(CLOSE);
  beginShape();
    vertex(248/1.2,-118/1.2);
    bezierVertex(254/1.2,-92/1.2,254/1.2,-76/1.2,212/1.2,-74/1.2);
    bezierVertex(156/1.2,-70/1.2,132/1.2,-76/1.2,110/1.2,-100/1.2);
    bezierVertex(82/1.2,-126/1.2,88/1.2,-138/1.2,116/1.2,-176/1.2);
    bezierVertex(142/1.2,-214/1.2,200/1.2,-214/1.2,234/1.2,-164/1.2);
    bezierVertex(226/1.2,-150/1.2,240/1.2,-120/1.2,248/1.2,-118/1.2);
    endShape(CLOSE);
  stroke(0);
  popMatrix();
  }
}
class Snake{
  float x,y;
  color snakeColor;
  boolean isRotating=false;
  float degree;
  int snakeCreated;
  float myInitialRotate;
  
  Snake(float myX, float myY, float initialRotate, color green){
    x=myX; y=myY;
    myInitialRotate=initialRotate;
    snakeColor=green;
  }
  
void createSnake(){
  pushMatrix();
  translate(x,y);
  rotate(myInitialRotate);
  rotate(degree);
  if(isRotating){degree+=.01;}
  fill(snakeColor);
  noStroke();
  beginShape();
    vertex(100/1.2,-118/1.2);
    bezierVertex(66/1.2,-70/1.2,82/1.2,-24/1.2,104/1.2,52/1.2);
    bezierVertex(114/1.2,122/1.2,56/1.2,88/1.2,40/1.2,56/1.2);
    bezierVertex(24/1.2,28/1.2,-66/1.2,-8/1.2,-98/1.2,48/1.2);
    bezierVertex(-132/1.2,104/1.2,-116/1.2,100/1.2,-126/1.2,124/1.2);
    bezierVertex(-138/1.2,148/1.2,-166/1.2,156/1.2,-206/1.2,120/1.2);
    bezierVertex(-240/1.2,94/1.2,-240/1.2,-30/1.2,-244/1.2,108/1.2);
    bezierVertex(-244/1.2,140/1.2,-186/1.2,176/1.2,-160/1.2,182/1.2);
    bezierVertex(-132/1.2,186/1.2,-108/1.2,196/1.2,-82/1.2,132/1.2);
    bezierVertex(-62/1.2,76/1.2,-20/1.2,44/1.2,22/1.2,126/1.2);
    bezierVertex(72/1.2,198/1.2,162/1.2,210/1.2,172/1.2,110/1.2);
    bezierVertex(174/1.2,50/1.2,168/1.2,42/1.2,146/1.2,10/1.2);
    bezierVertex(142/1.2,6/1.2,124/1.2,-62/1.2,162/1.2,-76/1.2);
    bezierVertex(162/1.2,-76/1.2,110/1.2,-82/1.2,100/1.2,-118/1.2);
    endShape(CLOSE);
  beginShape();
    vertex(248/1.2,-118/1.2);
    bezierVertex(254/1.2,-92/1.2,254/1.2,-76/1.2,212/1.2,-74/1.2);
    bezierVertex(156/1.2,-70/1.2,132/1.2,-76/1.2,110/1.2,-100/1.2);
    bezierVertex(82/1.2,-126/1.2,88/1.2,-138/1.2,116/1.2,-176/1.2);
    bezierVertex(142/1.2,-214/1.2,200/1.2,-214/1.2,234/1.2,-164/1.2);
    bezierVertex(226/1.2,-150/1.2,240/1.2,-120/1.2,248/1.2,-118/1.2);
    endShape(CLOSE);
  stroke(0);
  popMatrix();
  }
}


