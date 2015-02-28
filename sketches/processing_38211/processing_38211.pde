
size(300,300);


int spacing =10;
int sides = 15;
int figuresize =10;

translate (width/2,height/2);//makes the image circle around the middle

for(int x=sides; x<width-sides; x+=spacing) {
  pushMatrix();
  rotate(45);//makes the rotate angle at 45degrees
  for(int y=sides;y<height-sides; y+=spacing) {
    fill(8,15,196);
    ellipse(x,y,random(10),random(15));
    fill(196,8,8);
    rect(x+10,y+5,10,random(10));
  }
}

