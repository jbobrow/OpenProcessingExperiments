
//Jenny McCarthy HW 9: Dumb Agents, using arrays of objects (3/27/14)

Stars[] stars = new Stars [6]; //declare array of bubbles
Obstacle[] ob = new Obstacle [3]; //declare array of obstacles

void setup(){
  size(800,500);
  smooth();
  frameRate(20);
  for(int i=0;i<stars.length;i++){ //initializing each star w/ for loop
    stars[i] = new Stars();
  }
  for(int j=0;j<ob.length;j++){ //initializing each obstacle w/ for loop
    ob[j] = new Obstacle();
  }
}

void draw(){
  background(0);
  for(int i=0;i<stars.length;i++){ //run and move each star w/ for loop
    stars[i].display();
    stars[i].move();
    for(int j=0;j<stars.length;j++){  //check each star w/ for loop
      if(stars[i].collide(stars[j])){ //if stars collide w/ other stars, run coll function
        stars[i].coll();
      } 
    }
    for(int k=0;k<ob.length;k++){  //run each obstacle w/ for loop
      ob[k].display();
      if(ob[k].intersect(stars[i])){ //if obstacles and stars intersect, run inter function 
        stars[i].inter();
      }
    }
  }
  if (keyPressed){
    if (key=='r' || key=='R'){
      setup();
    } // press r to reset
  }
}
    
class Obstacle {
  float x,y; //x,y position
  color col; //color of obstacle
  float oSize; //size of obstacle
  
  Obstacle (){
    oSize = random(75,150);
    col = color(70,130,180); //steel blue - from the RGB Color Codes Chart
    x = random(width); //random x position
    y = random(height); //random y position
  }
  
  void display(){
    noStroke();
    fill(col,50); //fills color col with 50 opacity
    ellipse(x,y,oSize,oSize);
    ellipse(x,y,oSize/2,oSize/2);
    ellipse(x,y,oSize/4,oSize/4);
  }
  
  boolean intersect(Stars s){
    float d = dist(x,y,s.xpos,s.ypos);
    if (d < oSize){ //if d is less than the size of obstacle, then boolean returns true
      return true;
    } else { //if d is not less than the size of obstacle, then boolean returns false
      return false;
    }  
  }
}
class Stars {
  float xpos; //x position
  float ypos; //y postion 
  float speed; //speed of stars
  float size; //size of stars
  int xdirection = 1; //left-right
  int ydirection = 1; //top-bottom
  color c = color(255,215,0); //gold - from the RGB Color Codes Chart
  
  Stars(){
    xpos = random(width); //stars start at a random x postion
    ypos = random(height); //stars start at a random y postion
    speed = random(1,5); //random speed
    size = random(.5,2); //random size 
  }
  
  void drawStars(float x,float y){
    noStroke();
    fill(c,100); //fills color c, opacity 100
    
    beginShape(); //outer star
    vertex(x,y-22*size); //1st point (top, going clockwise to next point)
    vertex(x+5*size,y-5*size);
    vertex(x+20*size,y-5*size); //2nd point
    vertex(x+10*size,y+5*size);
    vertex(x+15*size,y+20*size); //3rd point
    vertex(x,y+10*size);
    vertex(x-15*size,y+20*size); //4th point
    vertex(x-10*size,y+5*size);
    vertex(x-20*size,y-5*size); //5th point
    vertex(x-5*size,y-5*size);
    endShape(CLOSE);
    
    beginShape(); //inner star
    vertex(x,y-11*size); //1st point (top, going clockwise to next point)
    vertex(x+2.5*size,y-2.5*size);
    vertex(x+10*size,y-2.5*size); //2nd point
    vertex(x+5*size,y+2.5*size);
    vertex(x+7.5*size,y+10*size); //3rd point
    vertex(x,y+5*size);
    vertex(x-7.5*size,y+10*size); //4th point
    vertex(x-5*size,y+2.5*size);
    vertex(x-10*size,y-2.5*size); //5th point
    vertex(x-2.5*size,y-2.5*size);
    endShape(CLOSE);
  }
  
  void display(){
    drawStars(xpos,ypos); //draws stars at x,y
  }
  
  void move(){ //based off of the bouncing ball example from processing.org by Ben Fry and Casey Reas
    xpos = xpos + (speed * xdirection);
    ypos = ypos + (speed * ydirection);
    
    if (xpos > width || xpos < 0){ //if xpos is less than 0 or more than the width, then reverse the direction
      xdirection *= -1;
    }
    if (ypos > height || ypos < 0){ //if ypos is less than 0 or more than the height, then reverse the direction
      ydirection *= -1;
    }
  }  
  
  void coll(){
    println("Good Morning Starshine! The Earth says Hello!"); //prints when stars collide, quote comes from the song "Good Morning Starshine" from the musical, Hair
  }
  void no_coll(){
    println("No stars for you"); //prints when stars do not collide
  }
  
  void inter(){
    println("You're a Shining Star!"); //prints when stars and obstacles intersect
    drawStars(xpos+(random(-100,100)),ypos+(random(-100,100))); //if stars collide w/ obstacle, stars multiply
  }
  
   boolean collide(Stars s0){
    float dis = dist(xpos,ypos,s0.xpos,s0.ypos);
    if (dis < size*30){ //if d is less than size*30, then boolean returns true
      return true;
    } else { //if d is not less than size*30, then boolean returns false
      return false;
    }  
  }
}


