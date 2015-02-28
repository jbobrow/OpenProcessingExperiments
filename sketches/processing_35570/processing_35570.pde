
void setup() {
  size(300, 300);
  smooth();
}

void draw(){
  colorMode(RGB);
  background(0, mouseX, 255);
  
  //moon
  colorMode(RGB);
  fill(255);
  ellipseMode(CENTER);
  ellipse(200,mouseX,30,30);
  
  //sun
  fill(250,255,0);
  ellipseMode(CENTER);
  ellipse(200,300-mouseX,30,30);
  
  //ground
  colorMode(HSB, width);
  fill(100, mouseX, mouseX);
  rect(0, 150, width, 150);
  
  //city skyline
  noStroke();
  colorMode(RGB);
  fill(200);
  rect(250,100,10,50);
  rect(260,75,10,75);
  rect(270,85,10,65);
  rect(280,125,10,25);
  rect(290,110,10,40);
  
  //city light
  noStroke();
  fill(250,252,133);
  //rect(250,150,50,299-mouseX);
  quad(250,150,300,150,width,450-mouseX,width/2,450-mouseX);
}



