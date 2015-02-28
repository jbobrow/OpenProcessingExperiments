
class Momo {
  
  float bodyDiam;
  float bowR;
  float bowG;
  float bowB;
  int bodyColor;
  float x ;  //= width/2 ; // x center of screen
  float y ;  // = height/2 - 30; // y center of screen
  float speedBob = .2;
  float speedLeft = 2;
  
  boolean hit = false;
  
   Momo(float tempX, float tempY, float tempSpeedBob, float tempSpeedLeft,int tempBodyColor){
   x = tempX;
   y = tempY;
   speedBob = tempSpeedBob;
   speedLeft = tempSpeedLeft;
   bodyColor = tempBodyColor;
 }
  
  void bob() {
  y = y + speedBob;

  if ((y < 240) || (y > 245)) {
  speedBob = speedBob * -1;
  }
}
  
  void leftRight() {
  x =  x + speedLeft;
  
  if ((x > width/2-50) || (x < 150)){
  speedLeft = speedLeft * -1;
  }
}  
  
  void display () {
  
  //local variables  
    float bodyDiam = 80; 
    int bowDiam = 9;
    int eyeDiam = 8;

      
  //body
    smooth();
    fill(bodyColor);
    smooth();
    noStroke();
    ellipse(x, y - 31,bodyDiam,bodyDiam);
  
  //bow left side
    fill(x,30,y);
    strokeJoin(ROUND);
    beginShape(TRIANGLES);
    vertex(x, y - 60);
    vertex(x - 18,y - 68);
    vertex(x - 18,y - 52);
    endShape();
  
  //bow right side
    fill(x,30,y);
    strokeJoin(ROUND);
    beginShape(TRIANGLES);
    vertex(x, y - 60);
    vertex(x + 18,y - 68);
    vertex(x + 18,y - 52);
    endShape();
  
  //bow circle
    smooth();
    stroke(bodyColor);
    strokeWeight(2);
    fill(x,30,y);
    ellipse(x,y - 60,bowDiam,bowDiam);
  
  //right
    fill(0);
    stroke(0);
    strokeWeight(1);
    beginShape(LINES);
    vertex(x + 2,y - 36);
    vertex(x + 6,y - 29);
    vertex(x + 6,y - 37);
    vertex(x + 6,y - 29);
    vertex(x + 10,y - 36);
    vertex(x + 6,y - 29);
    endShape();
  
  //left eyelashes
    fill(0);
    stroke(0);
    strokeWeight(1);
    beginShape(LINES);
    vertex(x - 10,y - 36);
    vertex(x - 6,y - 29);
    vertex(x - 6,y - 37);
    vertex(x - 6,y - 29);
    vertex(x - 2,y - 36);
    vertex(x - 6,y - 29);
    endShape();
  
  //left eye
    fill(0);
    stroke(bodyColor);
    strokeWeight(2);
    ellipse(x - 6,y - 30 + 2,eyeDiam,eyeDiam); 
  
  //blink feature, if critters collide
    if (hit) {
    
  //eyelashes
  
  //eyes closed
    fill(0);
    stroke(0);
    strokeWeight(1);
    beginShape(LINES);
    vertex(x - 10,y - 23);
    vertex(x - 6,y - 29);
    vertex(x - 6,y - 22);
    vertex(x - 6,y - 29);
    vertex(x - 2,y - 23);
    vertex(x - 6,y - 29);
    endShape();
    
  //left eye closed
    fill(0);
    noStroke();
    ellipse(x - 6,y - 30 + 2,6,6); // left
    
    fill(bodyColor);
    noStroke();
    rect(x - 10,y - 43 + 2,9,13); // left
    
  
  }
  
  //right eyes (always open)
    fill(0);
    stroke(bodyColor);
    strokeWeight(2);
    ellipse(x + 6,y - 30 + 2,eyeDiam,eyeDiam); 
  
  //lips
    fill(255,51,41);
    noStroke();
    beginShape();
    vertex(x, y - 11);
    vertex(x + 3, y - 15);
    vertex(x + 7, y - 11);
    vertex(x, y -6);
    vertex(x - 7, y - 11);
    vertex(x - 3, y - 15);
    endShape(CLOSE);

   /*//blink feature
if (!mousePressed) {
  //eyelashes

//left eyelashes
  fill(0);
  stroke(0);
  strokeWeight(1);
  beginShape(LINES);
  vertex(x - 10,y - 36);
  vertex(x - 6,y - 29);
  vertex(x - 6,y - 37);
  vertex(x - 6,y - 29);
  vertex(x - 2,y - 36);
  vertex(x - 6,y - 29);
  endShape();

//left eye
  fill(0);
  stroke(255,178,202);
  strokeWeight(2);
  ellipse(x - 6,y - 30 + 2,eyeDiam,eyeDiam); 

} else { //eyes closed
 
  fill(0);
  stroke(0);
  strokeWeight(1);
  beginShape(LINES);
  vertex(x - 10,y - 23);
  vertex(x - 6,y - 29);
  vertex(x - 6,y - 22);
  vertex(x - 6,y - 29);
  vertex(x - 2,y - 23);
  vertex(x - 6,y - 29);
  endShape();
  
  //left eye closed
  fill(0);
  noStroke();
  ellipse(x - 6,y - 30 + 2,6,6); // left
  
  fill(255,178,202);
  noStroke();
  rect(x - 10,y - 40 + 2,9,10); // left

} */
 
  }
 
  void displayFeet () {
  float y = height/2 +5;
    
  //feet
    smooth();
    noStroke();
    fill(bodyColor);
    arc(x - 11, y + 20, 15, 15, -PI, 0);  // left foot
    smooth();
    arc(x + 11, y + 20, 15, 15, -PI, 0);  // right foot
  
  }
  
  void hitTest (Momo momo) {
    
    // hit test
    if (dist(x-50,y,momo.x,momo.y) <= 5) {
      momo1.hit = true;
      hit = true;
    } else {
      momo1.hit = false;
      hit = false;
    }
  }
   
   

/*
    //100x100 frame (hidden now-black)
    fill(20);
    rectMode(CENTER);
    rect(width/2,height/2,100,100);
    
    //momo at center of screen 
    x = width/2;
    y = height/2 + 25;
    
    */
    
 
}




