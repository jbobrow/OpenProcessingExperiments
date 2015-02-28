
float vel=0;
void setup() {
  size(400, 400);
    

}

void draw() {
  fill(0, 20);
  noStroke();
  rect(0, 0, width, height);
  fill(20,40,80);
  arc(50, 50, 80, 80, 0, PI+QUARTER_PI, PIE);

  


noCursor();
colorMode(HSB);

curve(3*(width/4), height/2,200,200,220,230,230,230);
curve(width/2,height/2,30,30,30,30,30,30);
fill(255);
ellipseMode(CENTER);
int steps = 6;
for (int i = 0; i <= steps; i++) {
  float t = i / float(steps);
  float x = curvePoint(5, 5, 73, 73, t);
  float y = curvePoint(26, 26, 24, 61, t);
  ellipse(x, y, 5, 5);
  x = curvePoint(5, 73, 73, 15, t);
  y = curvePoint(26, 24, 61, 65, t);
  ellipse(x, y, 5, 5);
}

  vel= dist(mouseX, mouseY, pmouseX, pmouseY);
  fill(50,60,125);
  ellipse(mouseX, mouseY, vel+10, vel+10);
  ellipse(mouseY, mouseX, vel+10, vel+10);
  

textSize(32);
fill(0, 102, 153, 204);
text("corazom", 12, 45, -30);  // Specify a z-axis value
text("bie", 12, 60);  // Default depth, no z-value specified


 

  if (mousePressed) 
    fill(0);
  triangle(width/2, height/2,228, 202, 222, 235);

int counter;




  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;


//void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
