
size(300,300);


int spacing =10;
int sides = 15;
int figuresize =10;
//both of these loops will make a pattern of circles
for(int x=sides; x<width-sides; x+=spacing) {
  for(int y=sides;y<height-sides; y+=spacing) {
    fill(8,15,196);
    ellipse(x,y,random(10),random(15));
  }
}

