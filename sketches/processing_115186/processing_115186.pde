
import ddf.minim.*;
int drawFish = 1; 

Minim minim;
AudioPlayer player;
AudioSample water;
void setup()
{
  size(600, 600);
  minim = new Minim (this);
  water = minim.loadSample("water.mp3");  //source from http://www.youtube.com/watch?v=4klJu4gwmtM
  player = minim.loadFile("04 - Bistro Fada.mp3"); //source from http://www.youtube.com/watch?v=FXhk9L8cuG0
  player.play();

}

void draw(){
  background(130);
  stroke(255);
  fill(#1CD2E8);
  rect(0,250,600,600);   //making the lower part becomes blue color

  
  for (int i = 0; i<player.bufferSize()-1;i++)    // drawing the waves
  {
    float A = map( i, 0, player.bufferSize(), 0, width );
    float B = map( i+1, 0, player.bufferSize(), 0, width);
    line( A, 300 + player.left.get(i)*50, B, 50 + player.left.get(i+1)*100 );
    line( B, 150 + player.right.get(i)*10, B, 150 + player.right.get(i+1)*50 );
  }
if (mousePressed)
water.trigger();     // sound effect by clicking the mouse
}

void drawFish(float x, float y,float radius){    // making an ellipse by clicking the mouse
  noFill();
  stroke(#FC9103);
  ellipse(x,y,radius*2,radius*2);
  fill(255);                                    //different size of ellipse
}

void mousePressed(){
  if (drawFish == 1) {

    drawFish (mouseX,mouseY,random(50,200));
  } else {
    drawFish (mouseX,mouseY,random(100,400));
  }
}

void keyPressed(){
  if (key == '1')
  drawFish = 1;
  else if (key == '2')
  drawFish = 2;
  
}

