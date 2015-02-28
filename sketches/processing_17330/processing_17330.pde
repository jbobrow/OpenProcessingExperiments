
int xpos = 0;
int ypos = 0;

void setup()
{
  size(400, 400);
//  background(0);
}

void draw() {
 background(mouseX,mouseY,0);
  for(int j=0; j<=400; j = j+50) {
    for (int i=0; i<=450; i = i+30) { //i starts at 0, goes to 40, increases by 1 every time
      //starting condition, exit condition, incriment
      xpos=i;
      ypos=j;
      noStroke();
      fill(255,0,155);
      rect(xpos,ypos,10,20);
      stroke(255);
//      fill(mouseX,mouseX,mouseY);
      fill(random(255),random(255),random(255));
      ellipse(xpos-40, ypos, 10, 30);
      fill(255);
      ellipse(xpos+40, ypos, 10, 10);
      stroke(xpos,xpos,xpos);
      line(xpos-10, ypos+15, xpos+20, ypos+35);
    }
  }
}
                
                
