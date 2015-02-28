
float[] boxx = new float[11]; // Variables for the menu
float boxxmultiple = 100;
int boxy = 350;
boolean[] d = new boolean[11];
boolean menu = true;
int count = 0;


int point0x = 600;  // Dimension 0 variables
int point0y = 350;

int point1x = 450;  // Dimension 1 variables
int point2x = 450;
int point1y = 350;
int point2y = 350;
boolean lineFollow = false;

int square1x = 450;  // Dimension 2 variables
int square2x = 750;
int square3x = 450;
int square4x = square3x + 300;
int square1y = 500;
int square2y = 500;
int square3y = 500;
int square4y = square3y;
boolean squareFollow = false;

int box1x = 350;  // Dimension 3 variables
int box2x = box1x + 300;
int box3x = box1x;
int box4x = box1x + 300;
int box1y = 600;
int box2y = box1y;
int box3y = box1y - 300;
int box4y = box1y - 300;
boolean boxFollow = false;

PImage b;  // Dimension 4 variables
PImage c;
PImage t;
PImage m;
PImage o;
int timex = 200;
int timey = 400;
boolean timeFollow = false;

PImage chef;  // Dimension 5 variables
PImage musician;
PImage scientist;
int lifex = 400;
int lifey = 400;
boolean NE = false;
boolean E = false;
boolean SE = false;
int cheftimer = 0;

int pathx = 600;  // Dimension 6 variables
int pathy = 400;
boolean NW = false;
boolean NE6 = false;
boolean SW = false;
boolean SE6 = false;
boolean up = false;
boolean down = false;

int w = 2000;  // Dimension 7 variables
int h = 2000;
boolean play = false;

boolean sources = false;  // "Sources" screen

float ix = random (30,1170);  // Background animation
float iy = random (-30,-700);
float ispeed = random (.1,.4);
float it = random (60,130);
float pix = random (30,1170);
float piy = random (-30,-700);
float pispeed = random (.1,.4);
float pit = random (60,130);
float ex = random (30,1170);
float ey = random (-30,-700);
float espeed = random (.1,.4);
float et = random (60,130);
float sqx = random (30,1170);
float sqy = random (-30,-700);
float sqspeed = random (.1,.4);
float sqt = random (60,130);
float pmx = random (30,1170);
float pmy = random (-30,-700);
float pmspeed = random (.1,.4);
float pmt = random (60,130);
float gx = random (30,1170);
float gy = random (-30,-700);
float gspeed = random (.1,.4);
float gt = random (60,130);


void setup()
{
  size (1200,700);  // General settings
  textAlign (CENTER);
  rectMode (CENTER); 
  imageMode (CENTER);
  smooth();
  noStroke();
  textFont (createFont("Square721 BT",30));
  frameRate (80);

  boxx[0] = boxxmultiple * 1;  // Sets spacing between menu boxes
  boxx[1] = boxxmultiple * 2;
  boxx[2] = boxxmultiple * 3;
  boxx[3] = boxxmultiple * 4;
  boxx[4] = boxxmultiple * 5;
  boxx[5] = boxxmultiple * 6;
  boxx[6] = boxxmultiple * 7;
  boxx[7] = boxxmultiple * 8;
  boxx[8] = boxxmultiple * 9;
  boxx[9] = boxxmultiple * 10;
  boxx[10] = boxxmultiple * 11;

  b = loadImage ("Baby.jpg");  // Loads images for dimension 4
  c = loadImage ("Child.jpg");
  t = loadImage ("Teen.jpg");
  m = loadImage ("Man.jpg");
  o = loadImage ("OldMan.jpg");

  chef = loadImage ("Chef.jpg");  // Loads images for dimension 5
  musician = loadImage ("Musician.jpg");
  scientist = loadImage ("Scientist.jpg");
}

void draw()
{
  background (100,149,237);

  for (int i = 0; i < boxx.length; i++)  {
    if (menu == true)  {  // Menu stuff
      textSize (30);
      rect (boxx[i],boxy,70,70);
      fill (100,149,237);
      text (i,boxx[i],boxy + 9);
      fill (255);
      if (mouseX >= boxx[i] - 35 && mouseX <= boxx[i] + 35 && mouseY >= boxy - 35 && mouseY <= boxy + 35)  {  // Graphics
        fill (100,149,237);
        rect (boxx[i],boxy,70,70);
        fill (255);
        text (i,boxx[i],boxy + 9);
      }
      
      rect (600,435,110,40);
      fill (100,149,237);
      textSize (20);
      text ("Sources",600,442);
      fill (255);
      stroke (255);
      line (130,420,180,470);
      line (130,420,140,420);
      line (130,420,130,430);
      noStroke();
      text ("Start Here",200,500);
      if (mouseX >= 545 && mouseX <= 655 && mouseY >= 415 && mouseY <= 455)  {
        fill (100,149,237);
        rect (600,435,110,40);
        fill (255);
        textSize (20);
        text ("Sources",600,442);
        fill (255);
      }
      
      textSize (it);
      text ("∞",ix,iy);
      iy += ispeed;
      if (iy >= 780)  {
        ix = random (30,1170);
        iy = random (-30,-700);
        ispeed = random (.1,.4);
        it = random (60,130);
      }
      textSize (pit);
      text ("π",pix,piy);
      piy += pispeed;
      if (piy >= 780)  {
        pix = random (30,1170);
        piy = random (-30,-700);
        pispeed = random (.1,.4);
        pit = random (60,130);
      }
      textSize (et);
      text ("∑",ex,ey);
      ey += espeed;
      if (iy >= 780)  {
        ex = random (30,1170);
        ey = random (-30,-700);
        espeed = random (.1,.4);
        et = random (60,130);
      }
      textSize (sqt);
      text ("√",sqx,sqy);
      sqy += sqspeed;
      if (sqy >= 780)  {
        sqx = random (30,1170);
        sqy = random (-30,-700);
        sqspeed = random (.1,.4);
        sqt = random (60,130);
      }
      textSize (pmt);
      text ("±",pmx,pmy);
      pmy += pmspeed;
      if (pmy >= 780)  {
        pmx = random (30,1170);
        pmy = random (-30,-700);
        pmspeed = random (.1,.4);
        pmt = random (60,130);
      }
      textSize (gt);
      text ("≥",gx,gy);
      gy += gspeed;
      if (gy >= 780)  {
        gx = random (30,1170);
        gy = random (-30,-700);
        gspeed = random (.1,.4);
        gt = random (60,130);
      }
     
      textSize (30);
      text ("Visualizing the Dimensions",600,100);
      textSize (20);
      text ("Created by Trevor Phillips",600,600);
    }
  }

  if (d[0] == true)  {  // This is what happens for each dimension
    background (100,149,237);
    count = 0;
    textSize (30);
    text ("Dimension 0",600,100);
    ellipse (point0x,point0y,7,7);
    stroke (255);
    line (585,365,535,415);
    line (585,365,565,365);
    line (585,365,585,385);
    textSize (15);
    text ("Point A",535,432);
    textSize (20);
    text ("Dimension 0 is a point.  A point is",270,230);
    text ("infinitely small and technically",270,280); 
    text ("has no height or length.",270,330);
    text ("The point here is labeled as Point A.  It will",930,470);
    text ("be the starting point for dimensions to come.",930,520);
    noStroke();
  }
  if (d[1] == true)  {
    background (100,149,237);
    count = 1;
    textSize (30);
    text ("Dimension 1",600,100);
    ellipse (point1x,point1y,7,7);
    ellipse (point2x,point2y,7,7);
    stroke (255);
    textSize (15);
    text ("drag",450,385);
    text ("A",450,337);
    if (point2x >= 460)  {
      text ("B",point2x,337);
    }
    textSize (20);
    text ("The first dimension is a line.  It stretches on in both directions forever.",600,480);
    text ("A line has no width.",600,530);
    textSize (16.5);
    text ("To move an object into a higher dimension,",270,170);
    text ("you have to 'drag' it.  So, take Point A and",270,200);
    text ("drag it to move it into the first dimension.",270,230);
    line (480,380,550,380);
    line (550,380,540,370);
    line (550,380,540,390);
    line (point1x,point1y,point2x,point2y);

    if (lineFollow == true)  {
      stroke (255);
      if (mouseX <= 750 && mouseX >= 450)  {
        point2x = mouseX;
        line (point1x,point1y,point2x,point2y);
        ellipse (point2x,point2y,7,7);
      } 
    }
    noStroke();
  }
  if (d[2] == true)  {
    background (100,149,237);
    count = 2;
    textSize (30);
    text ("Dimension 2",600,100);
    ellipse (square1x,square1y,7,7);
    ellipse (square2x,square2y,7,7);
    ellipse (square3x,square3y,7,7);
    ellipse (square4x,square4y,7,7);
    stroke (255);
    line (600,530,600,620);
    line (600,530,590,540);
    line (600,530,610,540);
    textSize (15);
    text ("drag",600,645);
    text ("A",square1x - 12,square1y + 10);
    text ("B",square2x + 12,square2y + 10);
    textSize (20);
    text ("Drag line segment AB to create a",260,270);
    text ("2-dimensional figure.",260,300);
    text ("The second dimension is a plane,",260,330);
    text ("and the figure you created",260,360);
    text ("exists on this plane.",260,390);
    text ("A plane can only specify objects",260,420);
    text ("with length and width.",260,450);
    if (square3y <= 490)  {
      textSize (15);
      text ("C",square4x + 9,square4y - 7);
      text ("D",square3x - 9,square3y - 7);
    }
    line (square1x,square1y,square2x,square2y);
    line (square1x,square1y,square3x,square3y);
    line (square2x,square2y,square4x,square4y);
    line (square3x,square3y,square4x,square4y);

    if (squareFollow == true)  {
      stroke (255);
      if (mouseY <= 500 && mouseY >= 200)  {
        square3y = mouseY; 
        square4y = square3y;
        ellipse (square3x,square3y,7,7);
        ellipse (square4x,square4y,7,7);
        line (square1x,square1y,square3x,square3y);
        line (square2x,square2y,square4x,square4y);
        line (square3x,square3y,square4x,square4y);
      } 
    }
    noStroke();
  }
  if (d[3] == true)  {
    background (100,149,237);
    count = 3;
    textSize (30);
    text ("Dimension 3",600,100);
    stroke (255);
    line (330,450,280,500);
    line (330,450,320,450);
    line (330,450,330,460);
    textSize (15);
    text ("drag",270,520);
    text ("length",197,330);
    text ("height",197,355);
    text ("width",197,380);
    textSize (15);
    text ("The third dimension has length, width, and height.",1000,305);
    text ("We humans live in this dimension.",1000,335);
    text ("Click and drag inside the square to create a",1000,365);
    text ("figurative 3-dimensional figure.",1000,395);
    stroke (255,0,0);
    line (350,600,650,600);
    stroke (255);
    line (350,600,350,300);
    stroke (0,255,0);
    line (650,600,650,300);
    stroke (255);
    line (350,300,650,300);
    line (box1x,box1y,box2x,box2y);
    line (box1x,box1y,box3x,box3y);
    line (box2x,box2y,box4x,box4y);
    line (box3x,box3y,box4x,box4y);
    line (350,600,box1x,box1y);
    stroke (255,255,0);
    line (650,600,box2x,box2y);
    stroke (255);
    line (350,300,box3x,box3y);
    line (650,300,box4x,box4y);
    ellipse (350,600,7,7);
    ellipse (350,300,7,7);
    ellipse (650,300,7,7);
    ellipse (650,600,7,7);
    ellipse (box1x,box1y,7,7);
    ellipse (box2x,box2y,7,7);
    ellipse (box3x,box3y,7,7);
    ellipse (box4x,box4y,7,7);
    
    fill (255,0,0);
    noStroke();
    rect (150,325,30,20);
    fill (0,255,0);
    rect (150,350,30,20);
    fill (255,255,0);
    rect (150,375,30,20);

    if (boxFollow == true)  {
      stroke (255);
      if (mouseX >= 500 && mouseX <= 650 && mouseY >= 300 && mouseY <= 450)  {
        box2x = box1x + 300;
        box3x = box1x;
        box4x = box1x + 300;
        box2y = box1y;
        box3y = box1y - 300;
        box4y = box1y - 300;
        box1x = mouseX - 150;
        box1y = mouseY + 150;
        line (box1x,box1y,box2x,box2y);
        line (box1x,box1y,box3x,box3y);
        line (box2x,box2y,box4x,box4y);
        line (box3x,box3y,box4x,box4y);
        line (350,600,box1x,box1y);
        stroke (255,255,0);
        line (650,600,box2x,box2y);
        stroke (255);
        line (350,300,box3x,box3y);
        line (650,300,box4x,box4y);
        fill (255);
        ellipse (box1x,box1y,7,7);
        ellipse (box2x,box2y,7,7);
        ellipse (box3x,box3y,7,7);
        ellipse (box4x,box4y,7,7);
        ellipse (650,600,7,7);
      }
      noStroke();
    }
  }
  if (d[4] == true)  {
    count = 4;
    background (100,149,237);
    textSize (30);
    text ("Dimension 4",600,100);
    stroke (255);
    textSize (15);
    text ("drag",200,440);
    textSize (16.5);
    text ("Click and drag the point to 'travel through time' in the fourth dimension.",600,200);
    textSize (20);
    text ("The new variable added in the fourth dimension is time.",600,500);
    text ("It is thought that if a person lived in the fourth dimension, he could",600,550);
    text ("travel through his very own time tunnel that started when he was",600,600);
    text ("a baby and ended when he died.",600,650);
    line (230,435,300,435);
    line (300,435,290,425);
    line (300,435,290,445);
    line (200,400,1000,400);
    line (200,385,200,415);
    line (1000,385,1000,415);
    line (400,390,400,410);
    line (600,390,600,410);
    line (800,390,800,410);
    ellipse (timex,timey,7,7);
    if (timeFollow == true && mouseX >= 200 && mouseX <= 1000)  {
      timex = mouseX;
      ellipse (timex,timey,7,7);
    }
    if (timex >= 200 && timex <= 300)  {
      image (b,timex,timey - 70,100,100);
    }
    if (timex > 300 && timex <= 500)  {
      image (c,timex,timey - 80,100,125);
    }
    if (timex > 500 && timex <= 700)  {
      image (t,timex,timey - 70,150,100);
    }
    if (timex > 700 && timex <= 900)  {
      image (m,timex,timey - 85,92,135);
    }
    if (timex > 900 && timex <= 1100)  {
      image (o,timex,timey - 88,90,135);
    }
    noStroke();
  }
  if (d[5] == true)  {
    background (100,149,237);
    count = 5;
    textSize (30);
    text ("Dimension 5",600,100);
    stroke (255);
    
    textSize (17);
    text ("While the fourth dimension has only your",250,200);
    text ("current lifespan, the fifth dimension",250,230);
    text ("contains all of the possible paths your life can take.",250,260);
    text ("In an alternate lifespan, you could have a different name-",250,290); 
    text ("or you could be an astronaut,",250,320);
    text ("or even the President!",250,350);
    text ("Click on each picture to see",950,200);
    text ("possible paths your life could take",950,230);
    text ("in the fifth dimension.",950,260);
    textSize (15);
    text ("click",900,403);
    line (870,400,770,400);
    line (770,400,780,410);
    line (770,400,780,390);
    line (870,380,800,310);
    line (800,310,800,320);
    line (800,310,810,310);
    line (870,420,800,490);
    line (800,490,800,480);
    line (800,490,810,490);
    
    line (400,400,600,400);
    line (400,400,570,230);
    line (400,400,570,570);
    ellipse (600,400,7,7);
    ellipse (570,230,7,7);
    ellipse (570,570,7,7);
    ellipse (lifex,lifey,7,7);
    image (chef,680,400,100,100);
    image (musician,650,230,100,100);
    image (scientist,650,570,100,100);
    textSize (14);
    text ("chef",680,463);
    text ("musician",650,293);
    text ("scientist",650,633);
    textSize (20);
    text ("you",370,405);
    if (NE == true && lifex <= 570)  {
      fill (0,255,0);
      ellipse (570,230,7,7);
      fill (255);
      lifex += 3;
      lifey -= 3;
    }
    if (E == true && lifex <= 600)  {
      fill (0,255,0);
      ellipse (600,400,7,7);
      fill (255);
      lifex += 3;
      lifey = 400;
    }
    if (SE == true && lifex <= 570)  {
      fill (0,255,0);
      ellipse (570,570,7,7);
      fill (255);
      lifex += 3;
      lifey += 3;
    }

    if (cheftimer <= 10)  {
      cheftimer += 1;
    }

    noStroke();
  }
  if (d[6] == true)  {
    background (100,149,237);
    count = 6;
    textSize (30);
    text ("Dimension 6",600,100);
    stroke (255);
    textSize (20);
    text ("Now, in the sixth dimension, it is possible",250,200);
    text ("to jump directly from one lifespan to the other.",250,230);
    text ("This was not possible in the fifth dimension.",250,260);
    text ("6-Dimensional shapes have also helped",250,500);
    text ("scientists solve complicated",250,530);
    text ("mathematical problems.",250,560);
    textSize (17);
    text ("Click on each picture to jump",950,200);
    text ("from one life to another",950,230);
    text ("in the sixth dimension.",950,260);
    textSize (15);
    text ("click",900,403);
    line (870,400,770,400);
    line (770,400,780,410);
    line (770,400,780,390);
    line (870,380,800,310);
    line (800,310,800,320);
    line (800,310,810,310);
    line (870,420,800,490);
    line (800,490,800,480);
    line (800,490,810,490);
    
    line (400,400,600,400);
    line (400,400,570,230);
    line (400,400,570,570);

    line (600,400,570,230);
    line (600,400,570,570);
    line (570,230,570,570);

    ellipse (600,400,7,7);
    ellipse (570,230,7,7);
    ellipse (570,570,7,7);
    image (chef,680,400,100,100);
    image (musician,650,230,100,100);
    image (scientist,650,570,100,100);
    textSize (14);
    text ("chef",680,463);
    text ("musician",650,293);
    text ("scientist",650,633);
    textSize (20);
    text ("you",370,405);
    fill (0,255,0);
    stroke (0,255,0);
    line (400,400,pathx,pathy);
    stroke (255);
    ellipse (pathx,pathy,7,7);
    fill (255);
    ellipse (400,400,7,7);

    if (NW == true && pathy > 229)  {
      pathx -= 1;
      pathy -= 180/30;
    }
    if (pathy <= 230)  {
      pathy = 230;
      pathx = 570;
    }
    if (NE6 == true)  {
      pathx += 1;
      pathy -= 180/30;
    }
    if (pathy < 400 && NE6 == true)  {
      pathy = 400;
      pathx = 600;
    }
    if (SW == true && pathy < 570)  {
      pathx -= 1;
      pathy += 180/30;
    }
    if (SW == true && pathy == 570)  {
      pathx = 570;
    }
    if (SE6 == true && pathy < 400 && NE6 == false)  {
      pathx += 1;
      pathy += 180/30;
    }
    if (pathy >= 400 && up == false && down == false && NE6 == false && SW == false)  {
      pathy = 400;
      pathx = 600;
    }
    if (up == true && pathy > 230 && SW == false)  {
      pathy -= 180/30;
    }
    if (down == true && pathy < 571 && SW == false)  {
      pathy += 180/30;
    }
    if (pathy > 570)  {
      pathy = 570;
    }

    if (cheftimer <= 10)  {
      cheftimer += 1;
    }

    noStroke();
  }
  if (d[7] == true)  {
    background (100,149,237);
    count = 7;
    textSize (30);
    text ("Dimension 7",600,100);
    stroke (255);
    if (play == false)  {
      line (400,400,600,400);
      line (400,400,570,230);
      line (400,400,570,570);
      line (600,400,570,230);
      line (600,400,570,570);
      line (570,230,570,570);
      ellipse (600,400,7,7);
      ellipse (570,230,7,7);
      ellipse (570,570,7,7);
      ellipse (400,400,7,7);
      image (chef,680,400,100,100);
      image (musician,650,230,100,100);
      image (scientist,650,570,100,100);
      textSize (14);
      text ("chef",680,463);
      text ("musician",650,293);
      text ("scientist",650,633);
      textSize (20);
      text ("you",370,405);
      text ("To understand the seventh dimension,",250,180);
      text ("you must treat the",250,210);
      text ("sixth dimension as a single point.",250,240);
      text ("Similar to the first",250,270);
      text ("dimension, you have to drag this",250,300);
      text ("point to create the seventh dimension.",250,330);
    }
    if (mouseX >= 390 && mouseX <= 470 && mouseY >= 545 && mouseY <= 575)  {
      fill (100,149,237);
      noStroke();
      rect (430,560,80,30);
      textSize (20);
      fill (255);
      text ("PLAY",430,567);
      stroke (255);
      fill (255);
    }  
    else  {
      fill (255);
      rect (430,560,80,30);
      textSize (20);
      fill (100,149,237);
      text ("PLAY",430,567);
      fill (255);
    }
    if (play == true)  {
      if (mouseX >= 390 && mouseX <= 470 && mouseY >= 545 && mouseY <= 575)  {
        fill (100,149,237);
        noStroke();
        rect (430,560,80,30);
        textSize (20);
        fill (255);
        text ("RESET",430,567);
        stroke (255);
        fill (255);
      }  
      else  {
        fill (255);
        rect (430,560,80,30);
        textSize (20);
        fill (100,149,237);
        text ("RESET",430,567);
        fill (255);
      }
      stroke (255);
      textSize (15);
      text ("drag",450,385);
      textSize (17);
      text ("All of the possible timelines that could have happened after the Big Bang",600,430);
      text ("must be linked to all of the possible endings to our universe and labeled as",600,470);
      text ("'Point Infinity'.  To create the seventh dimension, 'Point Infinity' must be",600,510);
      text ("dragged to form a line.",600,550);
      textSize (15);
      text ("∞",450,337);
      if (point2x >= 510)  {
        text ("∞ (Universe A)",point2x,337);
      }
      line (480,380,550,380);
      line (550,380,540,370);
      line (550,380,540,390);
      noStroke();
      ellipse (450,350,w,h);
      if (w > 7)  {
        w -= 50;
        h -= 50;
      }  
      else  {
        ellipse (point1x,point1y,7,7);
        ellipse (point2x,point2y,7,7);
        stroke (255);
        line (point1x,point1y,point2x,point2y);

        if (lineFollow == true)  {
          stroke (255);
          if (mouseX <= 750 && mouseX >= 450)  {
            point2x = mouseX;
            line (point1x,point1y,point2x,point2y);
            ellipse (point2x,point2y,7,7);
          } 
        }
      }
    }

    noStroke();
  }
  if (d[8] == true)  {
    background (100,149,237);
    count = 8;
    textSize (30);
    text ("Dimension 8",600,100);
    stroke (255);
    textSize (15);
    text ("click",900,403);
    line (870,400,770,400);
    line (770,400,780,410);
    line (770,400,780,390);
    line (870,380,800,310);
    line (800,310,800,320);
    line (800,310,810,310);
    line (870,420,800,490);
    line (800,490,800,480);
    line (800,490,810,490);
    textSize (30);
    text ("∞",370,408);
    
    textSize (15);
    text ("Universe",650,225);
    text ("A",650,245);
    text ("Universe",680,395);
    text ("B",680,415);
    text ("Universe",650,565);
    text ("C",650,585);
    textSize (17);
    text ("In the eighth dimension, there are",250,180);
    text ("multiple universes!  The seventh dimension",250,210);
    text ("contained only our current universe.",250,240);
    text ("The different boxes represent the",250,270);
    text ("different ways our universe could have",250,300);
    text ("turned out during the Big Bang.",250,330);
    text ("An alternate universe might not have",250,477);
    text ("gravity, or the speed of light might be",250,507);
    text ("different.",250,537);
    textSize (15);
    text ("Click in each box to see how",950,180);
    text ("our universe might have developed.",950,210);
    
    noFill();
    rect (680,400,100,100);
    rect (650,230,100,100);
    rect (650,570,100,100);
    fill (255);
    line (400,400,600,400);
    line (400,400,570,230);
    line (400,400,570,570);
    ellipse (600,400,7,7);
    ellipse (570,230,7,7);
    ellipse (570,570,7,7);
    ellipse (lifex,lifey,7,7);
    if (NE == true && lifex <= 570)  {
      fill (0,255,0);
      ellipse (570,230,7,7);
      fill (255);
      lifex += 3;
      lifey -= 3;
    }
    if (E == true && lifex <= 600)  {
      fill (0,255,0);
      ellipse (600,400,7,7);
      fill (255);
      lifex += 3;
      lifey = 400;
    }
    if (SE == true && lifex <= 570)  {
      fill (0,255,0);
      ellipse (570,570,7,7);
      fill (255);
      lifex += 3;
      lifey += 3;
    }

    if (cheftimer <= 10)  {
      cheftimer += 1;
    }

    noStroke();
  }
  if (d[9] == true)  {
    background (100,149,237);
    count = 9;
    textSize (30);
    text ("Dimension 9",600,100);
    stroke (255);
    textSize (15);
    text ("click",900,403);
    text ("Click inside each box to jump",950,200);
    text ("from one universe to another.",950,230);
    textSize (20);
    text ("Just like in the sixth dimension",250,200);
    text ("where you could jump from one life",250,230);
    text ("to another, in the ninth dimension,",250,260);
    text ("you can jump from one universe to",250,290);
    text ("another.  The ninth dimension connects",250,320);
    text ("alternate universes.",250,350);
    textSize (30);
    text ("∞",370,408);
    line (870,400,770,400);
    line (770,400,780,410);
    line (770,400,780,390);
    line (870,380,800,310);
    line (800,310,800,320);
    line (800,310,810,310);
    line (870,420,800,490);
    line (800,490,800,480);
    line (800,490,810,490);
    
    textSize (15);
    text ("Universe",650,225);
    text ("A",650,245);
    text ("Universe",680,395);
    text ("B",680,415);
    text ("Universe",650,565);
    text ("C",650,585);
    
    noFill();
    rect (680,400,100,100);
    rect (650,230,100,100);
    rect (650,570,100,100);
    fill (255);
    line (400,400,600,400);
    line (400,400,570,230);
    line (400,400,570,570);

    line (600,400,570,230);
    line (600,400,570,570);
    line (570,230,570,570);

    ellipse (600,400,7,7);
    ellipse (570,230,7,7);
    ellipse (570,570,7,7);
    fill (0,255,0);
    stroke (0,255,0);
    line (400,400,pathx,pathy);
    stroke (255);
    ellipse (pathx,pathy,7,7);
    fill (255);
    ellipse (400,400,7,7);

    if (NW == true && pathy > 229)  {
      pathx -= 1;
      pathy -= 180/30;
    }
    if (pathy <= 230)  {
      pathy = 230;
      pathx = 570;
    }
    if (NE6 == true)  {
      pathx += 1;
      pathy -= 180/30;
    }
    if (pathy < 400 && NE6 == true)  {
      pathy = 400;
      pathx = 600;
    }
    if (SW == true && pathy < 570)  {
      pathx -= 1;
      pathy += 180/30;
    }
    if (SW == true && pathy == 570)  {
      pathx = 570;
    }
    if (SE6 == true && pathy < 400 && NE6 == false)  {
      pathx += 1;
      pathy += 180/30;
    }
    if (pathy >= 400 && up == false && down == false && NE6 == false && SW == false)  {
      pathy = 400;
      pathx = 600;
    }
    if (up == true && pathy > 230 && SW == false)  {
      pathy -= 180/30;
    }
    if (down == true && pathy < 571 && SW == false)  {
      pathy += 180/30;
    }
    if (pathy > 570)  {
      pathy = 570;
    }

    if (cheftimer <= 10)  {
      cheftimer += 1;
    }

    noStroke();
  }
  if (d[10] == true)  {
    background (100,149,237);
    count = 10;
    textSize (30);
    text ("Dimension 10",600,100);
    ellipse (point0x,point0y,7,7);
    stroke (255);
    line (585,365,535,415);
    line (585,365,565,365);
    line (585,365,585,385);
    textSize (15);
    text ("The Tenth Dimension",535,435);
    textSize (20);
    text ("So, we're back where we started: a single point.  But take a closer look.",600,200);
    text ("Although it appears to be simple, it's acutally larger than anything we could imagine.",600,230);
    text ("All of the possible locations and scenarios in all of the possible branches of all",600,500);
    text ("the possible timelines of all the possible universes are contained in this one point.",600,530);
    text ("The point couldn't be dragged, like in the first dimension, because another point",600,560);
    text ("would be needed to make the line.  Everything is contained in this one tenth dimensional",600,590);
    text ("point, so another point would be impossible.  As far as we know, there are only",600,620);
    text ("ten dimensions.",600,650);
  }
  
   if (sources == true)  {  // MENU button for "Sources" page
    fill (255);
    textSize (30);
    text ("Sources",600,100);
    textSize (20);
    text ("Abbott, Edwin A. Flat-Land. New York: HarperCollins, 1983. Print.",600,180);
    text ("Bryanton, Rob. 'Imagining the Tenth Dimension.' Imagining the Tenth Dimension.",600,250);
    text ("LFC Hostin225g. Web.<http://www.tenthdimension.com/flash2.php>.",600,290);
    text ("Groleau, Rick. 'Imagining Other Dimensions.' The Elegant Universe. NOVA, July 2003. Web.",600,360);
    text ("9 Mar. 2010. <http://www.pbs.org/wgbh/nova/elegant/dimensions.html>.",600,400);
    text ("Groleau, Rick. 'Multidimensional Math.' The Elegant Universe. NOVA. Web. 9 Mar. 2010.",600,470);
    text ("<http://www.pbs.org/wgbh/nova/elegant/math-flash.html>.",600,510);
    text ("Weisstein, Eric W. 'Dimension.' From MathWorld--A Wolfram Web Resource.",600,580);
    text ("<http://mathworld.wolfram.com/Dimension.html>.",600,620);
    noStroke();
    rect (80,40,80,40);
    textSize (20);
    fill (100,149,237);
    text ("MENU",80,47);
    if (mouseX >= 40 && mouseX <= 120 && mouseY >= 20 && mouseY <= 60)  {
      fill (100,149,237);
      rect (80,40,80,40);
      fill (255);
      text ("MENU",80,47);
    }
  }

  if (d[count] == true)  {  // Contains MENU, BACK, and NEXT buttons
    fill (255);  // MENU button
    noStroke();
    rect (80,40,80,40);
    textSize (20);
    fill (100,149,237);
    text ("MENU",80,47);
    if (mouseX >= 40 && mouseX <= 120 && mouseY >= 20 && mouseY <= 60)  {
      fill (100,149,237);
      rect (80,40,80,40);
      fill (255);
      text ("MENU",80,47);
    }

    if (d[0] == false)  {  // BACK button
      fill (255);
      rect (80,660,80,40);
      fill (100,149,237);
      text ("BACK",80,667);
      if (mouseX >= 40 && mouseX <= 120 && mouseY >= 640 && mouseY <= 680)  {
        fill (100,149,237);
        rect (80,660,80,40);
        fill (255);
        text ("BACK",80,667);
      }
    }

    if (d[10] == false)  {  // NEXT button
      fill (255);
      rect (1120,660,80,40);
      fill (100,149,237);
      text ("NEXT",1120,667);
      if (mouseX >= 1080 && mouseX <= 1160 && mouseY >= 640 && mouseY <= 680)  {
        fill (100,149,237);
        rect (1120,660,80,40);
        fill (255);
        text ("NEXT",1120,667);
      }
    }

    fill(255);
  }

}

void mousePressed()
{
  if (d[1] == true && mouseX >= point2x - 13 && mouseX <= point2x + 13 && mouseY >= point2y - 13 && mouseY <= point2y + 13)  {
    lineFollow = true;
  }

  if (d[2] == true && mouseX >= square3x - 13 && mouseX <= square4x + 13 && mouseY >= square3y - 13 && mouseY <= square3y + 13)  {
    squareFollow = true;
  }

  if (d[3] == true && mouseX >= box1x - 13 && mouseX <= box2x + 13 && mouseY >= box3y - 13 && mouseY <= box1y + 13)  {
    boxFollow = true;
  }

  if (d[4] == true && mouseX >= 187 && mouseX <= 1013 && mouseY >= 387 && mouseY <= 413)  {
    timeFollow = true;
  }

  if (d[7] == true && mouseX >= point2x - 13 && mouseX <= point2x + 13 && mouseY >= point2y - 13 && mouseY <= point2y + 13)  {
    lineFollow = true;
  }

}

void mouseReleased()
{
  for (int i = 0; i < boxx.length; i++)  {  // Makes stuff happen when each dimension button is pressed
    if (menu == true)  {
      if (mouseX >= boxx[i] - 35 && mouseX <= boxx[i] + 35 && mouseY >= boxy - 35 && mouseY <= boxy + 35)  {
        d[i] = true;
        menu = false;
        point2x = 450;
        point2y = 350;
        square1x = 450;
        square2x = 750;
        square3x = 450;
        square4x = square3x + 300;
        square1y = 500;
        square2y = 500;
        square3y = 500;
        square4y = square3y;
        box1x = 350;
        box2x = box1x + 300;
        box3x = box1x;
        box4x = box1x + 300;
        box1y = 600;
        box2y = box1y;
        box3y = box1y - 300;
        box4y = box1y - 300;
        timex = 200;
        timey = 400;
        lifex = 400;
        lifey = 400;
        NE = false;
        E = false;
        SE = false;
        cheftimer = 0;
        int pathx = 600;
        pathy = 400;
        NW = false;
        NE6 = false;
        SW = false;
        SE6 = false;
        up = false;
        down = false;
        w = 2000;
        h = 2000;
        play = false;
      }
    }
  }

  if ((d[count] == true || sources == true) && menu == false && mouseX >= 40 && mouseX <= 120 && mouseY >= 20 && mouseY <= 60)  {  // Makes the MENU button work
    d[count] = false;
    menu = true;
    sources = false;
    cheftimer = 0;
  }
  if (d[count] == true && d[0] == false && mouseX >= 40 && mouseX <= 120 && mouseY >= 640 && mouseY <= 680)  {  // Makes the BACK button work
    d[count] = false;
    count -= 1;
    d[count] = true;
    point2x = 450;
    point2y = 350;
    square1x = 450;
    square2x = 750;
    square3x = 450;
    square4x = square3x + 300;
    square1y = 500;
    square2y = 500;
    square3y = 500;
    square4y = square3y;
    box1x = 350;
    box2x = box1x + 300;
    box3x = box1x;
    box4x = box1x + 300;
    box1y = 600;
    box2y = box1y;
    box3y = box1y - 300;
    box4y = box1y - 300;
    timex = 200;
    timey = 400;
    lifex = 400;
    lifey = 400;
    NE = false;
    E = false;
    SE = false;
    cheftimer = 0;
    int pathx = 600;
    pathy = 400;
    NW = false;
    NE6 = false;
    SW = false;
    SE6 = false;
    up = false;
    down = false;
    w = 2000;
    h = 2000;
    play = false;
  }
  if (d[count] == true && d[10] == false && mouseX >= 1080 && mouseX <= 1160 && mouseY >= 640 && mouseY <= 680)  {  // Makes the NEXT button work
    d[count] = false;
    count += 1;
    d[count] = true;
    point2x = 450;
    point2y = 350;
    square1x = 450;
    square2x = 750;
    square3x = 450;
    square4x = square3x + 300;
    square1y = 500;
    square2y = 500;
    square3y = 500;
    square4y = square3y;
    box1x = 350;
    box2x = box1x + 300;
    box3x = box1x;
    box4x = box1x + 300;
    box1y = 600;
    box2y = box1y;
    box3y = box1y - 300;
    box4y = box1y - 300;
    timex = 200;
    timey = 400;
    lifex = 400;
    lifey = 400;
    NE = false;
    E = false;
    SE = false;
    cheftimer = 0;
    int pathx = 600;
    pathy = 400;
    NW = false;
    NE6 = false;
    SW = false;
    SE6 = false;
    up = false;
    down = false;
    w = 2000;
    h = 2000;
    play = false;
  }

  if (lineFollow == true)  {  // Allows user to drag point
    lineFollow = false;
  }

  if (squareFollow == true)  {  // Allows user to drag line
    squareFollow = false;
  }

  if (boxFollow == true)  {  // Allows user to drag square
    boxFollow = false;
  }

  if (timeFollow == true)  {  // Allows user to drag point on timeline
    timeFollow = false;
  }

  if ((d[5] == true || d[8] == true) && E == false && mouseX >= 630 && mouseX <= 730 && mouseY >= 350 && mouseY <= 450 && cheftimer >= 5)  {  // Allows point to move along lives
    lifex = 400;
    lifey = 400;
    E = true;  // Chef
    NE = false;
    SE = false;
  }
  if ((d[5] == true || d[8] == true) && NE == false && mouseX >= 600 && mouseX <= 700 && mouseY >= 180 && mouseY <= 280)  {
    lifex = 400;
    lifey = 400;
    NE = true;  // Musician
    E = false;
    SE = false;
  }
  if ((d[5] == true || d[8] == true) && SE == false && mouseX >= 600 && mouseX <= 700 && mouseY >= 520 && mouseY <= 620)  {
    lifex = 400;
    lifey = 400;
    SE = true;  // Scientist
    NE = false;
    E = false;
  }

  if ((d[6] == true || d[9] == true) && pathy == 400 && mouseX >= 600 && mouseX <= 700 && mouseY >= 180 && mouseY <= 280)  {  // Allows point to skip between lives
    NW = true;
    NE6 = false;
    up = false;
    down = false;
    SW = false;
    SE6 = false;
  }
  if ((d[6] == true || d[9] == true) && pathy == 230 && mouseX >= 630 && mouseX <= 730 && mouseY >= 350 && mouseY <= 450 && cheftimer >= 5)  {
    SE6 = true;
    NW = false;
    NE6 = false;
    up = false;
    down = false;
    SW = false;
  }
  if ((d[6] == true || d[9] == true) && pathy == 230 && mouseX >= 600 && mouseX <= 700 && mouseY >= 520 && mouseY <= 620)  {
    down = true;
    NW = false;
    NE6 = false;
    up = false;
    SW = false;
    SE6 = false;
  }
  if ((d[6] == true || d[9] == true) && pathy == 570 && mouseX >= 600 && mouseX <= 700 && mouseY >= 180 && mouseY <= 280)  {
    up = true;
    down = false;
    NW = false;
    NE6 = false;
    SW = false;
    SE6 = false;
  }
  if ((d[6] == true || d[9] == true) && pathy == 570 && mouseX >= 630 && mouseX <= 730 && mouseY >= 350 && mouseY <= 450 && cheftimer >= 5)  {
    NE6 = true;
    up = false;
    down = false;
    NW = false;
    SW = false;
    SE6 = false;
  }
  if ((d[6] == true || d[9] == true) && pathy == 400 && mouseX >= 600 && mouseX <= 700 && mouseY >= 520 && mouseY <= 620)  {
    SW = true;
    NE6 = false;
    up = false;
    down = false;
    NW = false;
    SE6 = false;
  }

  if (d[7] == true && play == false && w != 7 && mouseX >= 390 && mouseX <= 470 && mouseY >= 545 && mouseY <= 575)  {  // Lets Dimension 7's PLAY button work
    play = true;
    point2x = 450;
    point2y = 350;
  }
  if (d[7] == true && play == true && w <= 7 && mouseX >= 390 && mouseX <= 470 && mouseY >= 545 && mouseY <= 575)  {  // Lets Dimension 7's RESET button work
    play = false;
    w = 2000;
    h = 2000;
  }

  if (menu == true && mouseX >= 545 && mouseX <= 655 && mouseY >= 415 && mouseY <= 455)  {  // "Sources" screen
    menu = false;
    sources = true;
  }
}






















