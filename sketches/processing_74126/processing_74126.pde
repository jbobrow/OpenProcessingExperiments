
//weather
String zip = "15289";
String weather;
String pweather;
String season;
boolean rain = false;
boolean snow = false;
boolean fog = false;
boolean clouds = false;
int nClouds = 0;
boolean foundWeather = false;
int cnt = 0;
String moonphase;
boolean foundMoonphase = false;

int numClouds = 100;
cloudy c1;
cloudy[] cloud = new cloudy[numClouds];

int numDrops = 100;
fastRain r1;
fastRain[] drops = new fastRain[numDrops];
slowRain r2;
slowRain[] drops2 = new slowRain[numDrops];

int numFlakes = 300;
fastSnow s1;
fastSnow[] flakes = new fastSnow[numFlakes];
slowSnow s2;
slowSnow[] flakes2 = new slowSnow[numFlakes];

PImage foggy;
PImage frame;
PImage[] imgs = new PImage[4];
PImage suns;
PImage stars;
PImage moonl;
PImage moond;
//...

void setup()
{
  size(700, 500);
  smooth();
  noStroke();
  findWeather();
  foggy = loadImage("fog.jpg");
  frame = loadImage("frame.png");
  imgs[0] = loadImage("cloud1.png");
  imgs[1] = loadImage("cloud2.png");
  imgs[2] = loadImage("cloud3.png");
  imgs[3] = loadImage("cloud4.png");
  suns = loadImage("red.png");
  stars = loadImage("milkyway.png");
  
  findSeason();
  findMoonphase();
  
  //print(weather+"\n");
  //print(season);
  //print(moonphase);
  
  for (int i = 0; i < drops.length; i++)
  {
    drops[i] = new fastRain();
    r1 = new fastRain();
  }
  for (int i = 0; i < drops2.length; i++)
  {
    drops2[i] = new slowRain();
    r2 = new slowRain();
  }
  
  for (int i = 0; i < flakes.length; i++)
  {
    flakes[i] = new fastSnow();
    s1 = new fastSnow();
  }
  for (int i = 0; i < flakes2.length; i++)
  {
    flakes2[i] = new slowSnow();
    s2 = new slowSnow();
  }
  
  for (int i = 0; i < cloud.length; i++)
  {
    cloud[i] = new cloudy();
    c1 = new cloudy();
  }
}

void findWeather()
{
  pweather = weather;
  String url = "http://www.weather.com/weather/right-now/" + zip;
  String joinedUrl = join(loadStrings(url), "");
  String start = "&deg;F ";
  String end = ".\" />";
  int iStart = joinedUrl.indexOf(start);
  iStart += start.length();
  int iEnd = joinedUrl.indexOf(end, iStart);
  if (iEnd == -1 || iStart == -1) weather = "";
  else weather = joinedUrl.substring(iStart, iEnd);
}

void findMoonphase()
{
  String url = "http://www.weather.com/weather/today/" + zip;
  String joinedUrl = join(loadStrings(url), "");
  String start = "<dt>Moonphase:</dt>";
  String end = "</dd>";
  int iStart = joinedUrl.indexOf(start);
  iStart += start.length();
  int iEnd = joinedUrl.indexOf(end, iStart);
  if (iEnd == -1 || iStart == -1) moonphase = "";
  else moonphase = joinedUrl.substring(iStart, iEnd);
}

void findSeason()
{
  if ((month() == 12 && day() >= 21) || month() == 1 || month() == 2 || (month() == 3 && day() < 21)) season = "Winter";
  if ((month() == 3 && day() >= 21) || month() == 4 || month() == 5 || (month() == 6 && day() < 21)) season = "Spring";
  if ((month() == 6 && day() >= 21) || month() == 7 || month() == 8 || (month() == 9 && day() < 21)) season = "Summer";
  if ((month() == 9 && day() >= 21) || month() == 10 || month() == 11 || (month() == 12 && day() < 21)) season = "Autumn";
}

void draw()
{
  //time
  int s = second();
  int m = minute();
  int h = hour();
  int mn = month();
  int t = s + 60*m + 3600*h;
  //float t = map(mouseX, 0, width, 0, 86399);
  //////!!!!!!!!!!!!!!!!!!
  
  if (t%900 == 0)
  {
    if (foundWeather == false)
    {
      findWeather();
      //print(weather+"\n");
      foundWeather = true;
    }
    if (day() == 21 && t < 1) findSeason();
  }
  if ((t-1)%900 == 0) foundWeather = false;
  if (t == 0)
  {
    if (foundMoonphase == false)
    {
      findMoonphase();
      foundMoonphase = true;
    }
  }
  if (t == 1)
  {
    foundMoonphase = false;
  }
  
  //weather
  if (match(weather, "Storms") != null || match(weather, "Showers") != null || match(weather, "Rain") != null) rain = true;
  else rain = false;
  if (match(weather, "Sunny") == null && match(weather, "Fair") == null && match(weather, "Clear") == null) clouds = true;
  else clouds = false;
  if (match(weather, "Fog") != null || match(weather, "Freezing Rain") != null || match(weather, "Snow") != null || match(weather, "Sleet") != null) fog = true;
  else fog = false;
  if (match(weather, "Freezing Rain") != null || match(weather, "Snow") != null || match(weather, "Sleet") != null) snow = true;
  else snow = false;
  //Sunny, Fair, Clear
  //Cloudy, Partly Cloudy, AM Cloudy/PM Sunny or something, Mostly Cloudy

  //sky
  float sR = 185;
  float sG = 246;
  float sB = 247;
  if (t < 50000 || t > 36400)
  {
    sR = 185;
    sG = 246;
    sB = 247;
  }
  if (t >= 50000)
  {
    sR = map(t, 86399, 50000, 67, 185);
    sG = map(t, 86399, 50000, 74, 246);
    sB = map(t, 86399, 50000, 88, 247);
  }
  if (t <= 36400)
  {
    sR = map(t, 0, 36400, 67, 185);
    sG = map(t, 0, 36400, 74, 246);
    sB = map(t, 0, 36400, 88, 247);
  }
  fill(sR, sG, sB);
  rectMode(CENTER);
  rect(width/2, height/2, width, height);
  
  //stars
  pushMatrix();
  tint(255, 0);
  if (t < 20000) tint(255, map(t, 20001, 0, 0, 150));
  if (t > 70399) tint(255, map(t, 70400, 86399, 0, 150));
  translate(width/2, height/2);
  rotate((cnt/8)*PI/1080);
  translate(-stars.width/2, -stars.height/2);
  image(stars, 0, 0);
  popMatrix();
  cnt++;

  //sun
  float angle = map(t, 0, 86399, PI, 0);
  float sunx = width/2 + ((width*3/7)*cos(angle));
  float suny = height+150 - (height*sin(angle));
  fill(255, 255, 230);
  ellipse(sunx, suny, 50, 50);
  fill(255, 255, 230, 150);
  ellipse(sunx, suny, 70, 70);
  fill(255, 255, 230, 120);
  ellipse(sunx, suny, 90, 90);
  fill(255, 255, 230, 90);
  ellipse(sunx, suny, 110, 110);
  fill(255, 255, 230, 60);
  ellipse(sunx, suny, 130, 130);
  fill(255, 255, 230, 30);
  ellipse(sunx, suny, 150, 150);
  
  //moon
  if (match(moonphase, "New Moon") != null)
  {
    moonl = loadImage("newmoonl.png");
    moond = loadImage("newmoond.png");
  }
  if (match(moonphase, "Waxing Crescent") != null)
  {
    moonl = loadImage("waxingcrescentl.png");
    moond = loadImage("waxingcrescentd.png");
  }
  if (match(moonphase, "First Quarter") != null)
  {
    moonl = loadImage("firstquarterl.png");
    moond = loadImage("firstquarterd.png");
  }
  if (match(moonphase, "Waxing Gibbous") != null)
  {
    moonl = loadImage("waxinggibbousl.png");
    moond = loadImage("waxinggibbousd.png");
  }
  if (match(moonphase, "Full Moon") != null)
  {
    moonl = loadImage("fullmoonl.png");
    moond = loadImage("fullmoond.png");
  }
  if (match(moonphase, "Waning Gibbous") != null)
  {
    moonl = loadImage("waninggibbousl.png");
    moond = loadImage("waninggibbousd.png");
  }
  if (match(moonphase, "Last Quarter") != null)
  {
    moonl = loadImage("lastquarterl.png");
    moond = loadImage("lastquarterd.png");
  }
  if (match(moonphase, "Waning Crescent") != null)
  {
    moonl = loadImage("waningcrescentl.png");
    moond = loadImage("waningcrescentd.png");
  }
  //
  float moonx = width/2 + ((width*3/7)*cos(angle - (PI/2)));
  float moony = height+150 - (height*sin(angle - (PI/2)));
  float moon2x = width/2 + ((width*3/7)*cos(angle + (PI/2)));
  float moon2y = height+150 - (height*sin(angle + (PI/2)));
  fill(sR, sG, sB);
  ellipse(moonx, moony, 50, 50);
  tint(255, map(t, 43200, 0, 100, 200));
  image(moonl, moonx-25, moony-25);
  tint(sR, sG, sB, map(t, 43200, 0, 0, 100));
  image(moond, moonx-25, moony-25);
  ellipse(moon2x, moon2y, 50, 50);
  tint(255, map(t, 43201, 86399, 100, 200));
  image(moonl, moon2x-25, moon2y-25);
  tint(sR, sG, sB, map(t, 43201, 86399, 0, 100));
  image(moond, moon2x-25, moon2y-25);

  if (clouds == true)
  {
    tint(220);
    if (match(weather, "Cloudy") != null) nClouds = cloud.length/8;
    if (match(weather, "Mostly Cloudy") != null || snow == true || rain == true || fog == true) nClouds = cloud.length;
    for (int i = 0; i < nClouds; i++)
    {
      cloud[i].floaty();
    }
  }
  
  tint(210, 255, 210, (130*sin((t/8000)-0.7))-70);
  image(suns, 0, 0);

  //trees
  float tR = 192;
  float tG = 145;
  float tB = 70;
  if (t < 50000 || t > 36400)
  {
    tR = 192;
    tG = 145;
    tB = 70;
  }
  if (t >= 50000)
  {
    tR = map(t, 86399, 50000, 85, 192);
    tG = map(t, 86399, 50000, 72, 145);
    tB = map(t, 86399, 50000, 58, 70);
  }
  if (t <= 36400)
  {
    tR = map(t, 0, 36400, 85, 192);
    tG = map(t, 0, 36400, 72, 145);
    tB = map(t, 0, 36400, 58, 70);
  }
  //night fill(85, 72, 58);
  //day fill(185, 139, 64);
  //
  //ground
  float gR = 0;
  float gG = 0;
  int gB = 0;
  if (season == "Autumn")
  {
    if (t > 43200) gR = map(t, 86399, 43201, 90, 165);
    else gR = map(t, 0, 43200, 90, 165);
    if (t > 43200) gG = map(t, 86399, 43201, 110, 173);
    else gG = map(t, 0, 43200, 110, 173);
    gB = 66;
  }
  if (season == "Winter")
  {
    if (t > 43200) gR = map(t, 86399, 43201, 120, 195);
    else gR = map(t, 0, 43200, 120, 195);
    if (t > 43200) gG = map(t, 86399, 43201, 160, 203);
    else gG = map(t, 0, 43200, 160, 203);
    gB = 150;
  }
  if (season == "Summer")
  {
    if (t > 43200) gR = map(t, 86399, 43201, 60, 125);
    else gR = map(t, 0, 43200, 60, 125);
    if (t > 43200) gG = map(t, 86399, 43201, 120, 183);
    else gG = map(t, 0, 43200, 120, 183);
    gB = 76;
  }
  if (season == "Spring")
  {
    if (t > 43200) gR = map(t, 86399, 43201, 70, 135);
    else gR = map(t, 0, 43200, 70, 135);
    if (t > 43200) gG = map(t, 86399, 43201, 110, 173);
    else gG = map(t, 0, 43200, 110, 173);
    gB = 86;
  }
  //night fill(60, 120, 66);
  //day fill(125, 183, 66);
  //
  float gbR = gR-30;
  float gbG = gG-30;
  
  //back back trees
  fill(tR, tG, tB);
  rectMode(CENTER);
  rect(450, 290, 5, 140);
  rect(480, 280, 3, 180);
  rect(130, 260, 5, 200);
  fill(gbR-15, gbG-15, 66);
  triangle(480, 160,  530, 315,  430, 315);
  fill(gbR-30, gbG-30, 66);
  triangle(450, 200,  475, 330,  425, 330);
  triangle(130, 150,  175, 300,  85, 300);

  //backhill
  fill(gR-15, gG-15, gB-15);
  beginShape();
  curveVertex(0, height);
  curveVertex(0, height-155);
  curveVertex(width/3, height-135);
  curveVertex(width/2, height-125);
  curveVertex(width*2/3, height-145);
  curveVertex(width, height-150);
  curveVertex(width, height);
  curveVertex(0, height);
  curveVertex(0, height-120);
  endShape();
  
  //back back flowers
  float fR;
  float fG;
  float fB;
  if (t > 43200) fR = map(t, 86399, 43201, 110, 187);
  else fR = map(t, 0, 43200, 110, 187);
  if (t > 43200) fG = map(t, 86399, 43201, 30, 89);
  else fG = map(t, 0, 43200, 30, 89);
  if (t > 43200) fB = map(t, 86399, 43201, 76, 124);
  else fB = map(t, 0, 43200, 76, 124);
  if (season == "Spring")
  {
    fill(fR, fG, fB);
    ellipse(440, 370, 8, 8);
    ellipse(444, 365, 6, 6);
    ellipse(448, 368, 7, 7);
    //
    ellipse(462, 371, 6, 6);
    ellipse(467, 375, 5, 5);
    ellipse(471, 368, 4, 4);
    //
    ellipse(640, 347, 7, 7);
    ellipse(635, 352, 5, 5);
    ellipse(644, 350, 5, 5);
    ellipse(621, 350, 6, 6);
  }
  
  //fog
  if (fog == true) tint(255, 120);
  if (snow == true) tint(255, 40);
  if (rain == true) tint(255, 30);
  if (fog != true && snow != true && rain != true) tint(255, 10);
  image(foggy, 0, 0, width, height);
  
  //back bush
  float bsR = 0;
  float bsG = 0;
  int bsB = 0;
  if (season == "Autumn")
  {
    if (t > 43200) bsR = map(t, 86399, 43201, 110, 155);
    else bsR = map(t, 0, 43200, 110, 155);
    if (t > 43200) bsG = map(t, 86399, 43201, 40, 83);
    else bsG = map(t, 0, 43200, 40, 83);
    bsB = 36;
  }
  if (season == "Winter")
  {
    if (t > 43200) bsR = map(t, 86399, 43201, 70, 115);
    else bsR = map(t, 0, 43200, 70, 115);
    if (t > 43200) bsG = map(t, 86399, 43201, 90, 133);
    else bsG = map(t, 0, 43200, 90, 133);
    bsB = 80;
  }
  if (season == "Summer")
  {
    if (t > 43200) bsR = map(t, 86399, 43201, 30, 75);
    else bsR = map(t, 0, 43200, 30, 75);
    if (t > 43200) bsG = map(t, 86399, 43201, 90, 133);
    else bsG = map(t, 0, 43200, 90, 133);
    bsB = 36;
  }
  if (season == "Spring")
  {
    if (t > 43200) bsR = map(t, 86399, 43201, 40, 85);
    else bsR = map(t, 0, 43200, 40, 85);
    if (t > 43200) bsG = map(t, 86399, 43201, 80, 123);
    else bsG = map(t, 0, 43200, 80, 123);
    bsB = 46;
  }
  fill(bsR, bsG, bsB);
  //
  ellipse(620, 377, 23, 23);
  ellipse(605, 370, 25, 25);
  ellipse(595, 375, 20, 20);
  ellipse(634, 378, 15, 15);
  ellipse(583, 381, 15, 15);
  //
  ellipse(386, 389, 20, 20);
  ellipse(404, 389, 24, 24);
  ellipse(395, 380, 8, 8);
  ellipse(420, 391, 15, 15);
  ellipse(428, 397, 15, 15);

  //back trees
  fill(tR, tG, tB);
  rectMode(CENTER);
  rect(625, 310, 6, 180);
  rect(100, 250, 14, 260);
  fill(gbR-15, gbG-15, 66);
  triangle(625, 150,  685, 320,  565, 320);
  triangle(100, 80,  150, 320,  50, 320);
  fill(tR, tG, tB);
  rect(580, 300, 10, 190);
  fill(gbR-30, gbG-30, 66);
  triangle(580, 100,  540, 335,  620, 335);
  
  //road
  float roadColor;
  if (season == "Winter")
  {
    if (t > 43200) roadColor = map(t, 86399, 43201, 120, 170);
    else roadColor = map(t, 0, 43200, 120, 170);
  }
  else
  {
    if (t > 43200) roadColor = map(t, 86399, 43201, 110, 200);
    else roadColor = map(t, 0, 43200, 110, 200);
  }
  //
  //back road
  fill(roadColor-15);
  beginShape();
  curveVertex(490, 353); //topleft
  curveVertex(525, 348); //topright
  curveVertex(556, 362);
  curveVertex(578, 395); //bottomright
  curveVertex(536, 400); //bottomleft
  curveVertex(524, 380);
  curveVertex(510, 365);
  curveVertex(490, 353); //topleft
  curveVertex(525, 348); //topright
  endShape();

  //fronthill
  fill(gbR, gbG, gB);
  beginShape();
  curveVertex(0, height);
  curveVertex(0, height-130);
  curveVertex(width/3, height-140);
  curveVertex(width/2, height-120);
  curveVertex(width*2/3, height-100);
  curveVertex(width, height-120);
  curveVertex(width, height);
  curveVertex(0, height);
  curveVertex(0, height-130);
  endShape();

  //road
  fill(roadColor-30);
  beginShape();
  curveVertex(450, 400);
  curveVertex(520, 395); //topright
  curveVertex(575, 450);
  curveVertex(580, 500); //bottomright
  curveVertex(482, 500); //bottomleft
  curveVertex(480, 435);
  curveVertex(468, 401); //topleft
  curveVertex(450, 400);
  endShape();

  //front flowers
  if (season == "Spring")
  {
    fill(fR, fG, fB);
    ellipse(140, 370, 15, 15);
    ellipse(130, 375, 11, 11);
    ellipse(138, 382, 8, 8);
    ellipse(120, 373, 7, 7);
    ellipse(153, 371, 6, 6);
    ellipse(90, 370, 9, 9);
    ellipse(82, 376, 6, 6);
    ellipse(76, 372, 4, 4);
    //
    ellipse(650, 400, 10, 10);
    ellipse(640, 394, 7, 7);
    ellipse(624, 397, 5, 5);
    //
    ellipse(560, 400, 7, 7);
    ellipse(567, 405, 9, 9);
    //
    ellipse(460, 410, 8, 8);
    ellipse(450, 408, 7, 7);
    ellipse(455, 414, 5, 5);
    ellipse(437, 410, 4, 4);
  }
  
  //fog
  if (fog == true) tint(255, 60);
  if (snow == true) tint(255, 30);
  if (rain == true) tint(255, 20);
  if (fog != true && snow != true && rain != true) tint(255, 10);
  image(foggy, 0, 0, width, height);

  //front tree
  fill(tR, tG, tB);
  rectMode(CENTER);
  rect(275, 400, 30, 400);
  fill(gbR-40, gbG-40, 66);
  triangle(275, -100,  175, 400,  375, 400);
  
  //front bush
  fill(bsR-15, bsG-15, bsB);
  ellipse(30, 460, 70, 70);
  ellipse(90, 450, 90, 90);
  ellipse(140, 455, 50, 50);
  ellipse(165, 468, 30, 30);
  ellipse(55, 425, 30, 30);

  if (rain == true)
  {
    for (int i = 0; i < drops.length; i++)
    {
      drops[i].fall();
    }
    for (int i = 0; i < drops2.length; i++)
    {
      drops2[i].fall();
    }
  }
  
  if (snow == true)
  {
    for (int i = 0; i < flakes.length; i++)
    {
      flakes[i].fall();
    }
    for (int i = 0; i < flakes2.length; i++)
    {
      flakes2[i].fall();
    }
  }

  if (fog == true) tint(255, 140);
  if (snow == true) tint(255, 120);
  if (rain == true) tint(255, 100);
  if (fog != true && snow != true && rain != true) tint(255, 70);
  image(foggy, 0, 0, width, height);

  //window frame
  int frameW = 30;
  rectMode(CORNER);
  fill(240, 240, 244);
  rect(0, 0, frameW, height);
  rect(0, 0, width, frameW);
  rect(0, height-frameW, width, frameW);
  rect(width-frameW, 0, frameW, height);
  rectMode(CENTER);
  rect(width/2, height/2, width, frameW);
  rect(width/2, height/2, frameW, height);
  //
  fill(160, 160, 164);
  quad(frameW/2, height/2,  frameW, (height/2)+(frameW/2),  (width/2)-(frameW/2), (height/2)+(frameW/2),  width/2, height/2);
  quad(frameW/2, frameW/2,  frameW/2, height/2,  frameW, (height/2)-(frameW/2),  frameW, frameW);
  quad(frameW/2, frameW/2,  width/2, frameW/2,  (width/2)-(frameW/2), frameW,  frameW, frameW);
  quad(frameW/2, height/2,  frameW, (height/2)+(frameW/2),  frameW, height-frameW,  frameW/2, height-(frameW/2));
  quad(0, height,  width, height,  width-(frameW/2), height-(frameW/2),  frameW/2, height-(frameW/2));
  quad(width, 0,  width, height,  width-(frameW/2),  height-(frameW/2),  width-(frameW/2), frameW/2);
  quad(width/2, frameW/2,  (width/2)+(frameW/2), frameW,  width-frameW, frameW,  width-(frameW/2), frameW/2);
  quad(width/2, frameW/2,  width/2, height/2,  (width/2)+(frameW/2), (height/2)-(frameW/2),  (width/2)+(frameW/2), frameW);
  quad(width/2, height/2,  width/2, height-(frameW/2),  (width/2)+(frameW/2), height-frameW,  (width/2)+(frameW/2), (height/2)+(frameW/2));
  quad(width/2, height/2,  width-(frameW/2), height/2,  width-frameW, (height/2)+(frameW/2),  width/2, (height/2)+(frameW/2));
  //
  tint(255, 210);
  image(frame, 0, 0, width, height);

  //testing
  //weather = "Rain Showers";
  //weather = "Fog";
  //weather = "Snow";
  //weather = "Clear";
  //weather = "Cloudy";
  //weather = "Mostly Cloudy";
  //weather = "Freezing Rain";
  //season = "Spring";
  //season = "Summer";
  //season = "Autumn";
  //season = "Winter";
  /*
  if (mouseY < height/4) season = "Spring";
  if (mouseY >= height/4 && mouseY < height/2) season = "Summer";
  if (mouseY >= height/2 && mouseY < height*3/4) season = "Autumn";
  if (mouseY >= height*3/4) season = "Winter";
  */
  //moonphase = "Waxing Crescent";
  //moonphase = "First Quarter";
  //moonphase = "Waxing Gibbous";
  //moonphase = "Full Moon";
  //moonphase = "Waning Gibbous";
  //moonphase = "Last Quarter";
  //moonphase = "Waning Crescent";
  //moonphase = "New Moon";
}

class fastRain
{
  float x = random(width*3/2);
  float y = random(-height);

  void fall()
  {
    y = y + 25;
    x = x - 13;
    stroke(30, 10, 100, 150);
    line(x, y, x-6, y+20);
    line(x+45, y+45, x+39, y+65);
    line(x-20, y+38, x-26, y+58);
    line(x-40, y+10, x-46, y+30);
    line(x+13, y-19, x+7, y+1);
    noStroke();

    if (y > height)
    {
      x = random(width*3/2);
      y = random(-200);
    }
  }
}

class slowRain
{
  float x = random(width*3/2);
  float y = random(-height);

  void fall()
  {
    y = y + 20;
    x = x - 10;
    stroke(30, 10, 100, 150);
    line(x, y, x-3, y+10);
    line(x+45, y+45, x+42, y+55);
    line(x-20, y+38, x-23, y+48);
    line(x-40, y+10, x-43, y+20);
    line(x+13, y-19, x+10, y-9);
    noStroke();

    if (y > height)
    {
      x = random(width*3/2);
      y = random(-200);
    }
  }
}

class fastSnow
{
  float x = random(width);
  float y = random(-height);

  void fall()
  {
    y = y + 5;
    fill(255, 230);
    ellipse(x, y, 8, 8);

    if (y > height)
    {
      x = random(width);
      y = random(-200);
    }
  }
}

class slowSnow
{
  float x = random(width);
  float y = random(-height);

  void fall()
  {
    y = y + 3;
    fill(255, 230);
    ellipse(x, y, 5, 5);

    if (y > height)
    {
      x = random(width);
      y = random(-200);
    }
  }
}

class cloudy
{
  PImage img = imgs[round(random(3))];
  float x = random(-2*width);
  float y = random(-50, height-100);
  float dx = random(0.5, 3);
  
  void floaty()
  {
    x = x + dx;
    fill(230, 230, 255);
    image(img, x, y);
    
    if (x > width)
    {
      x = random(-2*width-200);
      y = random(-50, height-100);
    }
  }
}

