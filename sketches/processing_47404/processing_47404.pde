
int nobars = 7;
Bar[] bars = new Bar[nobars];
Bar[] bars2 = new Bar[nobars];

PFont font;

PImage bg;
PImage aviemorebg;
PImage aultbg;
PImage altnabg;
PImage lochbg;
PImage skyebg;
PImage tullochbg;
PImage aboynebg;

float aviemoreTemp = 0.0;
float aultTemp = 0.0;
float altnaTemp = 0.0;
float lochTemp = 0.0;
float skyeTemp = 0.0;
float tullochTemp = 0.0;
float aboyneTemp = 0.0;

int aviemoreWind = 0;
int aultWind = 0;
int altnaWind = 0;
int lochWind = 0;
int skyeWind = 0;
int tullochWind = 0;
int aboyneWind = 0;

PImage aviemoreWeather;
PImage aultWeather;
PImage altnaWeather;
PImage lochWeather;
PImage skyeWeather;
PImage tullochWeather;
PImage aboyneWeather;

boolean tempClick = false;
boolean windClick = false;
boolean weatherClick = false;

PImage map0;


/////////////////////////////////////////////////////Here begins the setup() function///////////////////////////////////////////////////////


void setup() {
  size(900, 600);

  map0 = loadImage("map0.png");

  font = loadFont("MaiandraGD-DemiBold-48.vlw");
  textFont(font, 40);



  String[] page = loadStrings("http://www.metoffice.gov.uk/weather/uk/observations/");
  getData(page);
//  getTemps(page);
//  getWind(page);
//  getImages(page);


  for (int p = 0; p<page.length;p++) {
    println (p + ". " + page[p]);
  }  

  for (int i = 0; i<nobars;i++) {
    bars[i] = new Bar();
    bars2[i] = new Bar();
  }

  int barXs =50;
  for (int g = 0;g<nobars;g++) {
    bars[g].barX =  barXs;
    bars2[g].barX = barXs;
    barXs+=50;
  }

  bars[0].origTemp = aviemoreTemp;
  bars[1].origTemp = aultTemp;
  bars[2].origTemp = altnaTemp;
  bars[3].origTemp = lochTemp;
  bars[4].origTemp = skyeTemp;
  bars[5].origTemp = tullochTemp;
  bars[6].origTemp = aboyneTemp;

  bars2[0].wind = aviemoreWind;
  bars2[1].wind = aultWind;
  bars2[2].wind = altnaWind;
  bars2[3].wind = lochWind;
  bars2[4].wind = skyeWind;
  bars2[5].wind = tullochWind;
  bars2[6].wind = aboyneWind;

  bars[0].barTemp = (height/2)-(int)(aviemoreTemp*10);
  bars[1].barTemp = (height/2)-(int)(aultTemp*10);
  bars[2].barTemp = (height/2)-(int)(altnaTemp*10);
  bars[3].barTemp = (height/2)-(int)(lochTemp*10);
  bars[4].barTemp = (height/2)-(int)(skyeTemp*10);
  bars[5].barTemp = (height/2)-(int)(tullochTemp*10);
  bars[6].barTemp = (height/2)-(int)(aboyneTemp*10);

  bars2[0].barWind = (height/2)- aviemoreWind*5;
  bars2[1].barWind = (height/2)- aultWind*5;
  bars2[2].barWind = (height/2)- altnaWind*5;
  bars2[3].barWind = (height/2)- lochWind*5;
  bars2[4].barWind = (height/2)- skyeWind*5;
  bars2[5].barWind = (height/2)- tullochWind*5;
  bars2[6].barWind = (height/2)- aboyneWind*5;


  bars[0].name = "Aviemore";
  bars[1].name = "Aultbea";
  bars[2].name = "Altnaharra";
  bars[3].name = "South Uist";
  bars[4].name = "Isle of Skye";
  bars[5].name = "Tulloch Bridge";
  bars[6].name = "Machrihanish";

  bars2[0].name = "Aviemore";
  bars2[1].name = "Aultbea";
  bars2[2].name = "Altnaharra";
  bars2[3].name = "South Uist";
  bars2[4].name = "Isle of Skye";
  bars2[5].name = "Tulloch Bridge";
  bars2[6].name = "Machrihanish";

  for (int z = 0; z<bars.length; z++) {
    bars[z].barNo = z;
    bars2[z].barNo = z;
  }
}


////////////////////////////////////////////Here begins the draw() function//////////////////////////////////////////////////////////////////

void draw() {

  bg = loadImage("bg1.jpg");
  aviemorebg = loadImage("aviemore.jpg");
  aultbg = loadImage("aultbea.jpg");
  altnabg = loadImage("altnaharra.jpg");
  lochbg = loadImage("southuist.jpg");
  skyebg = loadImage("skye.jpg");
  tullochbg = loadImage("tullochbridge.jpg");
  aboynebg = loadImage("machrihanish.jpg");
  background(bg);
  //background(213, 255, 175);


  smooth(); 
  noStroke();
  int buttond = 520;
  for (int b = 0; b<3; b++) { 
    fill(150);

    if (mouseX>=buttond && mouseX<=(buttond + 100)) {
      if (mouseY>=0 && mouseY<=50) {
        strokeWeight(8);
        stroke(255);
      }
    }
    else {
      noStroke();
    }

    rect(buttond, 0, 100, 50);
    fill(0);




    if (b==0) {
      textFont(font, 15);
      text("Temperature", buttond+5, 40);
    }
    if (b==1) {
      textFont(font, 15);
      text("Wind Speed", buttond+5, 40);
    }
    if (b==2) {
      textFont(font, 20);
      text("Weather", buttond+5, 40);
    }


    buttond+=120;
  }


  image(map0, 525, 200, 268, 394);

  if (tempClick==true) {

    textFont(font, 40);
    fill(0);
    text("TEMPERATURE REPORT:", 10, 60);


    for (int i = 0;i<bars.length;i++) {
      bars[i].display();
      bars[i].update();

      if (mouseX >= bars[i].barX && mouseX <= (bars[i].barX + 30)) {
        if (bars[i].neg == false) {
          if (mouseY >=bars[i].barY && mouseY <= (height/2)) {
            fill(255, 0, 0);


            if (i==0) {
              background(aviemorebg);
              bars[0].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(695, 380, 20, 20);
            }
            if (i==1) {
              background(aultbg);
              bars[0].display();
              bars[1].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(624, 332, 20, 20);
            }
            if (i==2) {
              background(altnabg);
              bars[0].display();
              bars[1].display();
              bars[2].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(670, 290, 20, 20);
            }
            if (i==3) {
              background(lochbg);
              bars[0].display();
              bars[1].display();
              bars[2].display();
              bars[3].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(545, 370, 20, 20);
            }
            if (i==4) {
              background(skyebg);
              bars[0].display();
              bars[1].display();
              bars[2].display();
              bars[3].display();
              bars[4].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(613, 375, 20, 20);
            }
            if (i==5) {
              background(tullochbg);
              bars[0].display();
              bars[1].display();
              bars[2].display();
              bars[3].display();
              bars[4].display();
              bars[5].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(665, 405, 20, 20);
            }
            if (i==6) {
              background(aboynebg);
              bars[0].display();
              bars[1].display();
              bars[2].display();
              bars[3].display();
              bars[4].display();
              bars[5].display();
              bars[6].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(613, 520, 20, 20);
            }



            //fill(150);
            //fill(113, 255, 75);
            fill(0);
            textFont(font, 40);
            text(bars[i].name, 520, 130);
            textFont(font, 25);      
            text("Current Temperature: " + nf(bars[i].origTemp, bars[i].dp, 1) + "°C", 520, 160);
          }
        }
        //      if (bars[i].neg == true) {
        //        if (mouseY <= bars[i].barY && mouseY >= (height/2)) {
        //          fill(255, 0, 0);
        //          ellipse(20, 20, 20, 20);
        //        }
        //      }
      }
    }
  }


  if (windClick == true) {

    textFont(font, 40);
    fill(0);
    text("WIND SPEED REPORT:", 10, 60);


    for (int i = 0;i<bars2.length;i++) {
      bars2[i].display();
      bars2[i].update();

      if (mouseX >= bars2[i].barX && mouseX <= (bars2[i].barX + 30)) {
        if (bars2[i].neg == false) {
          if (mouseY >=bars2[i].barY && mouseY <= (height/2)) {
            fill(255, 0, 0);


            if (i==0) {
              background(aviemorebg);
              bars2[0].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(695, 380, 20, 20);
            }
            if (i==1) {
              background(aultbg);
              bars2[0].display();
              bars2[1].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(624, 332, 20, 20);
            }
            if (i==2) {
              background(altnabg);
              bars2[0].display();
              bars2[1].display();
              bars2[2].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(670, 290, 20, 20);
            }
            if (i==3) {
              background(lochbg);
              bars2[0].display();
              bars2[1].display();
              bars2[2].display();
              bars2[3].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(545, 370, 20, 20);
            }
            if (i==4) {
              background(skyebg);
              bars2[0].display();
              bars2[1].display();
              bars2[2].display();
              bars2[3].display();
              bars2[4].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(613, 375, 20, 20);
            }
            if (i==5) {
              background(tullochbg);
              bars2[0].display();
              bars2[1].display();
              bars2[2].display();
              bars2[3].display();
              bars2[4].display();
              bars2[5].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(665, 405, 20, 20);
            }
            if (i==6) {
              background(aboynebg);
              bars2[0].display();
              bars2[1].display();
              bars2[2].display();
              bars2[3].display();
              bars2[4].display();
              bars2[5].display();
              bars2[6].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(613, 520, 20, 20);
            }



            //fill(150);
            //fill(113, 255, 75);
            fill(0);
            textFont(font, 40);
            text(bars2[i].name, 520, 130);
            textFont(font, 25);      
            text("Current Wind Speed: " + bars2[i].wind + " mph", 520, 160);
          }
        }
      }
    }
  }




  if (weatherClick == true) {
    noStroke();


    image(aviemoreWeather, 675, 360, 60, 60);


    image(aultWeather, 604, 312, 60, 60);


    image(altnaWeather, 650, 270, 60, 60);


    image(lochWeather, 525, 350, 60, 60);


    image(skyeWeather, 593, 355, 60, 60);


    image(tullochWeather, 645, 385, 60, 60);


    image(aboyneWeather, 593, 500, 60, 60);

    textFont(font, 40);
    fill(0);
    text("WEATHER SUMMARY:", 10, 60);

    bars[0].windText = 125;
    bars[1].windText = 105;
    bars[2].windText = 135;
    bars[3].windText = 128;
    bars[4].windText = 193;
    bars[5].windText = 168;
    bars[6].windText = 160;



    //fill(150);
    fill(240, 235, 90);
    //fill(0);
    int sumTextStart = 250;
    textFont(font, 20);
    for (int w = 0; w<bars.length;w++) {
      text(bars[w].name + " - Temperature: " + nf(bars[w].origTemp, bars[w].dp, 1) + "°C", 10, sumTextStart);
      text("Wind Speed: " + bars2[w].wind + " mph", bars[w].windText, sumTextStart+20);
      sumTextStart +=50;
    }
  }
}



/////////////////////////////////////Here begin the user-defined functions//////////////////////////////////////////////////////////////////


void getData(String[] page) {
  
  //AVIEMORE
  String p = "";
  for (int i = 0;i<page.length;i++) {
    p += page[i];
  }
  String startMark = "aviemore_latest_weather.html";
  String endMark = "</tr>";
  int start = p.indexOf(startMark);
  p = p.substring(start+startMark.length(), p.length());
  int end = p.indexOf(endMark);
  String ss = p.substring(0, end);
  String[] aviemoreBit1 = ss.split(">");
  String[] aviemoreBit2 = aviemoreBit1[7].split("<");
  String[] aviemoreWindBit = aviemoreBit1[13].split("<");
  String[] aviemoreWeatherBit = split(aviemoreBit1[4], '"');
  aviemoreWind = int(aviemoreWindBit[0]); 
  aviemoreTemp = new Float(aviemoreBit2[0]);
  aviemoreWeather = loadImage("http://www.metoffice.gov.uk" + aviemoreWeatherBit[1]);
  
  //AULTBEA
  p = "";
  for (int i = 0;i<page.length;i++) {
    p += page[i];
  }
  startMark = "aultbea_latest_weather.html";
  endMark = "</tr>";
  start = p.indexOf(startMark);
  p = p.substring(start+startMark.length(), p.length());
  end = p.indexOf(endMark);
  ss = p.substring(0, end);
  String[] aultBit1 = ss.split(">");
  String[] aultBit2 = aultBit1[7].split("<");
  String[] aultWindBit = aultBit1[13].split("<");
  String[] aultWeatherBit = split(aultBit1[4], '"');
  aultWind = int(aultWindBit[0]); 
  aultTemp = new Float(aultBit2[0]);
  aultWeather = loadImage("http://www.metoffice.gov.uk" + aultWeatherBit[1]);
  
  
  //ALTNAHARRA
  p = "";
  for (int i = 0;i<page.length;i++) {
    p += page[i];
  }
  startMark = "altnaharra_latest_weather.html";
  endMark = "</tr>";
  start = p.indexOf(startMark);
  p = p.substring(start+startMark.length(), p.length());
  end = p.indexOf(endMark);
  ss = p.substring(0, end);
  String[] altnaBit1 = ss.split(">");
  String[] altnaBit2 = altnaBit1[7].split("<");
  String[] altnaWindBit = altnaBit1[13].split("<");
  String[] altnaWeatherBit = split(altnaBit1[4], '"');
  altnaWind = int(altnaWindBit[0]); 
  altnaTemp = new Float(altnaBit2[0]);
  altnaWeather = loadImage("http://www.metoffice.gov.uk" + altnaWeatherBit[1]);
  
  
  //SKYE LUSA
  p = "";
  for (int i = 0;i<page.length;i++) {
    p += page[i];
  }
  startMark = "skye_lusa_latest_weather.html";
  endMark = "</tr>";
  start = p.indexOf(startMark);
  p = p.substring(start+startMark.length(), p.length());
  end = p.indexOf(endMark);
  ss = p.substring(0, end);
  String[] skyeBit1 = ss.split(">");
  String[] skyeBit2 = skyeBit1[7].split("<");
  String[] skyeWindBit = skyeBit1[13].split("<");
  String[] skyeWeatherBit = split(skyeBit1[4], '"');
  skyeWind = int(skyeWindBit[0]); 
  skyeTemp = new Float(skyeBit2[0]);
  skyeWeather = loadImage("http://www.metoffice.gov.uk" + skyeWeatherBit[1]);


  //SOUTH UIST
  p = "";
  for (int i = 0;i<page.length;i++) {
    p += page[i];
  }
  startMark = "south_uist_latest_weather.html";
  endMark = "</tr>";
  start = p.indexOf(startMark);
  p = p.substring(start+startMark.length(), p.length());
  end = p.indexOf(endMark);
  ss = p.substring(0, end);
  String[] lochBit1 = ss.split(">");
  String[] lochBit2 = lochBit1[7].split("<");
  String[] lochWindBit = lochBit1[13].split("<");
  String[] lochWeatherBit = split(lochBit1[4], '"');
  lochWind = int(lochWindBit[0]); 
  lochTemp = new Float(lochBit2[0]);
  lochWeather = loadImage("http://www.metoffice.gov.uk" + lochWeatherBit[1]);
  
  
  //TULLOCH BRIDGE
  p = "";
  for (int i = 0;i<page.length;i++) {
    p += page[i];
  }
  startMark = "tulloch_bridge_latest_weather.html";
  endMark = "</tr>";
  start = p.indexOf(startMark);
  p = p.substring(start+startMark.length(), p.length());
  end = p.indexOf(endMark);
  ss = p.substring(0, end);
  String[] tullochBit1 = ss.split(">");
  String[] tullochBit2 = tullochBit1[7].split("<");
  String[] tullochWindBit = tullochBit1[13].split("<");
  String[] tullochWeatherBit = split(tullochBit1[4], '"');
  tullochWind = int(tullochWindBit[0]); 
  tullochTemp = new Float(tullochBit2[0]);
  tullochWeather = loadImage("http://www.metoffice.gov.uk" + tullochWeatherBit[1]);
  
  
  //MACHRIHANISH
  p = "";
  for (int i = 0;i<page.length;i++) {
    p += page[i];
  }
  startMark = "machrihanish_latest_weather.html";
  endMark = "</tr>";
  start = p.indexOf(startMark);
  p = p.substring(start+startMark.length(), p.length());
  end = p.indexOf(endMark);
  ss = p.substring(0, end);
  String[] aboyneBit1 = ss.split(">");
  String[] aboyneBit2 = aboyneBit1[7].split("<");
  String[] aboyneWindBit = aboyneBit1[13].split("<");
  String[] aboyneWeatherBit = split(aboyneBit1[4], '"');
  aboyneWind = int(aboyneWindBit[0]); 
  aboyneTemp = new Float(aboyneBit2[0]);
  aboyneWeather = loadImage("http://www.metoffice.gov.uk" + aboyneWeatherBit[1]);
  
  
}












void getTemps(String[] page) {



  //String[] aviemoreBit1 = page[366].split(">");
//String[] aviemoreBit2 = aviemoreBit1[1].split("<");
//aviemoreTemp = new Float(aviemoreBit2[0]);

  //String[] aultBit1 = page[352].split(">");
  //String[] aultBit2 = aultBit1[1].split("<");
  //aultTemp = new Float(aultBit2[0]);


  //String[] altnaBit1 = page[352].split(">");
  //String[] altnaBit2 = altnaBit1[1].split("<");
  //altnaTemp = new Float(altnaBit2[0]);


  //String[] lochBit1 = page[408].split(">");
  //String[] lochBit2 = lochBit1[1].split("<");
  //lochTemp = new Float(lochBit2[0]);


  //String[] skyeBit1 = page[394].split(">");
  //String[] skyeBit2 = skyeBit1[1].split("<");
  //skyeTemp = new Float(skyeBit2[0]);


  String[] tullochBit1 = page[436].split(">");
  String[] tullochBit2 = tullochBit1[1].split("<");
  tullochTemp = new Float(tullochBit2[0]);


  String[] aboyneBit1 = page[618].split(">");
  String[] aboyneBit2 = aboyneBit1[1].split("<");
  aboyneTemp = new Float(aboyneBit2[0]);
}





void getWind(String[] page) {

 // String[] aviemoreBit1 = page[369].split(">");
  //String[] aviemoreBit2 = aviemoreBit1[1].split("<");
  //aviemoreWind = int(aviemoreBit2[0]);


  //String[] aultBit1 = page[355].split(">");
  //String[] aultBit2 = aultBit1[1].split("<");
  //aultWind = int(aultBit2[0]);


 // String[] altnaBit1 = page[355].split(">");
 // String[] altnaBit2 = altnaBit1[1].split("<");
 // altnaWind = int(altnaBit2[0]);


  //String[] lochBit1 = page[411].split(">");
  //String[] lochBit2 = lochBit1[1].split("<");
  //lochWind = int(lochBit2[0]);


  //String[] skyeBit1 = page[397].split(">");
  //String[] skyeBit2 = skyeBit1[1].split("<");
  //skyeWind = int(skyeBit2[0]);


  String[] tullochBit1 = page[439].split(">");
  String[] tullochBit2 = tullochBit1[1].split("<");
  tullochWind = int(tullochBit2[0]);


  String[] aboyneBit1 = page[621].split(">");
  String[] aboyneBit2 = aboyneBit1[1].split("<");
  aboyneWind = int(aboyneBit2[0]);
}



void getImages(String [] page) {

  //String []url = split(page[365], '"');
  //aviemoreWeather = loadImage("http://www.metoffice.gov.uk" + url[3]);

  //String []url2 = split(page[351], '"');
  //aultWeather = loadImage("http://www.metoffice.gov.uk" + url2[3]);

  //String []url3 = split(page[351], '"');
  //altnaWeather = loadImage("http://www.metoffice.gov.uk" + url3[3]);

  //String []url4 = split(page[407], '"');
  //lochWeather = loadImage("http://www.metoffice.gov.uk" + url4[3]);

  //String []url5 = split(page[393], '"');
  //skyeWeather = loadImage("http://www.metoffice.gov.uk" + url5[3]);

  String []url6 = split(page[435], '"');
  tullochWeather = loadImage("http://www.metoffice.gov.uk" + url6[3]);

  String []url7 = split(page[617], '"');
  aboyneWeather = loadImage("http://www.metoffice.gov.uk" + url7[3]);
}




void mouseClicked() {
  if (mouseX>=520 && mouseX<=620) {
    if (mouseY>=0 && mouseY<=50) {
      tempClick = true;
      windClick = false;
      weatherClick = false;
    }
  }

  if (mouseX>=640 && mouseX<=740) {
    if (mouseY>=0 && mouseY<=50) {
      tempClick = false;
      windClick = true;
      weatherClick = false;
    }
  }

  if (mouseX>=760 && mouseX<=860) {
    if (mouseY>=0 && mouseY<=50) {
      tempClick = false;
      windClick = false;
      weatherClick = true;
    }
  }
}




///////////////////////////////////////////////////Here begin the classes///////////////////////////////////////////////////////////////////



class Bar {
  int barX;
  int barY;
  int barTemp;
  int barNo;
  int barTempMax;
  float origTemp;
  int barSize;
  boolean neg;
  int dp;
  String name;
  int wind;
  int barWind;
  int windText;

  Bar() {
    barX = 0;
    barY = (height/2);
  }

  void display() {

    if (tempClick==true) {

      if (origTemp<10.0) {
        dp=1;
      }
      else if (origTemp>=10.0) {
        dp=2;
      }

      noStroke();

      if ((barY) <=(height/2) ) {
        fill(15, 41, 139);
      }
      if (barY<=(height/2)-52) {
        fill(71, 169, 242);
      }
      if (barY <=(height/2)-100) {
        fill(35, 216, 151);
      }
      if (barY <=(height/2)-150) {
        fill(245, 231, 72);
      }

      rect(barX, barY, 30, barSize);
    }




    if (windClick == true) {
      noStroke();

      if ((barY) <=(height/2) ) {
        fill(255, 211, 211);
      }
      if (barY<=(height/2)-50) {
        fill(255, 134, 134);
      }
      if (barY <=(height/2)-100) {
        fill(255, 70, 70);
      }
      if (barY <=(height/2)-150) {
        fill(255, 0, 0);
      }

      rect(barX, barY, 30, barSize);
    }
  }

  void update() {

    if (tempClick == true) {


      if (barY>=barTemp) {
        barSize = (height/2) - barY;
        barY--;
      }
      if (barTemp>(height/2)) {
        if (barSize<=(barTemp - (height/2))) {
          barSize++;
        }
      }

      //    if (barY<=barTemp) {
      //      text(origTemp, barX-15, barY);
      //    }

      if (origTemp < 0.0) {
        if (mouseX >= barX && mouseX <= (barX + 30)) {
          if (mouseY <= (height/2)+barSize && mouseY >= (height/2)) {
            fill(255, 0, 0);


            if (barNo==0) {
              background(aviemorebg);
              bars[0].display();
              bars[1].display();
              bars[2].display();
              bars[3].display();
              bars[4].display();
              bars[5].display();
              bars[6].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(695, 380, 20, 20);
            }
            if (barNo==1) {
              background(aultbg);
              bars[0].display();
              bars[1].display();
              bars[2].display();
              bars[3].display();
              bars[4].display();
              bars[5].display();
              bars[6].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(624, 332, 20, 20);
            }
            if (barNo==2) {
              background(altnabg);
              bars[0].display();
              bars[1].display();
              bars[2].display();
              bars[3].display();
              bars[4].display();
              bars[5].display();
              bars[6].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(670, 290, 20, 20);
            }
            if (barNo==3) {
              background(lochbg);
              bars[0].display();
              bars[1].display();
              bars[2].display();
              bars[3].display();
              bars[4].display();
              bars[5].display();
              bars[6].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(655, 340, 20, 20);
            }
            if (barNo==4) {
              background(skyebg);
              bars[0].display();
              bars[1].display();
              bars[2].display();
              bars[3].display();
              bars[4].display();
              bars[5].display();
              bars[6].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(613, 375, 20, 20);
            }
            if (barNo==5) {
              background(tullochbg);
              bars[0].display();
              bars[1].display();
              bars[2].display();
              bars[3].display();
              bars[4].display();
              bars[5].display();
              bars[6].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(665, 405, 20, 20);
            }
            if (barNo==6) {
              background(aboynebg);
              bars[0].display();
              bars[1].display();
              bars[2].display();
              bars[3].display();
              bars[4].display();
              bars[5].display();
              bars[6].display();
              image(map0, 525, 200, 268, 394);
              fill(255, 0, 0);
              ellipse(745, 385, 20, 20);
            }




            //fill(150);
            fill(0);
            textFont(font, 40);
            text(name, 520, 130);
            textFont(font, 25);      
            text("Current Temperature: " + nf(origTemp, dp, 1) + "°C", 520, 160);
          }
        }
      }
    }




    else if (windClick == true) {
      if (barY>=barWind) {
        barSize = (height/2) - barY;
        barY--;
      }
    }
  }
}












