
int index = 0;
PImage body;
PImage tail;
PImage hip;
PImage leg;
PImage head;
PImage neck;
PImage neck_mid;
PImage grass;

int ox, oy, oAdjustmentx, oAdjustmenty;

int grassX = 0;


//================================================================
//--------------------------- CLOUDS -----------------------------
//----- Code from: http://www.openprocessing.org/sketch/1273 -----
//================================================================
float r, h, ms, v, vy, hv;

float kNoiseDetail = 0.01;
//float r;
float speed= 0.2;
float cx = 50;
float cy = 50;
//===============================================================
//---------------------------------------------------------------
//===============================================================
void setup()
{
  smooth();
  colorMode(HSB, 1);
  size(720, 720);
  background(#a8e4fb);

  ox = width/2 + 0;
  oy = height/2 + 110;
  oAdjustmentx = -830;
  oAdjustmenty = -820;

  //---------------- Body -----------------
  body = loadImage("Ostrich_Body.png");

  //---------------- Tail -----------------
  tail = loadImage("Ostrich_Tail.png");

  //---------------- Leg -----------------
  leg = loadImage("Ostrich_Leg.png");

  //---------------- Hip -----------------
  hip = loadImage("Ostrich_Hip.png");
  
  //---------------- Head -----------------
  head = loadImage("Ostrich_Head.png");
  
  //------------- Mid-Neck ----------------
  neck_mid = loadImage("Ostrich_Neck_Mid.png");

  //--------------- Neck ------------------
  neck = loadImage("Ostrich_Neck.png");

  //---------------- Grass ----------------
  grass = loadImage("Grass_Long.png");


  r = width/2;
  noiseDetail(5, .5);
}
void draw()
{
  cloudsthree();
  //background(#a8e4fb, 200);
  noStroke();
  for (int i = 0; i < height; i += 1)
  {
    stroke(#a8e4fb, 255 - i);
    if (i >= 255)
    {
      stroke(#a8e4fb);
    }
    line(0, i, width, i);
  }
  
  image(grass, grassX, -70);
  
  grassX = (grassX - (int)random(5,10)) % width;
  
  drawBawkBawk();
}


void drawBawkBawk()
{
  float noiseValue1 = noise(  millis()/1000.0 ); 
  float x = map(noiseValue1, 0,1,  -50, 50); 
  
  pushMatrix();
  translate(x, 0);
  updateTail(ox - 190, oy - 100);
  updateLeg(ox - 145, oy + 20, 0);
  updateLeg(ox - 65, oy + 20, 1);
  updateHip(ox - 190, oy - 85, 1);
  updateHip(ox - 110, oy - 85, 0);
  updateMeckAndHead(ox - 180, oy - 285);
  updateBody(ox, oy);
  popMatrix();
}

void updateTail(int x, int y)
{
  float noiseValue3 = noise( (millis()+23456)/1111.1  );
  float noiseValue4 = noise( (millis()+34567)/1212.1  );

  float noiseAngle = map(noiseValue3, 0, 1, 120, 200);  
  float noiseScale = map(noiseValue4, 0, 1, 0.75, 2.0) % .5; 
  pushMatrix();
  translate(x, y);
  scale ( .3);
  rotate( radians(noiseAngle)); 

  //image(tail, x, y);
  image(tail, 0, 0);

  popMatrix();
}


void updateHip(int x, int y, int rOrl)
{
  float noiseValue3 = noise( (millis()+23456)/1111.1  );
  float ang1 =  0.3 * (noise(millis()/2000.0) - 0.5);
  float ang2 =  0.7 * (noise(millis()/1111.0) - 0.5);
  float ang3 =  0.3 * (noise(millis()/2311.0) - 0.5);

  float noiseAngle = map(noiseValue3, 0, 1, -30, 30);
  println(noiseAngle);  
  pushMatrix();
  translate(x, y);
  scale ( .3);
  //rotate( radians(noiseAngle)); 
  if (rOrl == 1)
  rotate(ang1); 
  
  else
  rotate(ang3);

  image(hip, 0, 0);

  popMatrix();
}

void updateLeg(int x, int y, int rOrl)
{
  float noiseValue3 = noise( (millis()+23456)/1111.1  );
  float ang1 =  0.5 * (noise(millis()/2000.0) - 0.5);
  float ang2 =  0.7 * (noise(millis()/1111.0) - 0.5);
  float ang3 =  0.6 * (noise(millis()/1811.0) - 0.5);

  float noiseAngle = map(noiseValue3, 0, 1, -40, 40);  
  pushMatrix();
  translate(x, y);
  scale ( .25);
  //rotate( radians(noiseAngle));
  if(rOrl == 1)
  rotate(ang2); 
  
  else
  rotate(ang3);

  image(leg, 0, 0);

  popMatrix();
}

void updateBody(int x, int y)
{
  pushMatrix();

  translate(x, y);
  scale ( .3);
  image(body, oAdjustmentx, oAdjustmenty);

  popMatrix();
}

void updateMeckAndHead(int x, int y)
{
  float ang1 =  0.3 * (noise(millis()/2000.0) - 0.3);
  pushMatrix();

  translate(x, y);
  scale ( .3);
  rotate(ang1);
  image(neck, 0, 0);
  translate(640, -425);
  image(neck_mid, 0, 0);
  translate(200, 0);
  image(head, 0, 0);

  popMatrix();
}

//================================================================
//--------------------------- CLOUDS -----------------------------
//----- Code from: http://www.openprocessing.org/sketch/1273 -----
//================================================================

void cloudsthree()
{
  { 
    ms = millis()*.0001;
    println (frameRate + ": " + ms);
    if (mousePressed)
    { 
      int octave = 3; // 3 .. 7 
      float falloff = .1; // 0.3 .. 0.6
      noiseDetail(octave, falloff);
      println ("octave=" + octave + " falloff=" + falloff);
    } 
    else
    { 
      cx += max(-speed, min(speed, (width/2)*speed/r));
      cy += max(-speed, min(speed, (0/2)*speed/r));
    }
    for (int y = 0; y < height; ++y)
    { 
      hv = 0.65 - y * h;
      vy = cy + y * kNoiseDetail;
      for (int x = 0; x < width; ++x)
      { 
        v = noise (cx + x * kNoiseDetail, vy, ms);
        set (x, y, color(hv, 0.75-v, 0.5+v*v, 4));
      }
    }
  }
}


