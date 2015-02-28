
// hw 4
// e-mail: psalim@andrew.cmu.edu
// name: Peter Teguh Salim
// Copyright: Â© Peter Teguh Salim August 2012  Pittsburgh, PA 15213  All Rights Reserved

/*
Controls:
1 = activate one beacon
2 = activate two beacons
3 = activate three beacons
spacebar = randomize beacon position
z = stop
x = start
*/

PVector v1, v2, v3, v4, v5;
float x, y, x2, y2, x3, y3;
float T, F;
float xAdd, yAdd, x2Add, y2Add, x3Add, y3Add;

void setup(){
  size(400,400);
  smooth();
  
  x = random(width);
  y = random(height);
  x2 = random(width);
  y2 = random(height);
  x3 = random(width);
  y3 = random(height);
  
  xAdd = random(-2,2);
  yAdd = random(-2,2);
  x2Add = random(-2,2);
  y2Add = random(-2,2);
  x3Add = random(-2,2);
  y3Add = random(-2,2);
    
  T = 0.1;
  F = 0.5;
 
  frameRate(35);
}

void draw(){
  background(255);

  // circle window
  stroke(255);
  fill(35);
  ellipseMode(CENTER);
  ellipse(width/2, height/2, 300,300);
  
  // one beacon
  if(keyPressed){
    if(key == '1'){
      v1 = new PVector(x, y);
      beacon(v1.x, v1.y, 1);
      
      x = x + xAdd;
      y = y - yAdd;     
    }
  }
  
  // two beacons  
  if(keyPressed){
    if(key == '2'){
      v2 = new PVector(x2, y2);
      beacon(v2.x, v2.y, 2);
      v1 = new PVector(x, y);
      beacon(v1.x, v1.y, 1);
      
      x += xAdd;
      y += yAdd;
      x2 += x2Add;
      y2 += y2Add;
      
      stroke(210,7);
      strokeWeight(2);
      line(v2.x, v2.y, v1.x, v1.y);
      
      // distance tracker
      fill(35);
      textSize(7);
      text("1 & 2", 305, 350);
      textSize(12);
      text(dist(v2.x, v2.y, v1.x, v1.y), 325, 350);
    }
  }
  
  // three beacons
  if(keyPressed){
    if(key == '3'){
      v3 = new PVector(x3, y3);
      beacon(v3.x, v3.y, 3);
      v2 = new PVector(x2, y2);
      beacon(v2.x, v2.y, 2);
      v1 = new PVector(x, y);
      beacon(v1.x, v1.y, 1);
      
      x += xAdd;
      y += yAdd;
      x2 += x2Add;
      y2 += y2Add;
      x3 += x3Add;
      y3 += y3Add;
      
      stroke(210,7);
      strokeWeight(2);
      line(v2.x, v2.y, v1.x, v1.y);
      line(v2.x, v2.y, v3.x, v3.y);
      line(v1.x, v1.y, v3.x, v3.y);
      
      // distance tracker
      fill(35);
      textSize(7);
      text("1 & 2", 305, 350);
      textSize(12);
      text(dist(v2.x, v2.y, v1.x, v1.y), 325, 350);
      textSize(7);
      text("2 & 3", 305, 365);
      textSize(12);
      text(dist(v2.x, v2.y, v3.x, v3.y), 325, 365);
      textSize(7);
      text("1 & 3", 305, 380);
      textSize(12);
      text(dist(v1.x, v1.y, v3.x, v3.y), 325, 380);
    }
  }
  
  if(x >= width || x <= 0){
    xAdd = xAdd*-1;
  }else if(y > height || y <= 0){
    yAdd = yAdd*-1;
  }else if(x2 >= width || x2 <= 0){
    x2Add = x2Add*-1;
  }else if(y2 > height || y2 <= 0){
    y2Add = y2Add*-1;
  }else if(x3 >= width || x3 <= 0){
    x3Add = x3Add*-1;
  }else if(y3 > height || y3 <= 0){
    y3Add = y3Add*-1;
  }
  
  if(keyPressed){
    // rotating radar
    strokeWeight(3);
    stroke(255,35);
    line(width/2, height/2, cos(T)*720, sin(T)*720);
  }
}

void beacon(float x_, float y_, int n){ 
  stroke(255,35);
  strokeWeight(7);
  point(x_,y_);
  
  strokeWeight(2);
  stroke(255,14);
  fill(255,35);
  ellipseMode(CENTER);
  ellipse(x_, y_, sin(T)*42,sin(T)*42); // using the sine function to create an oscillating ellipse diameter
  T = T + 0.02; // the rate of oscillation
  
  // beacon number
  fill(255,70);
  textSize(7);
  text(n, x_, (y_ - 7));
}

// restart positions
void keyPressed(){
  if (key == ' '){
    x = random(width);
    y = random(height);
    x2 = random(width);
    y2 = random(height);
    x3 = random(width);
    y3 = random(height);
    xAdd = random(-2,2);
    yAdd = random(-2,2);
    x2Add = random(-2,2);
    y2Add = random(-2,2);
    x3Add = random(-2,2);
    y3Add = random(-2,2);
  }
  
  if (key == 'z'){
    noLoop();
  }else if (key == 'x'){
    loop();
  }
}


