


int x = 250;
int r = 250;
int n = 6;


void setup () {
  

  size (800,400);
  noStroke();
  smooth();
  noLoop();
  colorMode( RGB, 60);
  for (int i = 10; i < 500; i++) {
    for (int j = 5; j < 500; j++) {
      stroke ( i, j , 5);
      point (i, j);
      


}
  }
}

void draw() {
  drawCircle(250, 250, 6);


}

void drawCircle(int x, int radius, int num) {
  float tt = 126 * num/8.0;
  fill(tt);
  ellipse(x, 50, radius*2, radius*2);
  if (num > 1)  {
    num = num - 1;
    drawCircle(x - radius/2, radius/2, num);
    drawCircle(x + radius/2, radius/2, num);
    drawCircle(x + radius/5, radius/5, num);
  drawCircle( x - radius/2, radius/4, num);
  drawCircle ( x - radius/4, radius/4, num);
  drawCircle ( x + radius * 2, radius *2, num);


  }
}
void keyPressed()  

//Takes PNG screenshots when you push S  

//Careful - doesn't prompt when overwriting files!  

{  

  if(key == 's' || key == 'S')  

  {  

    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser  

    if(filePath != null)  

    {  

      save(filePath + ".png");  

    }  

  }  

} 


