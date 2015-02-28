
float theta = 0;
float delta = 0;
float diameter = 200;
float n=0;

void setup() {
  size(800, 800);

  colorMode(HSB, 100);
  background(0,0,100);
  smooth();
  noStroke();
}

void draw() {
    PFont font;
  font = loadFont("ArialNarrow-24.vlw");
  background(0,0,100);
  
  int[] angs = {31,28,31,30,31,30,31,31,30,31,30,31};
  String[] captions = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
  int j = 0;
  float lastAng = 0;
  translate(width/2,height/2);
  
  //Rotation
  if (mousePressed == true) {
    if (mouseY > height/2) {
      if (mouseX > pmouseX) {
        delta = delta-(dist(mouseX,0,pmouseX,0))/width*TWO_PI;
      } else {
        delta = delta+(dist(mouseX,0,pmouseX,0))/width*TWO_PI;
      }
    } else {
      if (mouseX > pmouseX) {
        delta = delta+(dist(mouseX,0,pmouseX,0))/width*TWO_PI;
      } else {
        delta = delta-(dist(mouseX,0,pmouseX,0))/width*TWO_PI;
      }
    }
  } else {
    delta = delta + 0.001;
  }
    rotate(delta);
    
  //Enlarge
  if (mousePressed == true) {
    if (dist(mouseX,mouseY,width/2,height/2)>dist(pmouseX,pmouseY,width/2,height/2)) {
      diameter = diameter + dist(mouseX,mouseY,pmouseX,pmouseY);
    } else {
      if (diameter>150) {
        diameter = diameter - dist(mouseX,mouseY,pmouseX,pmouseY);
      }
    } 
  } else {
    diameter = diameter;
  }
  

  //Draw Section
  for (int i = 0; i < angs.length; i++){
    colorMode(HSB, 100, 100,100);
    fill(j,100,100,50);
    arc(0, 0, 
    diameter+20*sin(theta)+noise(i)*200, diameter+20*sin(theta)+noise(i)*200, 
      lastAng-radians(abs(2*sin(theta)))+HALF_PI, lastAng+radians(angs[i])+radians(abs(2*sin(theta)))+HALF_PI);
      lastAng += radians(angs[i]);
    pushMatrix();
    rotate(lastAng-radians(abs(2*sin(theta)))+HALF_PI + 
      ((lastAng-radians(abs(2*sin(theta)))+HALF_PI)- (lastAng+radians(angs[i])+radians(abs(2*sin(theta)))+HALF_PI))/2);
    translate((diameter+20*sin(theta)+noise(i)*200)/2,0);
    rotate(PI);
    fill(0,0,100);
    textFont(font);
    text(" "+captions[i],0,0);
    popMatrix();
    j = j + 10;
  }
  theta = theta+0.05;
  
  if (diameter>150) {
    fill(0,0,100);
    ellipse(0, 0,diameter-150, diameter-150);
  }
}

