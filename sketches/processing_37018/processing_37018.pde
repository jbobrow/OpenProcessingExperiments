
size(400,400);
noFill();
background(100,40,80);

int x = 10;
int y = 10;

stroke(255);
for (int i = 10; i<260; i=i+20) {
  fill(i+10%255);
  rect(i, i, width/3, height/3);
}
  

