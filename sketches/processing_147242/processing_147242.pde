
PImage[] scott1 = new PImage[12]; PImage[] scott2 = new PImage[8]; PImage[] envy1 = new PImage[12]; PImage[] envy2 = new PImage[8]; PImage[] gideon1 = new PImage[12];
PImage[] gideon2 = new PImage[8]; PImage[] kim1 = new PImage[12]; PImage[] kim2 = new PImage[8]; PImage[] todd = new PImage[12];
PImage[] stephen1 = new PImage[12]; PImage[] stephen2 = new PImage[8]; int i = 0; int j= 0 ; int k = 390;

void setup(){
  size (400,400);
  frameRate(10);
scott1[0] = loadImage("scott1.png"); scott1[1] = loadImage("scott2.png");scott1[2] = loadImage("scott3.png"); scott1[3] = loadImage("scott4.png"); scott1[4] = loadImage("scott5.png"); scott1[5] = loadImage("scott6.png"); scott1[6] = loadImage("scott1.png");
  scott1[7] = loadImage("scott2.png");scott1[8] = loadImage("scott3.png");scott1[9] = loadImage("scott4.png"); scott1[10] = loadImage("scott5.png");scott1[11] = loadImage("scott6.png");
  stephen1[0] = loadImage("stephen1.png");stephen1[1] = loadImage("stephen2.png");stephen1[2] = loadImage("stephen3.png");stephen1[3] = loadImage("stephen4.png");stephen1[4] = loadImage("stephen5.png");stephen1[5] = loadImage("stephen6.png");
  stephen1[6] = loadImage("stephen7.png");stephen1[7] = loadImage("stephen8.png"); stephen1[8] = loadImage("stephen9.png"); stephen1[9] = loadImage("stephen10.png"); stephen1[10] = loadImage("stephen11.png"); stephen1[11] = loadImage("stephen12.png");
  kim1[0] = loadImage("kim1.png");kim1[1] = loadImage("kim2.png");kim1[2] = loadImage("kim3.png");kim1[3] = loadImage("kim4.png");kim1[4] = loadImage("kim5.png");kim1[5] = loadImage("kim1.png");kim1[6] = loadImage("kim2.png");kim1[7] = loadImage("kim3.png");
  kim1[8] = loadImage("kim4.png");kim1[9] = loadImage("kim5.png");kim1[10] = loadImage("kim1.png");kim1[11] = loadImage("kim2.png");envy1[0] = loadImage("envy1.png"); envy1[1] = loadImage("envy2.png");envy1[2] = loadImage("envy3.png");envy1[3] = loadImage("envy4.png");
  envy1[4] = loadImage("envy5.png");envy1[5] = loadImage("envy6.png");envy1[6] = loadImage("envy1.png");envy1[7] = loadImage("envy2.png");envy1[8] = loadImage("envy3.png");envy1[9] = loadImage("envy4.png");envy1[10] = loadImage("envy5.png");envy1[11] = loadImage("envy6.png");
  gideon1[0] = loadImage("gideon2_0.png"); gideon1[1] = loadImage("gideon2_1.png");gideon1[2] = loadImage("gideon2_2.png"); gideon1[3] = loadImage("gideon2_3.png"); gideon1[4] = loadImage("gideon2_4.png"); gideon1[5] = loadImage("gideon2_5.png"); gideon1[6] = loadImage("gideon2_0.png");
  gideon1[7] = loadImage("gideon2_1.png");gideon1[8] = loadImage("gideon2_1.png");gideon1[9] = loadImage("gideon2_3.png"); gideon1[10] = loadImage("gideon2_4.png");gideon1[11] = loadImage("gideon2_5.png");
  todd[0] = loadImage("todd1.png"); todd[1] = loadImage("todd2.png");todd[2] = loadImage("todd3.png"); todd[3] = loadImage("todd4.png"); todd[4] = loadImage("todd5.png"); todd[5] = loadImage("todd6.png"); todd[6] = loadImage("todd1.png");
  todd[7] = loadImage("todd2.png");todd[8] = loadImage("todd3.png");todd[9] = loadImage("todd4.png"); todd[10] = loadImage("todd5.png");todd[11] = loadImage("todd6.png");
  scott2[0] = loadImage("scott2_1.png"); scott2[1] = loadImage("scott2_2.png");scott2[2] = loadImage("scott2_3.png"); scott2[3] = loadImage("scott2_4.png"); scott2[4] = loadImage("scott2_5.png"); scott2[5] = loadImage("scott2_6.png"); scott2[6] = loadImage("scott2_7.png");
  scott2[7] = loadImage("scott2_8.png"); kim2[0] = loadImage("kim2_1.png");kim2[1] = loadImage("kim2_2.png");kim2[2] = loadImage("kim2_3.png");kim2[3] = loadImage("kim2_4.png");kim2[4] = loadImage("kim2_5.png");kim2[5] = loadImage("kim2_6.png");kim2[6] = loadImage("kim2_7.png");kim2[7] = loadImage("kim2_7.png");
  gideon2[0] = loadImage("gideon1.png"); gideon2[1] = loadImage("gideon2.png");gideon2[2] = loadImage("gideon3.png"); gideon2[3] = loadImage("gideon4.png"); gideon2[4] = loadImage("gideon5.png"); gideon2[5] = loadImage("gideon6.png"); gideon2[6] = loadImage("gideon7.png");
  gideon2[7] = loadImage("gideon8.png"); stephen2[0] = loadImage("stephen2_1.png");stephen2[1] = loadImage("stephen2_2.png");stephen2[2] = loadImage("stephen2_3.png");stephen2[3] = loadImage("stephen2_4.png");stephen2[4] = loadImage("stephen2_5.png");stephen2[5] = loadImage("stephen2_6.png");
  stephen2[6] = loadImage("stephen2_1.png");stephen2[7] = loadImage("stephen2_2.png");envy2[0] = loadImage("envy2_1.png"); envy2[1] = loadImage("envy2_2.png");envy2[2] = loadImage("envy2_1.png");envy2[3] = loadImage("envy2_2.png");
  envy2[4] = loadImage("envy2_1.png");envy2[5] = loadImage("envy2_2.png");envy2[6] = loadImage("envy2_1.png");envy2[7] = loadImage("envy2_2.png");
}

void draw() 
{  
   
  j +=1;
   if (j < 60)
    { 
     
       if (i< scott1.length)
    {  
      Scene1(i);
      i++;
     if (i == 12)
    {
      i = 0;
    }
    }
    }
      if (j >= 60 && j<86)
    { 
      if (i< scott1.length)
      {  
      Scene2(i, k);
      i++;
      k -=5;
      }
      if (i == scott1.length)
      {i = 0;}
    }

      if (j >= 86 && j < 120)
      {
          Scene3(i);
      i++;
      if (i == scott2.length)
      {i = 0;}
      }
      }


void Scene1 (int x)
{
  background (random(255));
  pushMatrix();
  image(kim1[x],130,210);
  popMatrix();
  image(stephen1[x], 100,230);
  image(scott1[x], 200,220);
  
}

void Scene2 (int x, int y)
{
  background (random(255));
  pushMatrix();
  image(kim1[x],130,210);
  image(todd[x], y,170);
  popMatrix();
  image(stephen1[x], 100,230);
  image(scott1[x], 200,220);
  image(envy1[x], y,230);
  image(gideon1[x], y, 230);
}
void Scene3 (int x)
{
  background (random(255));
  pushMatrix();
  image(kim2[x],130,210);
  image(todd[x], 260,160);
  popMatrix();
  image(stephen2[x], 100,230);
  image(scott2[x], 150,220);
  image(envy2[x], 270,215);
  image(gideon2[x], 240,215);
}


