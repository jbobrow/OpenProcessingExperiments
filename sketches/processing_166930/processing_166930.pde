
float [] xpos=new float [50];
float [] ypos=new float [50];

void setup() {
  size(400, 400);
  for (int i=0; i<50; i ++) {
    xpos [i]=random (width);
    ypos[i]=random(height);
  }
}
void draw() {
  fill (0, 12);
  rect (0, 0, width, height);
  for (int i=0; i<50; i++) {
    fill (0, 255, 0);
    int randNum = int(random(280, 300));
    char randomCharacter = char (randNum);
    text (randomCharacter, xpos[i], ypos[i]);
    ypos[i] +=5.0;
    if (ypos[i] > height) ypos[i]=0;
  }
}
