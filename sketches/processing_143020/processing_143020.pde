
/*----------------------------------
   
 Copyright by Diana Lange 2014
 Don't use without any permission
 
 This sketch is based on:
 #509 Firebird â�� Parabolas, yeah! by Geometry Daily
 http://geometrydaily.tumblr.com/post/58697000746/509-firebird-parabolas-yeah
   
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 --------------------------------------*/
  
int centerX, centerY;
float scheitelWidth;
float parbolHeight, parbolWidth;
float scheitelWidthFactor;
int num;
float versatz;

int mode = 0;

void setup ()
{
  size (700, 700);
  smooth();

  centerX = width/2;

  parbolHeight = height*0.8;
  parbolWidth = (parbolHeight*0.75);
  scheitelWidth = parbolWidth / 4.0;
  centerY = (int) (height-(height-parbolHeight)/2);
  num = 18;
  versatz = parbolWidth / 5.0;
  scheitelWidthFactor = 0.3333;
}

void draw ()
{
  background (237);

  interaction();
  parabolas();
}

void parabolas ()
{
  float scheitelWidth = parbolWidth*scheitelWidthFactor;

  float steps = scheitelWidth / (float) (num-1);
  float x = 0, y = 0, m = (parbolHeight) /  sq (parbolWidth/2+scheitelWidth/2);

  noFill();
  stroke (#CB2962, 120);
  strokeWeight (2);
  for (int j = 0; j < num; j++)
  {
    float versatzStart =  versatz - ((versatz /  (float) (num-1)) *(j));

    float startX = (j*steps);
    float count =  -parbolWidth/2-startX+scheitelWidth/2+versatzStart;
    float countMax = count + parbolWidth-versatz;

    beginShape(); 

    while (count <= countMax)
    {
      x = centerX + j*steps - scheitelWidth/2 + count;
      y = centerY - m * sq (count);

      vertex (x, y);
      count++;
    }
    endShape();
  }
}

void interaction ()
{
  if (mode == 1)
  {
    parbolHeight = (int) map (mouseY, 0, height, height/2, height*0.95);
    centerY = (int) (height-(height-parbolHeight)/2);
    parbolWidth = (int) map (mouseX, 0, width, width/20, width*0.95);

    fill (0, 15);
    noStroke();
    rect (centerX - parbolWidth/2, centerY-parbolHeight, parbolWidth, parbolHeight);
  }
  else if (mode == 2)
  {
    scheitelWidthFactor = map (mouseX, 0, width, 0.1, 0.9);
    versatz = (int) map (mouseY, 0, height, 0, parbolWidth / 3.0);

    fill (0, 15);
    noStroke();
    rect (centerX - parbolWidth/2, centerY-parbolHeight, parbolWidth, parbolHeight);
    rect (centerX - int (parbolWidth*scheitelWidthFactor)/2, centerY-parbolHeight, int (parbolWidth*scheitelWidthFactor), parbolHeight);

    fill (0, 30);
    rect (centerX - parbolWidth/2, centerY-parbolHeight, versatz, parbolHeight);
    rect (centerX + parbolWidth/2, centerY-parbolHeight, -versatz, parbolHeight);
  }
  else if (mode == 3)
  {
    num = (int) map (mouseX, 0, width, 3, 30) *2;
  }
  else if (mode == 4)
  {
    fill (0, 15);
    noStroke();
    rect (centerX - parbolWidth/2, centerY-parbolHeight, parbolWidth, parbolHeight);
    rect (centerX - int (parbolWidth*scheitelWidthFactor)/2, centerY-parbolHeight, int (parbolWidth*scheitelWidthFactor), parbolHeight);

    fill (0, 30);
    rect (centerX - parbolWidth/2, centerY-parbolHeight, versatz, parbolHeight);
    rect (centerX + parbolWidth/2, centerY-parbolHeight, -versatz, parbolHeight);

    stroke (0, 120);
    line (centerX, centerY, centerX, centerY-parbolHeight);
  }
}

void keyPressed ()
{
  if (key== ' ') mode = 0;
  if (key == '+')
  {
    mode++;
    if (mode > 4) mode = 0;
  }

  if (key == '1') mode = 1;
  if (key == '2') mode = 2;
  if (key == '3') mode = 3;
  if (key == '4') mode = 4;

  if (key == 'p') setup();

  if (key == 's') saveFrame ("export/" + "parabols_####.png");
}


