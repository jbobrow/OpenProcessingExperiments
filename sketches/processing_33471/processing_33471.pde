
//set variable for pngs
PImage eyeOpen;
PImage eyeClose;
int a = 200;
int vel = 8;

//setup canvaus
void setup(){
  size(500,500);
  background(255);
  smooth();
  //instructions
}

void draw(){

  background(255);

  //draws triangle
  fill(0);
  noStroke();
  beginShape();
  vertex(250,145);
  vertex(345, 300);
  vertex(155, 300);
  endShape();

  //draws outter circle
  noFill();
  stroke(0);
  strokeWeight(5);
  ellipse(250,250,215,215);

  //load eye png
  eyeOpen = loadImage("eyeopen.png");
  image(eyeOpen,197,197);
  
  //mouse pressed=eye closed
  if(mousePressed == true){
    stroke(0);
    strokeWeight(2);
    line(250, 145, 250, a);
    a += -vel;
    vel *= 1;
    fill(0);
    noStroke();
    beginShape();
    vertex(250,145);
    vertex(345, 300);
    vertex(155, 300);
    endShape();
    eyeClose = loadImage("eyeclosed.png");
    image(eyeClose,197,197);
  }
  else{
    a = 200; 
  }

  //key pressed = still to decide
  if(keyPressed){
    if(key==' '){
    }
  }

  //mapping eyeball colour change
  int c = 0;
  float eyecolor = map(a, 0, 255, 0, 255);

  //mapping the eyeballs to mouse
  float eyeMoveX = map(mouseX,0,width,238,262);
  noStroke();
  fill(eyecolor);
  ellipse(eyeMoveX,250,8,8);


}






