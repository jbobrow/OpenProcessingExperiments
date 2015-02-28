
import controlP5.*;
ControlP5 controlP5;

int mintemp = 20;
int maxtemp = 30;
int rainAmount = 10;
int rainChance = 40;
int windStrength = 50;
int humidity = 30;

int temp = ((mintemp+maxtemp)/2);

PShape cloud;
PShape rainCloud;
PShape frost;

PFont tempfont;
PFont precisfont;

String precis = "";

void setup () {

  size (320, 480);
  colorMode (HSB);
  noStroke ();
  ellipseMode (CENTER);
  smooth();

  tempfont = createFont ("Futura", 48);
  precisfont = createFont ("Century", 72);

  controlP5 = new ControlP5(this);
  controlP5.setColorForeground(color(70));
  controlP5.setColorBackground(color(255));
  controlP5.addSlider("mintemp", 0, 40, 20, 20, 260, 230, 20);
  controlP5.addSlider("maxtemp", 0, 40, 30, 20, 285, 230, 20);
  controlP5.addSlider("rainChance", 0, 100, 40, 20, 320, 230, 20);
  controlP5.addSlider("windStrength", 0, 120, 30, 20, 345, 230, 20);
  controlP5.addSlider("rainAmount", 00, 100, 10, 20, 370, 230, 20);
  controlP5.addSlider("humidity", 00, 100, 30, 20, 395, 230, 20);

  cloud = loadShape ("cloud.svg");
  rainCloud = loadShape ("rainCloud.svg");
  cloud.disableStyle();
  rainCloud.disableStyle();
  frost = loadShape ("frost.svg");
  frost.disableStyle();
}

void draw () {
  
  keyNum();
  tempgraph();

  fill (20, 0, 120);
  rect (0, 239, 320, 320);

  textFont (precisfont, 24);
  fill(255);
  textAlign(CENTER);
  text (precis, 160, 460);
}


void tempgraph () {
  noStroke();
  fill (255);
  rect ( 0, 209, width, 30);
  strokeWeight (22);
  stroke (70);
  line (mintemp*8, 224, maxtemp*8, 224); 
  noStroke();

  fill(230);
  textAlign(CENTER);
  textFont (tempfont, 12);

  text (mintemp, (mintemp*8)+6, 229);
  text (maxtemp, (maxtemp*8)-6, 229);
}

void keyPressed () {
  keyNum();
}


void keyNum () {
  if (key == 'q') {
    sunny();
  }
  if (key == 'w') {
    clear();
  }
  if (key == 'e') {
    partlycloudy();
  }  
  if (key == 'r') {
    cloudy();
  }
  if (key == 's') {
    rain();
  }
  if (key == 'i') {
    lightrain();
  }
  if (key == 'h') {
    storm();
  }
  if (key == 'j') {
    lightshower();
  }
  if (key == 'a') {
    shower();
  }
  if (key == 'y') {
    hazy();
  }
  if (key == 'p') {
    fog();
  }
  if (key == 'g') {
    snow();
  }
  if (key == 'o') {
    windy();
  }
  if (key == 'd') {
    dusty();
  } 
  if (key == 'f') {
    frosty();
  }
}

void sunny () {
  background (130, ((mintemp+maxtemp)/2)*5.8, 245);
  fill (35, ((mintemp+maxtemp)/2)*4.5, 250);
  ellipse (160, 104, ((mintemp+maxtemp)/2)*5, ((mintemp+maxtemp)/2)*5);
  precis = "sunny";
}

void clear () {
  background (133, ((mintemp+maxtemp)/2)*5.8, 245);
  cloud.disableStyle();
  fill(260-(rainChance/2), rainChance*3);
  shape(cloud, 40, 70, 72, 39);
  fill(260-(rainChance/2), rainChance*3);
  shape(cloud, 210, 120, 88, 47);

  precis = "clear";
}


void partlycloudy () {
  background (133, ((mintemp+maxtemp)/2)*5.8, 245);

  cloud.disableStyle();
  fill(10, 10, 280-(rainChance), rainChance*3);
  shape(cloud, 50, 60, 80, 43);
  fill (35, ((mintemp+maxtemp)/2)*4.5, 250);
  ellipse (160, 104, ((mintemp+maxtemp)/2)*5, ((mintemp+maxtemp)/2)*5);
  fill(10, 10, 280-(rainChance));
  shape(cloud, 100, 100, 160, 86);

  precis = "partly cloudy";
}

void cloudy () {
  background (133, ((mintemp+maxtemp)/2)+10, 255);
  //RAIN
  stroke (200, (rainChance/2));
  strokeWeight(1+(rainAmount/6));   
  for (int i=0; i<6; i++) {
    line (100+(i*25), 110, (100+(i*25))-(windStrength/6), 180);
  }
  //CLOUDS
  rainCloud.disableStyle();
  noStroke();
  fill(10, 10, 280-(rainChance*1.8));
  shape(rainCloud, 65, 35, 198, 100);
  cloud.disableStyle();
  fill(10, 10, 280-(rainChance*2.1));
  shape(cloud, 115, 80, 120, 65);

  precis = "cloudy";
}


void hazy () {
  background (130, ((mintemp+maxtemp)/2)*5.8, 245);
  fill (35, ((mintemp+maxtemp)/2)*4.5, 250);
  ellipse (160, 104, ((mintemp+maxtemp)/2)*5, ((mintemp+maxtemp)/2)*5);
  stroke(30, 220, 210);
  for (int i=0; i<5; i++) {
    strokeWeight(5+i);
  }
  precis = "hazy";
}


void lightrain () {

  background (133, ((mintemp+maxtemp)/2)*2, 245);
  //RAIN
  stroke (255-rainChance);
  strokeWeight(2+(humidity/7));   
  line(140, 130, 140-(windStrength/6), 170);
  line(170, 130, 170-(windStrength/6), 170);
  line(200, 130, 200-(windStrength/6), 170);
  for (int i=0; i<3; i++) {
    line (140+(i*30), 110, (140+(i*30))-(windStrength/6), 170);
  }

  //CLOUDS
  noStroke();
  rainCloud.disableStyle();
  fill(10, 10, 290-(rainChance));
  shape(rainCloud, 65, 35, 198, 100);
  cloud.disableStyle();
  stroke(240-(rainChance));
  strokeWeight(humidity/7);
  fill(10, 10, 260-(rainChance));
  shape(cloud, 105, 70, 135, 73);

  precis = "light rain";
}

void fog () {
  background (130, ((mintemp+maxtemp)/2)*1.8, 245);
  fill (35, ((mintemp+maxtemp)/2)*4.5, 250);
  ellipse (160, 104, ((mintemp+maxtemp)/2)*5, ((mintemp+maxtemp)/2)*5);
  stroke(130, 10, 250);
  for (int i=0; i<5; i++) {
    strokeWeight(5+i);
    line (-5, 100+(i*23), 325, 100+(i*23));
  }
  precis = "fog";
}



void storm () {

  background (133, ((mintemp+maxtemp)/2)-10, 100);
  //RAIN
  stroke (130, 50+(rainChance*3));
  strokeWeight(1+(humidity/15));   
  for (int i=0; i<6; i++) {
    line (100+(i*25), 110, (100+(i*25))-(windStrength/6), 190);
  }
  //CLOUDS
  stroke(160);
  strokeWeight(2+(humidity/5));
  rainCloud.disableStyle();
  fill(10, 10, 0, 0);
  shape(rainCloud, 65, 35, 198, 100);
  stroke(160);
  strokeWeight(2+(humidity/20));
  rainCloud.disableStyle();
  fill(10, 10, 280-rainChance);
  shape(rainCloud, 65, 35, 198, 100);
  stroke(160);
  strokeWeight(2+(humidity/16));
  cloud.disableStyle();
  fill(10, 10, 260-rainChance);
  shape(cloud, 115, 80, 120, 65);

  precis = "storm";
}



void shower () {

  background (133, ((mintemp+maxtemp)/2)*5.8, 245);  
  fill (35, ((mintemp+maxtemp)/2)*4.5, 250);
  ellipse (160, 104, ((mintemp+maxtemp)/2)*5, ((mintemp+maxtemp)/2)*5);
  //RAIN
  stroke (200, 40+(rainChance*3));
  strokeWeight(1+(rainAmount/10));   
  line(130, 160, 130-(windStrength/10), 180);
  line(165, 160, 165-(windStrength/10), 180);
  line(200, 160, 200-(windStrength/10), 180);
  line(147, 175, 147-(windStrength/10), 195);
  line(183, 175, 183-(windStrength/10), 195);
  rainCloud.disableStyle();
  noStroke();
  fill(270-rainChance );
  shape(rainCloud, 100, 75, 140, 74);
  stroke(10, 10, 280-rainChance);
  strokeWeight(2+(humidity/10)); 
  shape(rainCloud, 96, 75, 140, 74);
  precis = "shower";
}

void rain () {
  background (133, ((mintemp+maxtemp)/2)*2, 245);
  //RAIN
  stroke (200-(rainAmount*.8), 50+(rainChance*3));
  strokeWeight(1+(humidity/6));   
  for (int i=0; i<6; i++) {
    line (100+(i*25), 110, (100+(i*25))-(windStrength/6), 190);
  } 
  //CLOUDS
  rainCloud.disableStyle();
  stroke (240-(rainChance*1.1));
  strokeWeight(1+(humidity/8));   
  fill(10, 10, 260-(rainChance*1.05));
  shape(rainCloud, 65, 35, 198, 100);
  stroke(255-rainChance);
  strokeWeight(2+(humidity/10));
  cloud.disableStyle();
  fill(10, 10, 280-rainChance);
  shape(cloud, 120, 80, 120, 65);

  precis = "rain";
}

void snow () {
  background (130, ((mintemp+maxtemp)/2), 245);
  fill (255);
  for (int i=120; i <234; i+= 23) {
    for (int j=145; j <202; j+=23) {    
      ellipse(i, j, 12-(mintemp/2), 12-(mintemp/2));
    }
  }
  cloud.disableStyle();
  noStroke();
  fill(10, 10, 250 );
  shape(cloud, 90, 50, 160, 86);
  strokeWeight(2+(humidity/10));
  noFill();
  stroke(10, 10, 280-rainChance);
  shape(cloud, 90, 47, 160, 86);

  precis = "snow";
}


void lightshower () {

  background (133, ((mintemp+maxtemp)/2)*5.8, 245);  
  fill (35, ((mintemp+maxtemp)/2)*4.5, 250);
  ellipse (160, 104, ((mintemp+maxtemp)/2)*5, ((mintemp+maxtemp)/2)*5);
  //RAIN
  stroke (200, 40+(rainChance*3));
  strokeWeight(1+(rainAmount/10));   
  line(130, 160, 130-(windStrength/10), 180);
  line(165, 160, 165-(windStrength/10), 180);
  line(200, 160, 200-(windStrength/10), 180);
  line(147, 175, 147-(windStrength/10), 195);
  line(183, 175, 183-(windStrength/10), 195);
  cloud.disableStyle();
  noStroke();
  fill(10, 10, 250 );
  shape(cloud, 100, 75, 140, 74);

  precis = "light shower";
}




void windy () {

  fill(133, ((mintemp+maxtemp)/2)*5.2, 245);  
  rect (0, 0, width, 239);
  strokeWeight(2+(windStrength/10));
  stroke(255-rainChance);
  line (70-(windStrength/5), 55, 210, 55);
  line (90-(windStrength/3), 90, 260, 90);
  line (30-(windStrength/10), 125, 220, 125);
  line (50-(windStrength/6), 160, 170, 160);
  noStroke();
  fill(255-rainChance);
  ellipse(260, 76, 30+(windStrength/10), 30+(windStrength/10));
  ellipse(220, 139, 30+(windStrength/10), 30+(windStrength/10));

  precis = "windy";
}


void dusty () {

  fill(133, ((mintemp+maxtemp)/2)*5.2, 245);  
  rect (0, 0, width, 239);
  strokeWeight(2+(windStrength/10));
  //stroke(255-rainChance);
  stroke(55, 155, 200);
  line (70-(windStrength/5), 55, 210, 55);
  line (90-(windStrength/3), 90, 260, 90);
  line (30-(windStrength/10), 125, 220, 125);
  line (50-(windStrength/6), 160, 170, 160);
  noStroke();
  fill(55, 155, 200);
  ellipse(260, 76, 30+(windStrength/10), 30+(windStrength/10));
  ellipse(220, 139, 30+(windStrength/10), 30+(windStrength/10));

  precis = "dusty";
}

void frosty () {

  fill(133, ((mintemp+maxtemp)/2)*6, 245);  
  rect (0, 0, width, 239);
  frost.disableStyle();
  fill(255);
  strokeJoin(ROUND);
  strokeWeight(20-mintemp);
  stroke(255);
  shape(frost, 95, 35, 140, 140);

  precis = "frosty";
}





