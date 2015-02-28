
//Jenny McCarthy 3/10/14 Project 2: Distrubing Nature

Obstacles obstacles;
Bubbles[] bubbles = new Bubbles [20]; //declare array of bubbles

color bC = color(19,31,31); //background color

void setup(){
  size(600,600);
  background(bC);
  smooth();
  frameRate(20);
  for(int i=0;i<bubbles.length;i++){
    bubbles[i] = new Bubbles();
  } //initializing each bubble w/ for loop 
  obstacles = new Obstacles(50);
}

void draw(){
  rectMode(CENTER);
  fill(bC,10);
  rect(300,300,width,height); //fade effect 
  
  obstacles.position(mouseX,mouseY); //obstacles follow mouse position
  obstacles.display();
  
  for(int i=0;i<bubbles.length;i++){ //run each object w/for loop
    bubbles[i].display();
    
    if (keyPressed){
      if (key == CODED) {
        if (keyCode == LEFT){
          bubbles[i].left();
        } //bubbles go left
        else if (keyCode == RIGHT){
          bubbles[i].right();
        } //bubbles go right
      }
      if (key=='r' || key=='R'){
        setup();
       } // press r to reset 
    }
    
    if (mousePressed){
        bubbles[i].fall();
    } else {
      bubbles[i].rise();
    } //if the mouse is pressed, the objects start to move in other direction
    
    if(obstacles.intersect(bubbles[i])){
       bubbles[i].inter();
       //only if mouse obstacle interects bubbles, bubbles will perform what's in the inter() function
       
       if(bubbles[i].collide(bubbles[i])){
           bubbles[i].coll(); 
       } else {
           bubbles[i].no_coll();
       } //if they collide, bubbles change color, if not, bubbles stay the same
    }
  }
}


class Bubbles {
  float xpos; //x position
  float ypos; //y position
  float yspeed; //speed bubbles rise to top
  float bSize; //size of bubbles
  color c = color(30,144,255,70); //dodger blue
  
  Bubbles(){
    xpos = random(100,500);
    ypos = random(650,750); //bubbles start rising before the bottom of the display window
    yspeed = random(0.5,3);
    bSize = random(15,70);
  }
  
  void drawBubbles(float x, float y){
    noStroke();
    ellipseMode(CENTER);
    fill(0,255,255,100); //cyan
    ellipse(x,y,bSize,bSize);
    fill(0,170); //black
    stroke(255,200);
    ellipse(x,y,bSize-5,bSize-5);
    fill(c); //fill color c
    noStroke();
    ellipse(x,y-5,bSize-15,bSize-25);
    fill(255,50); //white 
    ellipse(x-5,y-5,bSize/6,bSize/8);
  }
  
  void display(){
    drawBubbles(xpos,ypos); //draw bubbles at x,y
  }
  
  void rise(){
    ypos = ypos - yspeed; //bubbles float/rise upwards
    if(ypos<0){
      ypos = random(650,750); //if bubbles reach top, ypos is reset to beginning position
      c = color(30,144,255,70); //c resets to dodger blue
    }
  }
  
  void fall(){
    ypos = ypos + yspeed; //bubbles sink/fall down
    if(ypos>600){
      ypos = random(-100,-50); //if bubbles reach the bottom, ypos is reset to top
      c = color(30,144,255,70); //c resets to dodger blue
    }
  }
  
  void left(){
    xpos = xpos - yspeed; //bubbles go left
    if(xpos<0){
      xpos = random(650,700); //if bubbles reach the left, xpos is reset to the right
      c = color(30,144,255,70); //c resets to dodger blue
    }
  }
  
  void right(){
    xpos = xpos + yspeed; //bubbles go right
    if(xpos>600){
      xpos = random(-100,-50); //if bubbles reach the right, xpos is reset to the left
      c = color(30,144,255,70); //c resets to dodger blue
    }
  }
  
  void inter(){
    drawBubbles(xpos+(random(-50,50)),ypos+(random(-50,50))); //if intersect, bubbles multiply
  }
  
  void coll(){
    c = color(255,0,255,50); //magenta
  }
  
  void no_coll(){
    c = color(30,144,255,70); //dodger blue
  } 
  
  boolean collide(Bubbles b0){
    float dis = dist(xpos,ypos,b0.xpos,b0.ypos);
    if (dis<bSize+b0.bSize){ //if d is less than bubble size1 + bubble size2, then boolean returns true
      return true;
    } else { //if d is not less than bubble size1 + bubble size2, then boolean returns false
      return false;
    }  
  }
}
class Obstacles {
  float size; //size of obstacle
  color col; //color of obstacle
  float x,y; //x,y position 
  
  Obstacles(float obSize) {
    size = obSize;
    col = color (220,20,60,10); //crimson
    x = 200;
    y = 200;
  }
  
  void position(float xpos, float ypos){
    x = xpos;
    y = ypos;
  }
  
  void display(){
    for(int i = 1;i<=10;i++){
      noStroke();
      fill(col);
      rect(x,y,size/i,size/i);
    } //repeated layers to form the shape
  }
  
  boolean intersect(Bubbles b){
    float d = dist(x,y,b.xpos,b.ypos);
    if (d<b.bSize+size){ //if d is less than bubble size + size of obstacle, then boolean returns true
      return true;
    } else { //if d is not less than bubble size + size of obstacle, then boolean returns false
      return false;
    }  
  }
}


