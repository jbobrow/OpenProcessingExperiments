
size(600, 600);
smooth();
//background(156, 65, 73);
noStroke();

PFont font;
font = loadFont("CamilleBD-120.vlw");
textFont(font);
textSize(200);


int number = 10;

int w = width/number;
int h = height/number;

for (int i = 0; i<number; i++) {
  for (int j = 0; j<number; j++) {

    int x = i*w-12;
    int y = j*h+85;

    fill((3*(x+y))%200, (2*(x+y)%180), (4*(x+y)%100), (4*(x+y)%200));
    text("a", x, y);
    text("b",x+1,y+1);
  }
}


