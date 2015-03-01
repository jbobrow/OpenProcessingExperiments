
// my fibonacci-shapes
int a = 0;
int b = 1;
int c = 1;

void setup() {  //setup function called initially, only once
  size(800, 800);
  background(155);  //set background darkgrey
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode (wasauchimmer)
  noStroke();
}
void mousePressed() {
 redraw();
 ellipse(mouseX, mouseY, c/a*100, c/b*100);
fill(random(250),100,250,150);
}
void draw(){ 
// noLoop();
 while (c <= 1550){
  arc(a, b, b, c, c/a, TWO_PI);
  fill(random(250),100,250,150);
  a = b;
  b = c;
  c = a+b;
  }
 }
/*  counter++;
//  noStroke();
//  fill(random(255),100,255,50);
//  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
  */
