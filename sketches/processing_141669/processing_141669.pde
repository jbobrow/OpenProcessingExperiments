
//Jenny McCarthy HW 9: Dumb Agents, hard coding (3/27/14)

Stars stars1; //declare star objects
Stars stars2;
Stars stars3;
Stars stars4;
Stars stars5;
Stars stars6; 
Obstacle ob1; //declare obstacle objects
Obstacle ob2;


void setup(){
  size(800,500);
  smooth();
  frameRate(20);
  stars1 = new Stars(); //initialize star objects
  stars2 = new Stars();
  stars3 = new Stars();
  stars4 = new Stars();
  stars5 = new Stars();
  stars6 = new Stars(); 
  ob1 = new Obstacle(75); //initialize obstacle objects
  ob2 = new Obstacle(150);
}

void draw(){
  background(0);
  stars1.display(); //diplay and move star objects
  stars1.move();
  stars2.display();
  stars2.move();
  stars3.display();
  stars3.move();
  stars4.display();
  stars4.move();
  stars5.display();
  stars5.move();
  stars6.display();
  stars6.move();
  ob1.display(); //display obstacle objects
  ob2.display();
  
  if (stars1.collide(stars2)){ //if star1 collides with star2, call coll function
    stars1.coll();
    stars2.coll();
  }
  if (stars1.collide(stars3)){ //if star1 collides with star3, call coll function
    stars1.coll();
    stars3.coll();
  }
  if (stars1.collide(stars4)){ //if star1 collides with star4, call coll function
    stars1.coll();
    stars4.coll();
  }
  if (stars1.collide(stars5)){ //if star1 collides with star5, call coll function
    stars1.coll();
    stars5.coll();
  }
  if (stars1.collide(stars6)){ //if star1 collides with star6, call coll function
    stars1.coll();
    stars6.coll();
  }
  if (stars2.collide(stars3)){ //if star2 collides with star3, call coll function
    stars2.coll();
    stars3.coll();
  }
  if (stars2.collide(stars4)){ //if star2 collides with star4, call coll function
    stars2.coll();
    stars4.coll();
  }
  if (stars2.collide(stars5)){ //if star2 collides with star5, call coll function
    stars2.coll();
    stars5.coll();
  }
  if (stars2.collide(stars6)){ //if star2 collides with star6, call coll function
    stars2.coll();
    stars6.coll();
  }
  if (stars3.collide(stars4)){ //if star3 collides with star4, call coll function
    stars3.coll();
    stars4.coll();
  }
  if (stars3.collide(stars5)){ //if star3 collides with star5, call coll function
    stars3.coll();
    stars5.coll();
  }
  if (stars3.collide(stars6)){ //if star3 collides with star6, call coll function
    stars3.coll(); 
    stars6.coll();
  }
  if (stars4.collide(stars5)){ //if star4 collides with star5, call coll function
    stars4.coll();
    stars5.coll();
  }
  if (stars4.collide(stars6)){ //if star4 collides with star6, call coll function
    stars4.coll();
    stars6.coll();
  }
  if (stars5.collide(stars6)){ //if star5 collides with star6, call coll function
    stars5.coll();
    stars6.coll();
  }
  if (ob1.intersect(stars1)){ //if star1 intersects obstacle1, call inter function
    stars1.inter();
  }
  if (ob1.intersect(stars2)){ //if star2 intersects obstacle1, call inter function
    stars2.inter();
  }
  if (ob1.intersect(stars3)){ //if star3 intersects obstacle1, call inter function
    stars3.inter();
  }
  if (ob1.intersect(stars4)){ //if star4 intersects obstacle1, call inter function
    stars4.inter();
  }
  if (ob1.intersect(stars5)){ //if star5 intersects obstacle1, call inter function
    stars5.inter();
  }
  if (ob1.intersect(stars6)){ //if star6 intersects obstacle1, call inter function
    stars6.inter();
  }
  if (ob2.intersect(stars1)){ //if star1 intersects obstacle2, call inter function
    stars1.inter();
  }
  if (ob2.intersect(stars2)){ //if star2 intersects obstacle2, call inter function
    stars2.inter();
  }
  if (ob2.intersect(stars3)){ //if star3 intersects obstacle2, call inter function
    stars3.inter();
  }
  if (ob2.intersect(stars4)){ //if star4 intersects obstacle2, call inter function
    stars4.inter();
  }
  if (ob2.intersect(stars5)){ //if star5 intersects obstacle2, call inter function
    stars5.inter();
  }
  if (ob2.intersect(stars6)){ //if star6 intersects obstacle2, call inter function
    stars6.inter();
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
  
  Obstacle (float obSize){
    oSize = obSize;
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


