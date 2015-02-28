
size(400,400);
noStroke();
background(#FA0526);

float x=0;
while(x<width) {
  float y=0;
  while(y<height) {
    fill(random(0,105));
    ellipse(x+20,y+20,38,38);
    y= y + 60;
    ellipse(x+50, y-8, 25, 25);
    ellipse(x+50, y-37, 9, 9);
  }
 

    x = x + 60;
  
}


