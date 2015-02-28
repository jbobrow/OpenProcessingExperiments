
int changingWeight, counter, rectSize, loopNum = 1;
float timer, scaleVal, alphaVal;
PImage[] images;
PImage escher;



void setup()
{
  size(400, 400);
  
  changingWeight = 1;
  counter = 1;
  rectSize = 5;
  timer = 0.0;
  scaleVal = 1.0;
  alphaVal = 255;
  images = new PImage[36];
  
  images[0] = requestImage("img1.jpg");
  images[1] = requestImage("img2.jpg");
  images[2] = requestImage("img3.jpg");
  images[3] = requestImage("img4.jpg");
  images[4] = requestImage("img5.jpg");
  images[5] = requestImage("img6.jpg");
  images[6] = requestImage("img7.jpg");
  images[7] = requestImage("img8.jpg");
  images[8] = requestImage("img9.jpg");
  images[9] = requestImage("img10.jpg");
  images[10] = requestImage("img11.jpg");
  images[11] = requestImage("img12.jpg");
  images[12] = requestImage("img13.jpg");
  images[13] = requestImage("img14.jpg");
  images[14] = requestImage("img15.jpg");
  images[15] = requestImage("img16.jpg");
  images[16] = requestImage("img17.jpg");
  images[17] = requestImage("img18.jpg");
  images[18] = requestImage("img19.jpg");
  images[19] = requestImage("img20.jpg");
  images[20] = requestImage("img21.jpg");
  images[21] = requestImage("img22.jpg");
  images[22] = requestImage("img23.jpg");
  images[23] = requestImage("img24.jpg");
  images[24] = requestImage("img25.jpg");
  images[25] = requestImage("img26.jpg");
  images[26] = requestImage("img27.jpg");
  images[27] = requestImage("img28.jpg");
  images[28] = requestImage("img29.jpg");
  images[29] = requestImage("img30.jpg");
  images[30] = requestImage("img31.jpg");
  images[31] = requestImage("img32.jpg");
  images[32] = requestImage("img33.jpg");
  images[33] = requestImage("img34.jpg");
  images[34] = requestImage("img35.jpg");
  images[35] = requestImage("img36.jpg");
  
  escher = requestImage("escher.jpg");
}

void draw()
{
  timer += 1;
  strokeWeight(1);
  colorMode(RGB, 255);
  noStroke();
  noFill();
  tint(#FFFFFF, alphaVal);
  
  if(timer < 600)
  {
    for(int x = 0; x < width; x+=5)
    {
      for(int y = 0; y < height; y+=5)
      {
        fill(random(0, 255));
        rect(x, y, 5, 5);
      }
    }
  }
  
  if(timer > 200 && counter < 500)
  {
    strokeWeight(changingWeight);
    stroke(0);
    line(0, 0, width, height);
    changingWeight += 2;
  }
  
  if(timer > 500 && timer < 570)
  {
    frameRate(2);
    noStroke();
    fill(random(0, 255), random(0, 255), random(0, 255));
    rect(0, 0, width, height);
  }
  
  if(timer > 510 && timer < 1000)
  {
    drawArray(images, counter);
    counter++;
  }
  
  if(timer > 950)
  {
    image(escher, 65, 0, 269, 400);
  }
  
  if(timer > 555)
  {
    frameRate(60);
    strokeWeight(1);
    colorMode(HSB, 100);
    fill(timer%100, 90, 75);
    
    if(rectSize <= 430)
    {
      rect(0, 0, rectSize, rectSize);
      rectSize += 1;
    }
    
    else
    {
      pushMatrix();
      scale(scaleVal);
      rect(0, 0, rectSize, rectSize);
      popMatrix();
      scaleVal -= 0.005;
    }
  }
  
  if(timer > 1300 && timer < 1380)
  {
    image(escher, 65, 0, 269, 400);
    if(alphaVal > 0)
    {
      alphaVal -= 5;
    }
  }
  
  if(timer >= 1400)
  {
    loopNum++;
    setup();
  }
}
void drawArray(PImage[] array, int counter)
{
  int yVal = 344;
  int xVal = 344;
  for(int c = 0; c < counter && c < array.length; c++)
  {
    if(c != 0 && c % 6 == 0)
    {
      yVal -= 68;
      xVal = 344;
    }
      
    image(array[c], xVal, yVal, 66, 66);
    
    xVal -= 68;
  }
}


