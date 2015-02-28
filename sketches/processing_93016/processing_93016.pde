
//int i = 1;
//print(i);

int wormsize;
void setup() {
  size(600,300);
  wormsize = 10;
}

void draw() {
  wormsize = wormsize +1;
  line(0,height/2,wormsize,height/2);
}
void mouseClicked() {
  print("click");
}
