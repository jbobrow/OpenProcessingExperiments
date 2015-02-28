
float diam = 100;
float a = 0;


void setup () {
  size(500, 500);
  frameRate(100);
}

void draw() {
  
  float x = noise(a, 10) * width;
  float y = noise(a, 50) * height;
  float d = dist(x , y, mouseX , mouseY );
  
   if(d > diam){
    strokeWeight(1);
  } else{
    strokeWeight(random(10));
  }
  

  stroke(66, 200, 255); //blue
  fill(mouseX,mouseY,mouseX/3); //yellow
  ellipse(x, y, diam /1, diam/1);
  rect(x - 25, y -25, diam /5, diam/15);
  rect(x + 5, y -25, diam /5, diam/15);
  ellipse(x - 12, y -5, diam /5, diam/5);
  ellipse(x - 12, y -5, diam /20, diam/20);
  ellipse(x + 12, y -5, diam /5, diam/5);
  ellipse(x + 12, y -5, diam /20, diam/20);
  ellipse(x + 3, y +20, diam /3, diam/10);

  
  ellipse(mouseX, mouseY, 100, 100);
  ellipse(mouseX-20,mouseY-15,20,20);
  ellipse(mouseX+20,mouseY-15,20,20);
  ellipse(mouseX-20,mouseY-15,5,5);
  ellipse(mouseX+20,mouseY-15,5,5);
  ellipse(mouseX +10,mouseY +25,mouseX/10,mouseY/10);

  
  if (mouseY < 250 && mouseX < 250) {
    background(mouseY,255,211);
    strokeWeight(4);
    fill( 250,236,37);
    ellipse(375,125,40,40);
    ellipse(127,123,40,40);
    ellipse(375,375,40,40);
    ellipse(125,375,40,40);
    ellipse(250,250,100,100);
  }
  if (mouseY < 250 && mouseX > 250) {
    background(246,mouseY,54);
    strokeWeight(3);
    fill(250,236,37);
    rect(355,105,40,40);
    rect(108,105,40,40);
    rect(355,355,40,40);
    rect(105,355,40,40);
    rect(200,200,100,100);
  }
  if (mouseY > 250 && mouseX < 250) {
    background(mouseX,0,0);
    fill(134,236,37);
    rect(355,105,40,40);
    rect(108,105,40,40);
    rect(355,355,40,40);
    rect(105,355,40,40);
    rect(200,200,100,100);
    strokeWeight(2);
    ellipse(375,125,10,10);
    ellipse(127,123,10,10);
    ellipse(376,375,10,10);
    ellipse(125,375,10,10);
    ellipse(250,250,50,50);
  }
  if (mouseY > 250 && mouseX < 250) {
    background(150,200,mouseX+237);
    ellipse(375,125,40,40);
    ellipse(127,123,40,40);
    ellipse(376,375,40,40);
    ellipse(125,375,40,40);
    ellipse(250,250,100,100);
    strokeWeight(1);
    rect(370,120,10,10);
    rect(122,118,10,10);
    rect(371,370,10,10);
    rect(120,370,10,10);
    rect(225,223,50,50);
  }
  if (mousePressed) {
    if (mouseButton == RIGHT) 
    strokeWeight(5);
    line(250, 0, 250, 500);
    line(250, 250,500,0);
    line(250,500,0,250);
    line(0,500,250,250);
    line(0,250,500,250);
    line(500,250,250,0);
    line(0,250,250,0);
    line(5,0,500,500);
    line(250,500,500,250);

    
  stroke(204, 102, 200);
  fill(10,50,10,60);
  rect(mouseX-20,mouseY-40,10,5);
  rect(mouseX+10,mouseY-40,10,5);
  ellipse(mouseX, mouseY, 100, 100);
  ellipse(mouseX-20,mouseY-15,20,20);
  ellipse(mouseX+20,mouseY-15,20,20);
  ellipse(mouseX-20,mouseY-15,5,5);
  ellipse(mouseX+20,mouseY-15,5,5);
  ellipse(mouseX +10,mouseY +25,mouseX/10,mouseY/10);
  rect(0, 0, 2000, 1000);
  
    a = a + 0.01;

    }
  
  }




