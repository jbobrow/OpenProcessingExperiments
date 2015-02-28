
/*Bellboy
                by Kenji Mendoza
                
This little digital buddy can brighten your day with play and the sounds of bells. But please be careful to not toss him too hard
when you're playing... it's not so good for his health!



*/

import ddf.minim.*;

Minim minim;
AudioSnippet giggle;
AudioSample wallnoise1; 
AudioSample wallnoise2;
AudioSample wallnoise3;
AudioSample wallnoise4;
AudioSample wallnoisea; 
AudioSample wallnoiseb;
AudioSample wallnoisec;
AudioSample wallnoised;
AudioSnippet deathnoise;

int xw = 50;
int xy = 50;
int t = 80;
int g = 20;
int lifecounter = 0;
boolean giggling = false;
boolean hurt = false;
boolean alive = true;

Mover mover;

void setup() {
  size(500, 500);
  smooth();
  background(255);
  mover = new Mover();
  ellipseMode(RADIUS);
      minim = new Minim(this);
    giggle = minim.loadSnippet("gigglenoiseb.wav");
    wallnoise1 = minim.loadSample("wallnoise1b.wav");
    wallnoise2 = minim.loadSample("wallnoise2b.wav");
    wallnoise3 = minim.loadSample("wallnoise3b.wav");
    wallnoise4 = minim.loadSample("wallnoise4b.wav");
    wallnoisea = minim.loadSample("wallnoisea.wav");
    wallnoiseb = minim.loadSample("wallnoiseb.wav");
    wallnoisec = minim.loadSample("wallnoisec.wav");
    wallnoised = minim.loadSample("wallnoised.wav");
    deathnoise = minim.loadSnippet("deathnoise.wav");
}
  
void draw() {
  
  if (alive == true) {
  stroke(0);
  strokeWeight(8);
  fill(255, 220); //The alpha input controls the amount of motion blur.
  rect(0, 0, width, height);
  } else {
  stroke(255);
  strokeWeight(8);
  fill(0);
  rect(0, 0, width, height);
   }

  mover.update();
  mover.checkEdges();
  mover.display();
}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
    
  Mover() {
    location = new PVector(250, 250);
      velocity = new PVector(3,0);
      acceleration = new PVector(0, 0.2);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
  }
  
  //From here on is the good stuff, starting with the Bellboy himself.
  void display() {

    noStroke();
    fill(0);
    if (alive == true) {     //Bellboy in his normal state.
      ellipse(location.x, location.y, xw, xy);
      fill(255);
  ellipse(location.x-36, location.y-3, 8, 8);
  ellipse(location.x+36, location.y-3, 8, 8);
    } else {                 //Dead Bellboy.
       noStroke();
   fill (255);
     rect(location.x, location.y, xw+5, xy+5);
    fill(0);
      rectMode(RADIUS);
      rect(location.x, location.y, xw, xy);
    fill(255);
PFont font;
font = loadFont("Dead.vlw"); 
textFont(font); 
text("X", location.x-45, location.y); 
text("X", location.x+25, location.y);
    }
    
  float m = velocity.mag();  //This changes Bellboy to the 'hurt' state if he's thrown too hard.
   if (m >= 94) {
     hurt = true;
  }
  
  //Eyes change on mouseover and 'health' status
  if (giggling == true && hurt == false) {
    fill(0);
        ellipse(location.x-38, location.y+5, 12, 8); 
        ellipse(location.x+38, location.y+5, 12, 8);
  }
  if (hurt == true && alive == true) {
    fill(0);
        ellipse(location.x-38, location.y-7, 11, 7); 
        ellipse(location.x+38, location.y-7, 11, 7);
}
}

  void checkEdges() {
//These if statements deal with collision. The else if statements deal with his hurt state.
//Right Wall
    if (location.x > width - xw && hurt == false) {
      velocity.x = velocity.x * - 0.82; //This simulates bounce energy loss
      location.x = width - xw;
        strokeWeight(0.8);
        fill(255, t);
        ellipse(location.x, location.y , xw+20, xy+20); //This creates a circle around Bellboy to show wall collision.
          wallnoise1.trigger();

          } else if (location.x > width - xw && hurt == true) {
      velocity.x = velocity.x * - 0.3;
      location.x = width - xw;
        strokeWeight(0.8);
        fill(255, t);
        ellipse(location.x, location.y , xw+20, xy+20);
        if (lifecounter < 8) {
            wallnoisea.trigger();       
    }     
    }
    
//Left Wall
    if (location.x < xw && hurt == false) {
      velocity.x = velocity.x * - 0.82;
      location.x = xw;
        strokeWeight(0.8);
        fill(255, t);
        ellipse(location.x, location.y , xw+20, xy+20);
          wallnoise3.trigger();
          
    } else if (location.x < xw && hurt == true) {     
      velocity.x = velocity.x * - 0.3;
      location.x = xw;
        strokeWeight(0.8);
        fill(255, t);
        ellipse(location.x, location.y , xw+20, xy+20);
        if (lifecounter < 8) {
          wallnoised.trigger(); 
    }     
    }
    
//Floor
    if (location.y > height - xy && hurt == false){
      velocity.y = velocity.y * - 0.98; //The energy loss is different here so the ball will keep bouncing for longer.
      velocity.x = velocity.x * 0.96;
      location.y = height - xy-10;
        strokeWeight(0.8);
        fill(255, t);
        ellipse(location.x, location.y , xw+20, xy+20);
          wallnoise2.trigger();
          
    } else if (location.y > height - xy && hurt == true && alive == true) {
      velocity.y = velocity.y * - 0.6;
      velocity.x = velocity.x * 0.9;
      location.y = height - xy-15;
      lifecounter = lifecounter+1;
        strokeWeight(0.8);
        fill(255, t);
        ellipse(location.x, location.y , xw+20, xy+20);
        if (lifecounter < 8){
          wallnoisec.trigger();
    } 
    }
    
//Ceiling
    if (location.y < xy+5 && hurt == false) {
      velocity.y = velocity.y * - 0.82;
      location.y = xy+5;
        strokeWeight(0.8);
        fill(255,t);
        ellipse(location.x, location.y , xw+20, xy+20);
          wallnoise4.trigger();
          
    } else if (location.y < xy+5 && hurt == true) {
      velocity.y = velocity.y * - 0.3;
      location.y = xy+5;
        strokeWeight(0.8);
        fill(255, t);
        ellipse(location.x, location.y , xw+20, xy+20);
          wallnoiseb.trigger();
    }
    
//And if you don't take care of poor little Bellboy...
    if (lifecounter >= 8) {
      alive = false;
      velocity.y = 0;
      velocity.x = 0;
      location.y = height - xy-3;
      giggle.pause();
      deathnoise.play();
    }
    
    //Mouse interactions
    dist(location.x, location.y, mouseX, mouseY);
    if (dist(location.x, location.y, mouseX, mouseY) < xw && alive == true){ //Checks mouseover and if Bellboy's still kicking.
      location.x += random(-3, 3);      //Happy horizontal jiggle.
      giggling = true;
        fill(0);      
        ellipse(location.x-37, location.y+15, 14, 14);   //Wiggly bell bits.
        ellipse(location.x+37, location.y+15, 14, 14);
            if (mousePressed == true) { //This is so you can pick up and throw the little guy.
        location.x = mouseX;
        location.y = mouseY;
        velocity.x = mouseX - pmouseX;
        velocity.y = mouseY - pmouseY;
    }
    } else {
      giggling = false;
      giggle.loop();
      }
  }
}

void stop()
{
    giggle.close();
    wallnoise1.close();
    wallnoise3.close();
    wallnoise4.close();
    wallnoise2.close();
    wallnoisea.close();
    wallnoiseb.close();
    wallnoisec.close();
    wallnoised.close();
    deathnoise.close();
    minim.stop();
    super.stop();
}

