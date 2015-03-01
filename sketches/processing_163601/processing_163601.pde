
int diameter = 100;
int ydistance = diameter/2;
int xdistance = diameter/2;

int speed = 5; 
int speed1 = 5;
int speed2 = 5;
int ydirection = 1;
int xdirection = 1;

int counter1 = 0;
int counter2 = 0;
int rect1 = width/2;
int rect2 = width/2;
 
void setup() {
  size(1000, 1200);
  background(50);
  noStroke();
}
 
void draw() {
  background(50);
  fill(150, 150, 220);
  if(ydistance > height/2){
    speed = speed1;
  }
  if (ydistance < height/2){
    speed = speed2;
  }
  ellipse(xdistance, ydistance, diameter, diameter);
  
  //Move me
  ydistance += speed*ydirection;
  xdistance += speed*xdirection;
 
 
 //paddle 1
  rectMode(CENTER);
  rect(rect1, height-120, 200, 20);
 
 //paddle 2
  rect(rect2, 120, 200, 20);
  
  //moving paddles
  if(keyPressed){
    if(key == 'a' || key == 'A'){
      rect1 = rect1 - 10;
    }
    if(key == 's' || key == 'S'){
      rect1 = rect1 + 10;
    }
    if(key == 'k' || key == 'K'){
      rect2 = rect2 - 10;
    }
    if(key == 'l' || key == 'L'){
      rect2 = rect2 + 10;
    }
  }
  
  if(rect1 > (width - 100)){
    rect1 = width - 100;
  }
  if(rect1 < 100){
    rect1 = 100;
  }
  if(rect2 > (width - 100)){
    rect2 = width - 100;
  }
  if(rect2 < 100){
    rect2 = 100;
  }
 
  //Did I hit the bottom?
  if (ydistance > height+diameter/2) {
    ydirection = -ydirection;
    ydistance = height/2;
    xdistance = width/2;
    counter1 = counter1 + 1;
    speed1 = speed1 + 1;
    println("I went off the bottom and came back on the top");
  }
 
  //Did I hit the top?
  if (ydistance < 0+diameter/2 && ydirection == -1) {
    ydirection = -ydirection;
    ydistance = height/2;
    xdistance = width/2;
    counter2 = counter2 + 1;
    speed2 = speed2 + 1;       
    println("I hit the top");   
  }       
 
  //Did I hit the right side?       
  if (xdistance > width-diameter/2) {
    xdirection = -xdirection;
    println("I hit the right side");
  }
 
  //Did I hit the left side?
  if (xdistance < 0+diameter/2) {
    xdirection = -xdirection;
    println("I hit the left side");
  } 
  
  //Did I hit paddle 1?
  if (xdistance > (rect1 - 100) && xdistance < (rect1 + 100) && ydistance > (height - 130 - (diameter/2)) && ydistance < (height - 110 - (diameter/2)) && ydirection == 1) {
    ydirection = -ydirection;
    println("I hit paddle 1");
  }
    
  //Did I hit paddle 2?
  if (xdistance > (rect2 - 100) && xdistance < (rect2 + 100) && ydistance < (130 + (diameter/2)) && ydistance > (110 + (diameter/2)) && ydirection == -1) {
    ydirection = -ydirection;
    println("I hit paddle 2");
  }
  
  //countdown 1
  if(counter1 == 0){
    fill(50);
    rect(width/2, height-35, 40, 40);
    fill(150, 150, 220);
    textSize(40);
    text("5", (width/2) - 12, height-20);
  }
  
  if(counter1 == 1){
    fill(50);
    rect(width/2, height-35, 40, 40);
    fill(150, 150, 220);
    textSize(40);
    text("4", (width/2) - 12, height-20);
  }
  
  if(counter1 == 2){
    fill(50);
    rect(width/2, height-35, 40, 40);
    fill(150, 150, 220);
    textSize(40);
    text("3", (width/2) - 12, height-20);
  }
  
  if(counter1 == 3){
    fill(50);
    rect(width/2, height-35, 40, 40);
    fill(150, 150, 220);
    textSize(40);
    text("2", (width/2) - 12, height-20);
  }
  
  if(counter1 == 4){
    fill(50);
    rect(width/2, height-35, 40, 40);
    fill(150, 150, 220);
    textSize(40);
    text("1", (width/2) - 12, height-20);
  }
    
  //countdown 2
  if(counter2 == 0){
    fill(50);
    rect(width/2, 35, 40, 40);
    fill(150, 150, 220);
    textSize(40);
    text("5", (width/2) - 12, 50);
  }
  
  if(counter2 == 1){
    fill(50);
    rect(width/2, 35, 40, 40);
    fill(150, 150, 220);
    textSize(40);
    text("4", (width/2) - 12, 50);
  }
  
  if(counter2 == 2){
    fill(50);
    rect(width/2, 35, 40, 40);
    fill(150, 150, 220);
    textSize(40);
    text("3", (width/2) - 12, 50);
  }
  
  if(counter2 == 3){
    fill(50);
    rect(width/2, 35, 40, 40);
    fill(150, 150, 220);
    textSize(40);
    text("2", (width/2) - 12, 50);
  }
  
  if(counter2 == 4){
    fill(50);
    rect(width/2, 35, 40, 40);
    fill(150, 150, 220);
    textSize(40);
    text("1", (width/2) - 12, 50);
  }
  
  if(counter2 == 5){
    background(255);
    textAlign(CENTER);
    textSize(100);
    text("Bottom Wins!", width/2, height/2);
    stop();
  }
  
  if(counter1 == 5){
    background(255);
    textAlign(CENTER);
    textSize(100);
    text("Top Wins!", width/2, height/2);
    stop();
  }
}


