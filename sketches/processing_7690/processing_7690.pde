
/*  
 Emotional 
 by Clea Stone
 CMSC 117
 2/17/10
  
 Use the Arrow keys (UP, DOWN, RIGHT, LEFT) to change my expresion.
 Press and hold the mouse to draw hair.
 
 */ 

void setup ()
{
  size(500,500);
  smooth();
  
  //background 
  for (int x = 0; x < 500; x = x + 200) 
  { 
    for (int y = 0; y < 500; y = y + 200) 
    { 
      fill(0); 
      rect(x, y, 100,100); 
    } 
  }

  // face
  noStroke();
  fill(255, 200, 180);
  ellipse(250,250,350,450);

}

void draw()
{

  //nose
  noFill();
  stroke(0);
  strokeWeight(2); 
  bezier(250, 250, 300, 300, 300, 300, 250, 300);

  //eyes
  fill(255);
  noStroke();
  ellipse(150,200, 100,50);
  ellipse(350,200, 100,50);

  //eye color
  fill(90, 38, 16);
  ellipse(150,200,30,30);
  ellipse(350,200,30,30);

  //pupils
  fill(0);
  ellipse(150,200,10,10);
  ellipse(350,200,10,10);

  //smile
  fill(150,0,0);
  ellipse(250,370,150,90);
  fill(255, 200, 180);
  rect(175,300,180,70);

  if (key == CODED) 
  {

    //left wink
    if (keyCode == LEFT) 
    {  
      stroke(255, 200, 180);
      fill(255, 200, 180);
      ellipse(150,200, 100,50);
      ellipse(150,200,30,30);
      stroke(0);
      strokeWeight(4);
      line(102,200,198,200);
      noStroke();
    }

    //right wink
    if (keyCode == RIGHT)
    {
      stroke(255, 200, 180);
      fill(255, 200, 180);
      ellipse(350,200, 100,50);
      ellipse(350,200,30,30);
      stroke(0);
      strokeWeight(4);
      line(302,200,398,200);
      noStroke();
    }

    // both wink
    if (keyCode == UP) 
    {
      stroke(255, 200, 180);
      fill(255, 200, 180);
      ellipse(350,200,100,50);
      ellipse(350,200,30,30);
      stroke(0);
      strokeWeight(4);
      line(302,200,398,200);
      noStroke();

      stroke(255, 200, 180);
      fill(255, 200, 180);
      ellipse(150,200,100,50);
      ellipse(150,200,30,30);
      stroke(0);
      strokeWeight(4);
      line(102,200,198,200);
      noStroke();
    }

    //unhappy
    if (keyCode == DOWN) 
    {
      stroke(255, 200, 180);
      fill(255, 200, 180);
      ellipse(250,370,150,90);
      stroke(150,0,0);
      strokeWeight(7);
      line(178,370,322,370);
      noStroke();
      stroke(0);
      strokeWeight(7);
      line(120,120,200,170);
      line(300,170,380,120);
    }
    else 
    {
      stroke(255, 200, 180);
      strokeWeight(7);
      line(120,120,200,170);
      line(300,170,380,120);
    }   
    
  }
    
    // draw hair
    if (mousePressed)
    {
      strokeWeight(20); 
      stroke(90, 38, 16); 
      point(mouseX,mouseY);
    }
 
}



