
//data
float [] boy2 = {90.2, 91.4, 86.4, 87.6, 86.7, 88.1, 82.2, 83.8, 91,
                 87.4, 84.2, 88.4, 87.7, 89.6, 91.4, 90, 86.4, 90,
                 91.4, 81.3, 90.6, 92.2, 87.1, 91.4, 89.7, 92.2}; 
float [] boy9 = {139.4, 144.3, 136.5, 135.4, 128.9, 136, 128.5,
                 133.2, 145.6, 132.4, 133.7, 138.3, 134.6, 139,
                 146, 133.2, 133.3, 130.3, 144.5, 125.4, 135.8,
                 139.9, 136.8, 140.6, 138.6, 140};
float [] boy18 = {179, 195.1, 183.7, 178.7, 171.5, 181.8, 172.5,
                  174.6, 190.4, 173.8, 172.6, 185.2, 178.4, 177.6,
                  183.5, 178.1, 177, 172.9, 188.4, 169.4, 180.2,
                  189, 182.4, 185.8, 180.7, 178.7};
float [] girl2 = {83.8, 86.2, 85.1, 88.6, 83, 88.9, 89.7, 81.3,
                  88.7, 88.4, 85.1, 91.4, 86.1, 94, 82.2, 88.2,
                  87.5, 88.6, 86.9, 86.4, 80.9, 90, 94, 89.7,
                  86.4, 86.4};
float [] girl9 = {136.5, 137, 129, 139.4, 125.6, 137.1, 133.6,
                  121.4, 133.6, 134.1, 139.4, 138.1, 138.4, 139.5,
                  129.8, 144.8, 138.9, 140.3, 143.8, 133.6, 123.5,
                  139.9, 136.1, 135.8, 131.9, 130.9};
float [] girl18 = {169.6, 166.8, 157.1, 181.1, 158.4, 165.6, 166.7,
                   156.5, 168.1, 165.3, 163.7, 173.7, 169.2, 170.1,
                   164.2, 176, 170.9, 169.2, 172, 163, 154.5, 172.5,
                   175.6, 167.2, 164, 161.6};

//slider
float sX, sY, sWd, sHt;
float sliderX, sliderY;

//info
float boy2sum, girl2sum;
float boy2avg, girl2avg;
float boy9sum, girl9sum;
float boy9avg, girl9avg;
float boy18sum, girl18sum;
float boy18avg, girl18avg;

//images
PImage [] pics = new PImage [6];

//info
float txtX, txtY;

void setup()
{
  size(600, 800);
  
  sX = width*.2;
  sY = height*.87;
  sWd = width*.6;
  sHt = height*.05;
  
  for(int i = 0; i < pics.length; i++)
  {
    pics[i] = loadImage(i + ".png");
  }
  sliderX = sX;
}

void draw()
{
  background(80);
  
  prepSlider();
  data();
  info();
}

void prepSlider()
{
  if(mouseY > height*.87 && mouseY < height*.93)
  {
    sliderX = constrain(mouseX, sX, sWd+sX);
  }
  noStroke();
  fill(70);
  rect(sX, sY, sWd, sHt);
  
  strokeWeight(2);
  stroke(80);
  line(sX + sWd*.333, sY, sX + sWd*.333, sY + sHt);
  line(sX + sWd*.667, sY, sX + sWd*.667, sY + sHt);
  
  noStroke();
  fill(120);
  ellipse(sliderX, sY + sHt*.5, sHt, sHt);
}

void info()
{
  textSize(40);
  text("Average Height:", width*.25, height*.12);
  text("Boys vs. Girls", width*.28, height*.17);
  
  //stroke(50);
  //line(0, height*.75, width, height*.75);
  
  if(sliderX >= sX && sliderX < sX + sWd*.333)  //height: 2px = 1cm
  {
    image(pics[0], 120, 373, (boy2avg*2)*pics[0].width / pics[0].height, boy2avg*2);
    image(pics[3], 330, 375, (girl2avg*2)*pics[3].width / pics[3].height, girl2avg*2);
    textSize(36);
    text("02 Years Old", width*.3, height*.8);
    textSize(24);
    text(int(boy2avg) + " " + "cm", width*.3, height*.85);
    text(int(girl2avg) + " " + "cm", width*.53, height*.85);
  }
  if(sliderX >= sX + sWd*.333 && sliderX < sX + sWd*.667)
  {
    image(pics[1], 110, 276, boy9avg*2*pics[1].width / pics[1].height, boy9avg*2);
    image(pics[4], 330, 278, girl9avg*2*pics[4].width / pics[4].height, girl9avg*2);
    textSize(36);
    text("09 Years Old", width*.3, height*.8);
    textSize(24);
    text(int(boy9avg) + " " + "cm", width*.3, height*.85);
    text(int(girl9avg) + " " + "cm", width*.53, height*.85);
  }
  if(sliderX >= sX + sWd*.667 && sliderX <= sX + sWd)
  {
    image(pics[2], 80, 190, boy18avg*2*pics[2].width / pics[2].height, boy18avg*2);
    image(pics[5], 310, 217, girl18avg*2*pics[5].width / pics[5].height, girl18avg*2);
    textSize(36);
    text("18 Years Old", width*.3, height*.8);
    textSize(24);
    text(int(boy18avg) + " " + "cm", width*.3, height*.85);
    text(int(girl18avg) + " " + "cm", width*.53, height*.85);
  }
  
  textSize(10);
  text("height of boys and girls born in Berkeley, CA between January 1928 and June 1929", width*.16, height*.98);
}

void data()
{
  boy2sum = 0;
  girl2sum = 0;
  boy9sum = 0;
  girl9sum = 0;
  boy18sum = 0;
  girl18sum = 0;
  
  for(int i = 0; i < boy2.length; i++)
  {
    boy2sum += boy2[i];
    girl2sum += girl2[i];
    boy9sum += boy9[i];
    girl9sum += girl9[i];
    boy18sum += boy18[i];
    girl18sum += girl18[i];
  }
  
  boy2avg = boy2sum / boy2.length;
  girl2avg = girl2sum / girl2.length;
  boy9avg = boy9sum / boy9.length;
  girl9avg = girl9sum / boy2.length;
  boy18avg = boy18sum / boy2.length;
  girl18avg = girl18sum / boy2.length;
}



