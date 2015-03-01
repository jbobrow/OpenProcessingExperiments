
/*
* Title: ticktock clock
* Made by: @ramayac
* Inspired by Imgur: http://imgur.com/account/favorites/Fcz5j7I
* Time: 2 Hours.
*/

String message = "ioioioioioioioioioioioioioioioioioioioioioioioioioioioioioio";
PVector[] puntos;
float[] pasosRota;

PFont f;
// The radius of a circle
float r = 129;
float teta = 0;
int segundo = 0;

color green = color(135,188,71);
color red = color(240,69,69);

color getGColor(int valor){
  if(valor <= 30){
    float m = map(valor, 0, 30, 0.0, 1.0);
    return lerpColor(green, red, m);
  } else if (valor > 30){
    float m = map(valor, 31, 60, 0.0, 1.0);
    return lerpColor(red, green, m);
  }
  return 0;
}

void setup() {
  size(400, 400);
  f = createFont("Arial",36,true);
  textFont(f);
  // The text must be centered!
  textAlign(CENTER);
  smooth();
  frameRate(1);
  
  int p_size = message.length();
  println(p_size);
  puntos = new PVector[p_size];
  pasosRota = new float[p_size];
  
  background(#2B2B2B);
}

void draw() {
  background(#2B2B2B);
  translate(width / 2, height / 2);

  // We must keep track of our position along the curve
  float arclength = 200;
  // For every box
  for (int i = 0; i < message.length(); i++){
    // Instead of a constant width, we check the width of each character.
    char currentChar = message.charAt(i);
    float w = textWidth(currentChar); 
    arclength += w/2;
    float theta = PI + arclength / r;

    pushMatrix();
    //PVector p = puntos[i];
    float xx = r*cos(theta);
    float yy = r*sin(theta); 
    translate(xx, yy);
    
    if(puntos[i] == null){
      puntos[i] = new PVector(xx, yy);
      pasosRota[i] = degrees(theta);
    }
    
    rotate(theta+PI/2); // rotation is offset by 90 degrees
    // Display the character
    fill(getGColor(i)); //color acording to character
    text(currentChar, 0,0);
    popMatrix();
    // Move halfway again
    arclength += w/2;
  }

  translate(0, 0);
  PVector p = puntos[segundo];
  color cc = getGColor(segundo);
  stroke(cc);
  fill(cc);
  
  drawArrow(0, 0, pasosRota[segundo]);
  segundo++;
  if(segundo >= message.length()) segundo = 0;
}

void drawArrow(float cx, float cy, float angle){
  pushMatrix();
  translate(cx, cy);
  rotate(radians(angle));
    pushMatrix();
    rotate(radians(90));
    text("t", 0,-158);
    text("c", 0,-108);
    text("k", 0,-80);
    //triangle(x1, y1, x2, y2, x3, y3):
    triangle(-48, -40, 0, -78, 48, -40);
    rect(-30, -50, 60, 80);
    popMatrix();
  popMatrix();
}


