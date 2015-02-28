
// A partir do Buttons, Examples>Topics>GUI

// falta o que muda de cor e borracha

PGraphics bg;

PFont fontA;

color currentcolor;

CircleButton circle1, circle2, circle3, circle4, circle5, circle6, circle7, circle8, circle9;

boolean locked = false;

void setup()
{
  size(900, 600);
  frameRate(30);
  smooth();
  
  bg = createGraphics(900,600, P2D);
  bg.beginDraw();
  bg.background(195);
  bg.endDraw();
  
  fontA = loadFont("Gabriola-28.vlw");
  textFont(fontA);
  
  color baseColor = color(255);
  currentcolor = baseColor;
  
  //define circle1
  color buttoncolor = color(255, 0, 0);
  color highlight = color(200, 0, 0);
  circle1 = new CircleButton(130, 80, 24, buttoncolor, highlight);
  
  //define circle2
  buttoncolor = color(0, 255, 0);
  highlight = color(0, 200, 0);
  circle2 = new CircleButton(130, 110, 24, buttoncolor, highlight);
  
  //define circle3
  buttoncolor = color(0, 0, 255);
  highlight = color(0, 0, 200);
  circle3 = new CircleButton(130, 140, 24, buttoncolor, highlight);
  
  //define circle4
  buttoncolor = color(255, 150, 0);
  highlight = color(250, 120, 0);
  circle4 = new CircleButton(130, 170, 24, buttoncolor, highlight);
  
  //define circle5
  buttoncolor = color(255, 255, 0);
  highlight = color(255, 200, 0);
  circle5 = new CircleButton(130, 200, 24, buttoncolor, highlight);
  
  //define circle6
  buttoncolor = color(200, 0, 255);
  highlight = color(170, 0, 255);
  circle6 = new CircleButton(130, 230, 24, buttoncolor, highlight);
  
  //define circle7
  buttoncolor = color(0);
  highlight = color(30);
  circle7 = new CircleButton(130, 260, 24, buttoncolor, highlight);
  
  //define circle8
  buttoncolor = color(255);
  highlight = color(218);
  circle8 = new CircleButton(130, 290, 24, buttoncolor, highlight);
  
  //define circle9
  buttoncolor = color(195); //não tá funcionando
  highlight = color(195);
  circle9 = new CircleButton(130, 320, 24, buttoncolor, highlight);
}
void draw()
{
  image(bg, 0, 0);
 
   String s = "dado um corpo qualquer...";
   text(s, 15, 15, 500, 400);
   fill(192);
  
    if(mousePressed) {
      line(mouseX, mouseY, pmouseX, pmouseY);
      bg.beginDraw();
      bg.stroke(currentcolor);
      bg.line(mouseX, mouseY, pmouseX, pmouseY);
      bg.endDraw();
  }
  stroke(currentcolor);

  update(mouseX, mouseY);
  circle1.display();
  circle2.display();
  circle3.display();
  circle4.display();
  circle5.display();
  circle6.display();
  circle7.display();
  circle8.display();
  circle9.display();
}

void update(int x, int y)
{
  if(locked == false) {
    circle1.update();
    circle2.update();
    circle3.update();
    circle4.update();
    circle5.update();
    circle6.update();
    circle7.update();
    circle8.update();
    circle9.update();
  }
  else {
    locked = false;
  }
  if(mousePressed) {
    if(circle1.pressed()) {
      currentcolor = circle1.basecolor;
    }
    else if(circle2.pressed()) {
      currentcolor = circle2.basecolor;
    }
    else if(circle3.pressed()) {
      currentcolor = circle3.basecolor;
    }
    else if(circle4.pressed()){
      currentcolor = circle4.basecolor;
    }
    else if(circle5.pressed()){
      currentcolor = circle5.basecolor;
    }
    else if(circle6.pressed()){
      currentcolor = circle6.basecolor;
    }
    else if(circle7.pressed()) {
      currentcolor = circle7.basecolor;
    }
    else if(circle8.pressed()) {
      currentcolor = circle8.basecolor;
    }
    else if(circle9.pressed()) {
      currentcolor = circle9.basecolor;
    }
  }
}

class Button
{
  int x, y;
  int size;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;
  
  void update()
  {
    if(over()) {
      currentcolor = highlightcolor; 
    }
    else {
      currentcolor = basecolor;
    }
  }
  
  boolean pressed()
  {
    if(over) {
      locked = true;
      return true;
    }
    else {
      locked = false;
      return false;
    }
  }
  boolean over()
  {
    return true;
  }
  boolean overCircle(int x, int y, int diameter)
  {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if(sqrt(sq(disX) + sq(disY)) < diameter/2) {
      return true;
    }
    else {
      return false;
    }
  }
}

class CircleButton extends Button
{
  CircleButton(int ix, int iy, int isize, color icolor, color ihighlight)
  {
    x = ix;
    y = iy;
    size = isize;
    basecolor = icolor;
    highlightcolor = ihighlight;
    currentcolor = basecolor;
  }
  boolean over()
  {
    if( overCircle(x, y, size) ) {
      over = true;
      return true;
    }
    else {
      over = false;
      return false;
    }
  }
  
  void display()
  {
    noStroke(); 
    fill(currentcolor); //fill o que?
    ellipse(x, y, size, size);
  }
}

