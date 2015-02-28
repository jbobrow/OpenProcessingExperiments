
PImage img;

void setup() {
  size(500, 500);

  img = loadImage("Mann.gif");
}

void draw() {
  
  
  if (hour()>16)
  {
    background (41, 35, 92);
  }
  else
  { background(249,178,51); }
  
  if (hour()>=0 && hour()<5)
  {background (41, 35, 92); }

  else
  { background(249,178,51); }

  image(img, 0, 0);

  translate(110, 310);

  for (int y=25;y<278;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 25, 1, h*5);
  }

  for (int y=28;y<276;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 30, 1, h*5);
  }



  for (int y=31;y<273;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 35, 1, h*5);
  }

  for (int y=34;y<270;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 40, 1, h*5);
  }


  for (int y=37;y<268;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 45, 1, h*5);
  }

  for (int y=40;y<265;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 50, 1, h*5);
  }



  for (int y=43;y<265;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 55, 1, h*5);
  }

  for (int y=46;y<262;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 60, 1, h*5);
  }



  for (int y=49;y<258;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 65, 1, h*5);
  }

  for (int y=52;y<256;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 70, 1, h*5);
  }


  for (int y=55;y<252;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 75, 1, h*5);
  }

  for (int y=58;y<250;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 80, 1, h*5);
  }



  for (int y=61;y<246;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 85, 1, h*5);
  }

  for (int y=64;y<244;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 90, 1, h*5);
  }




  for (int y=67;y<240;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 95, 1, h*5);
  }

  for (int y=70;y<238;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 100, 1, h*5);
  }



  for (int y=73;y<234;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 105, 1, h*5);
  }

  for (int y=76;y<232;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 110, 1, h*5);
  }




  for (int y=79;y<228;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 115, 1, h*5);
  }

  for (int y=82;y<226;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 120, 1, h*5);
  }




  for (int y=85;y<222;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 125, 1, h*5);
  }

  for (int y=88;y<220;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 130, 1, h*5);
  }


  for (int y=91;y<216;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 135, 1, h*5);
  }

  for (int y=94;y<214;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 140, 1, h*5);
  }



  for (int y=97;y<210;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 145, 1, h*5);
  }

  for (int y=100;y<208;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 150, 1, h*5);
  }


  for (int y=103;y<204;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 155, 1, h*5);
  }

  for (int y=106;y<202;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 160, 1, h*5);
  }


  for (int y=109;y<198;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 165, 1, h*5);
  }

  for (int y=112;y<196;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 170, 1, h*5);
  }




  for (int y=115;y<192;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 175, 1, h*5);
  }

  for (int y=118;y<190;y+=6)
  { 
    int h = hour();
    fill(0);
    rect(y, 180, 1, h*5);
  }
  
  
  for (int y=117;y<134;y+=20)
  { 
    int sec = second();
    fill(0);
    rect(y, -122, sec, 11);
  }
}


