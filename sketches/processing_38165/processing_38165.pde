
size(300, 300);

background(5,5,5,100);
stroke(100,100,100,200);

int spacing = 25;
int margin = 50;

for (int y=margin; y <height-margin; y+=spacing) {
  for (int x=margin; x < width-margin; x+=spacing) {
    fill(255);
    rect(x,y,50,50);
    fill(3);
    rect(x,y,20,20);
    line(x+50,y,x,y+50);
  }
}

