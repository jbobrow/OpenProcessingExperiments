
//HW4 - Computing for arts with Processing
//Copyright Ziad Ewais (zewais) - 09/08/2011 - CMU

//Setup
float x, y, w, h, a;
boolean on, goRight, goLeft, goUp, fade;
color colZ, colH, colE, colStroke;
void setup()
{
  size (400, 400);
  background(157,253,255);
  x = 50;
  y = 50;
  w = 300;
  h = 300;
  a = 255;
  smooth();
  on = false;
  goRight = false;
  goLeft = false;
  goUp = false;
  goLeft = false;
  fade = false;
  colZ = color(255,0,0);
  colE = color(255,100,50);
  colH = color(255,255,0);

}

void draw()
{
  
  //bg();
  background(51,143,240);
  //Shapes
  //Z
  //println(a);
  //println(colZ);q
  if(keyPressed && key == 'q')
  {
    on = true;
    goRight = true;
  }
  if(x + w <= 400 && on && goRight && goUp == false)
    x++;
  else if (x >= 0 && on)
  {
    goRight = false;
    goLeft = true;
    x--;
  }
  else if(x <= 0 && on && goLeft && goUp == false)
  {
    goLeft = false;
    goRight = true;
  }
  if(keyPressed && key == 'z')
  {
    on = false;
  }

  
  if(mousePressed && mouseButton == LEFT && a > 0)
  {
    fade = true;
  }
  if(mousePressed && mouseButton == RIGHT)
  {
    fade = false;
  }
  if(a > 0 && fade)
  {
    a--;
  }
  if(a < 255 && fade == false)
  {
    a++;
  }
  
 



  stroke(255,177,52, a);
  strokeWeight(((w + h)/2) / 50);
  
  //Z
  fill(colZ,a);
  beginShape();
  
  curveVertex(x , y + .1 * h);
  curveVertex(x , y + .1 * h); 
  curveVertex(x + .15 * w, y + .12 * h);
  curveVertex(x + .3 * w, y + .1 * h);
  curveVertex(x + .4 * w, y + .12 * h);
  curveVertex(x + .3 * w, y + .25 * h);
  curveVertex(x + (1.0 / 6) * w, y + .6 * h);
  curveVertex(x + .11 * w, y + .9 * h);
  curveVertex(x + .40 * w, y + .9 * h);
  curveVertex(x + .42 * w, y + .95 * h);
  curveVertex(x + .40 * w, y + h);
  curveVertex(x + .05 * w , y + h);
  curveVertex(x - .05 * w , y + .92 * h);
  curveVertex(x + .20 * w , y + .25 * h);
  curveVertex(x + (1.0 / 6) * w , y + .22 * h);
  curveVertex(x  , y + .22 * h);
  curveVertex(x , y + .1 * h);
  curveVertex(x , y + .1 * h); 
  
  
  endShape();
  
  //E
  
  fill(colE,a);
  beginShape();
  
  curveVertex(x + .65 * w , y + .1 * h);
  curveVertex(x + .65 * w , y + .1 * h);
  curveVertex(x + .8 * w , y + .15 * h);
  curveVertex(x + w, y + .1 * h);
  curveVertex(x + 1.05 * w , y + .4 * h);
  curveVertex(x + .8 * w , y + .3 * h);
  curveVertex(x + .8 * w , y + .5 * h);
  curveVertex(x + .9 * w , y + .5 * h);
  curveVertex(x + .95 * w , y + .45 * h);
  curveVertex(x + .95 * w , y + .65 * h);
  curveVertex(x + .8 * w , y + .6 * h);
  curveVertex(x + .8 * w , y + .8 * h);
  curveVertex(x + .8 * w , y + .9 * h);
  curveVertex(x + w , y + .8 * h);
  curveVertex(x + 1.05 * w , y + .9 * h);
  curveVertex(x + w , y + h);
  curveVertex(x + .7 * w , y + h);
  curveVertex(x + .65 * w , y +  .85 * h);
  curveVertex(x + .65 * w , y + .1 * h);
  curveVertex(x + .65 * w , y + .1 * h);
  
  endShape();
  
  //H
  
  fill(colH,a);
  beginShape();
  
  curveVertex(x + .3 * w , y);
  curveVertex(x + .4 * w , y);
  curveVertex(x + .4 * w , y + .5 * h);
  curveVertex(x + .6 * w , y + .5 * h);
  curveVertex(x + .6 * w , y);
  curveVertex(x + .7 * w , y);
  curveVertex(x + .7 * w , y + h);
  curveVertex(x + .6 * w , y + h);
  curveVertex(x + .6 * w , y + .7 * h);
  curveVertex(x + .4 * w , y + .7 * h);
  curveVertex(x + .4 * w , y + h);
  curveVertex(x + .3 * w , y + h);
  curveVertex(x + .3 * w , y);
  curveVertex(x + .4 * w , y);
  curveVertex(x + .4 * w , y);
  
  
  endShape();

}

void keyPressed()
{
  if(keyCode == UP)
  {
    y = y - 10;
  }
  else if(keyCode == DOWN)
  {
    y = y + 10;
  }
  else if(keyCode == RIGHT)
  {
    x = x + 10;
  }
  else if(keyCode == LEFT)
  {
    x = x - 10;
  }
  else if(keyCode == DOWN && keyCode == LEFT)
  {
    x = x + 10;
    y = y + 10;   
  }
  else if(keyCode == DOWN && keyCode == RIGHT)
  {
    x = x - 10;
    y = y + 10;   
  }
  else if(keyCode == UP && keyCode == LEFT)
  {
    x = x + 10;
    y = y - 10;   
  }
  else if(keyCode == UP && keyCode == RIGHT)
  {
    x = x - 10;
    y = y - 10;   
  }
  else if(key == 'a' && w > 0)
  {
    w = w - 10;   
  }
  else if(key == 'd')
  {
    w = w + 10;   
  }
  else if(key == 'w' && h > 0 )
  {
    h = h - 10;   
  }
  else if(key == 's')
  {
    h = h + 10;   
  }
  
}

void bg()
{
  //Background
  
  for(int i = 0; i < 30 ; i++)
  {
    noStroke();
    fill(74,161,229,200 - i * 10);
    rect(0,0, 400 ,5 * 2 * i);
    rect(0,0,5 * 2 * i, 400);
  }
  
  fill(252, 200, 3, 220);
  stroke(252,180,20);
  strokeWeight(6);
  beginShape();
  
  curveVertex(0,400);
  curveVertex(0,400);
  curveVertex(0,370);
  curveVertex(50,350);
  curveVertex(100,370);
  curveVertex(150,330);
  curveVertex(200,350);
  curveVertex(300,330);
  curveVertex(350,350);
  curveVertex(400,370);
  curveVertex(400,400);
  curveVertex(400,400);
  
  endShape();
  
  noStroke();
  for(int i = 5; i > 0; i--)
  {
    fill(255,233 - i * 20,23 - i * 10);
    ellipse(0,0,50 + i * 20,50 + i * 20);
  }
  
  stroke(252,180,20);
  strokeWeight(6);
  line(0,85,0,95);
  line(20,80,22,90);
  line(40,73,45,80);
  line(60,60,68,68);
  line(75,40,82,45);
  line(80,20,90,22);
  line(85,0,95,0);
}


