
int changeColor;
int squareX;
int squareX1;
int squareX2;

void setup(){
  size(350,350);
  changeColor = 0;
  background(255);
  squareX=50;
  squareX1=300;
  squareX2=300;
  noStroke();

}
void draw(){
  rectMode(CENTER);
  
 fill(255,0,153);
 rect(25,25,width*2,50);
 fill (255,0,255);
 rect(25,25,44,44);

//button
  fill(changeColor,0,changeColor);
  rect(squareX,200,100,100);
    if (mouseX > 0 && mouseX < 100 && mouseY > 150 && mouseY < 300)
    {
      changeColor=235;

      if (mousePressed) {
        changeColor=255;
      squareX++;
      }

  }
  if (mouseX > 6 && mouseX < 344 && mouseY > 6 && mouseY < 44)
    {
      

      if (mousePressed) {
        background(255 );
      }

  }
  //squares
  fill(255,0,255);
  rect(squareX1,100,100,100);
  squareX1--;
  fill(255,0,255);
  rect(squareX2,300,100,100);
  squareX2=squareX2-3;

  
  
}
