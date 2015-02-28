
int h=30, c=0;
char Alui[]= {
  'A', 'l', 'u', 'i'
};
void setup() {
  size(600, 400);
  frameRate(3);
}

void draw() {
  background(155);
  textFont(loadFont("ComicSansMS-48.vlw"), h);
  c++;
  // for(int i=0;i<=5;i++){
  if (c>=20)
       text(Alui[0], 0, 30);
  else
       text(Alui[0], int(random(0, 600)), int(random(0, 400)));
  if (c>=30)
       text(Alui[1], 30, 30);
  else
       text(Alui[1], int(random(0, 600)), int(random(0, 400)));
  if (c>=40)
       text(Alui[2], 60, 30);
  else
       text(Alui[2], int(random(0, 600)), int(random(0, 400)));
  if (c>=50)
       text(Alui[3], 90, 30);
  else
       text(Alui[3], int(random(0, 600)), int(random(0, 400)));
}
