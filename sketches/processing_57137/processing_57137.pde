
size (600, 600);
  background (260,60,20);
  smooth();
  noStroke();

 
{
}

for (int y=0; y<=height; y+=40) {
    for (int x=0; x <= width; x+=50){
      fill(100, 190, 10);
    ellipse(x,y,50,50);
    }
  } //yellow
  for (int y=0; y<=height; y+=40) {
    for (int x=0; x <= width; x+=50){
      fill(230, 230, 10);
    ellipse(x,y,40,40);
    }
    }//black
  for (int y=0; y<=height; y+=40) {
    for (int x=0; x <= width; x+=50){
      fill(30, 20, 20);
    ellipse(x,y,30,30);
    }
    } //pink
  for (int y=0; y<=height; y+=40) {
    for (int x=0; x <= width; x+=50){
      fill(230, 210, 223);
    ellipse(x,y,20,20);
    }
  }

