

int x;
int y;

float pupil1;
float pupil2;
float pupil3;

void setup(){
  size(300,300);
}

void draw(){
  background(1);
  frameRate(25);
  smooth();
  //Face
  fill(239,208,207);
  ellipse(150,150,200,220);
  fill(255);
  //Eyeballs
  ellipse(100,110,70,50);
  ellipse(200,110,70,50);
  //Mouth
  ellipse(150,190,100,50);
  //Moving eye boundaries
  fill(146, 111, 91);
  pupil1 = map(mouseX, 0, width, 80, 117);
  pupil2 = map(mouseY, 0, height, 100, 123);
  pupil3 = map(mouseX, 0, width, 180, 217);
  //Draws eyes
  ellipse(pupil1,pupil2,15,15);
  ellipse(pupil3,pupil2,15,15);
  
}

void mousePressed() {
  frameRate(7);
  //Eyes blink
  fill(239,208,207);
  ellipse(200,110,70,50);    
  ellipse(100,110,70,50);  

}


