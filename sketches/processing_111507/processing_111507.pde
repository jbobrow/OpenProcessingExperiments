
PImage photo;
PImage maskPhoto;
boolean filterApplied = false, white = false;
int firstX = 40, bottomY = 320, heightLimit = 180, baseHeight = 70;
int firstHeight = baseHeight, secondHeight = baseHeight + 20, thirdHeight = baseHeight + 40, 
  fourthHeight = baseHeight + 30, fifthHeight = baseHeight + 10, sixthHeight = baseHeight + 50;

void setup()
{
  size(640, 480);
  photo = requestImage("photo.png");
  maskPhoto = requestImage("maskPhoto.png");
  frameRate(30);
}

void draw()
{
  strokeWeight(1);
  stroke(0);
  //println(mouseX + "," + mouseY);
  
  //background
  for(int x = 0; x < width; x+= 20)
  {
    white = !white;
    for(int y = 0; y < height; y += 20)
    {
      if(white)
      {
        fill(17, 57, 5);
        white = !white;
      }
      
      else if(!white)
      {
        fill(15, 9, 2);
        white = !white;
      }
      
      rect(x, y, 20, 20);
    }
  }
  
  //photos
  if(maskPhoto.width > 0 && photo.width > 0)
  {
    if(!filterApplied)
    {
      maskPhoto.filter(BLUR, 3);
      photo.filter(POSTERIZE, 8);  
      filterApplied = true;
    }
    
    image(photo, 0, 0);
    image(maskPhoto, 0, 0);
  }
  
  //chaos side
  fill(201, 22, 12);
  bezier(400, 290, random(450, 500), random(280, 250), random(430, 510), random(240, 200),
    random(420, 520), random(210, 160));
  bezier(490, 330, random(460, 520), random(350, 280), random(450, 530), random(300, 230),
    random(440, 540), random(250, 170));
  
  fill(234, 228, 33);
  bezier(460, 250, random(440, 480), random(220, 180), random(430, 490), random(170, 110),
    random(420, 500), random(120, 70));
  bezier(553, 323, random(520, 580), random(300, 240), random(510, 590), random(260, 200),
    random(500, 600), random(190, 150));
  
  fill(222, 101, 31);
  bezier(400, 347, random(350, 450), random(330, 310), random(320, 480), random(300, 280),
    random(280, 500), random(270, 200));
  bezier(530, 200, random(500, 550), random(190, 130), random(490, 560), random(160, 100), 
    random(480, 570), random(110, 80));
  
  strokeWeight(3);
  stroke(201, 22, 12);
  fill(201, 22, 12);
  line(random(360, 380), random(210, 230), random(370, 400), random(200, 240));
  line(random(400, 420), random(310, 330), random(400, 450), random(290, 320));
  rect(random(350, 550), random(170, 250), random(10, 20), random(10, 20));
  
  stroke(234, 228, 33);
  fill(234, 228, 33);
  line(random(500, 520), random(200, 230), random(500, 530), random(180, 240));
  rect(random(350, 550), random(170, 310), random(10, 16), random(10, 16));
  rect(random(350, 550), random(170, 310), random(7, 10), random(7, 10));
  
  stroke(222, 101, 31);
  fill(222, 101, 31);
  line(random(410, 430), random(190, 210), random(400, 440), random(160, 190));
  rect(random(350, 550), random(170, 310), random(7, 10), random(7, 10));
  
  
  //order side
  stroke(0);
  fill(18, 30, 129);
  rect(firstX, bottomY, 10, -firstHeight);
  rect(firstX +20, bottomY, 10, -secondHeight);
  rect(firstX +40, bottomY, 10, -thirdHeight);
  rect(firstX +60, bottomY, 10, -fourthHeight);
  rect(firstX +80, bottomY, 10, -fifthHeight);
  rect(firstX + 100, bottomY, 10, -sixthHeight);
  
  firstHeight += 10;
  secondHeight += 10;
  thirdHeight += 10;
  fourthHeight += 10;
  fifthHeight += 10;
  sixthHeight += 10;
  
  if(firstHeight >= heightLimit)
  {
    firstHeight = baseHeight;
  }
  
  if(secondHeight >= heightLimit)
  {
    secondHeight = baseHeight;
  }
  
  if(thirdHeight >= heightLimit)
  {
    thirdHeight = baseHeight;
  }
  
  if(fourthHeight >= heightLimit)
  {
    fourthHeight = baseHeight;
  }
  
  if(fifthHeight >= heightLimit)
  {
    fifthHeight = baseHeight;
  }
  
  if(sixthHeight >= heightLimit)
  {
    sixthHeight = baseHeight;
  }
    
}


