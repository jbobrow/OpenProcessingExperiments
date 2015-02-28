
size(300, 300);
background(0);
smooth();

int spacing = 15;//spacing between points
int margin = 20; //sets margins

for (int y=margin; y <height-margin; y+=spacing) {
  for (int x=margin; x < width-margin; x+=spacing) {
    float weight = random(7); //sets random weight
    stroke(255);
    strokeWeight(weight);
    if (weight>5) {//if weight is > 5 make random shade of blue
      stroke(0,0,random(100,255),100);
    }
    point(x, y);
  }
}


