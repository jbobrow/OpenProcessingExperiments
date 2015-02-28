
int w = 400;
int face;

void setup() {
  background(#cc33cc);
  size(w, w);
  rectMode(CENTER);
}

void draw() {
  background(#cc33cc);
  NeutralFace();
  faces(Key());
}

int Key() {
  if (key == CODED) {
    if (keyCode == UP) {
      face = 1;
    }
    else if (keyCode == DOWN) {
      face = 2;
    }
  }
  return face;
} //end key

//function devoted to drawing the eyes to save space
void eyes() {
  int ewidth = 28;
  fill(255);
  ellipse(w-225, w-225, ewidth, ewidth);
  ellipse(w-175, w-225, ewidth, ewidth);
  fill(0);
  ellipse(w-225, w-225, 10, 10);
  ellipse(w-175, w-225, 10, 10);
} //end eyes

//the starting face if no keys have been pressed
void NeutralFace() {
  fill(#99FFFF);
  ellipse(w/2, w/2, w/2, w/2);
  eyes();
  stroke(0);
  strokeWeight(2);
  line(160,240, 240, 240);
} //end NeutralFaces

//the face with a smile
void SmileyFace() {
  fill(#99FFFF);
  ellipse(w/2, w/2, w/2, w/2);
  eyes();
  line(161,155,189,135);
  line(240,155,211,135);
  noFill();
  arc(w/2, w-165, 85, 65, 0, PI);
} //end SmileyFace

//the face with a frown
void FrownyFace() {
  fill(#99FFFF);
  ellipse(w/2, w/2, w/2, w/2);
  eyes();
  noFill();
  arc(w/2, w-135, 85, 65, PI, TWO_PI);
  line(161,145,189,165);
  line(240,145,211,165);
  //line(w/2, w-165, w-240, w-150);
  //line(w/2, w-165, w-160, w-150);
  //rect(w/2, w-165, 100, 10);
} //end FrownyFace

//the function that changes the faces based on the key presses
void faces(int i) {
  if (i == 1) {
    background(#cc33cc);
    SmileyFace();
  }
  if (i == 2) {
    background(#cc33cc);
    FrownyFace();
  }
} //end faces
