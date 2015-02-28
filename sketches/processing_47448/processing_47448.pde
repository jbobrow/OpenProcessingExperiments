
//background image source: Wikipedia
//naughtiness statistics loosely based on: NationMaster.com
//weather info: WeatherReports.com

boolean anim = true;



int animbox=0; //init. position of white box in animation
int animtimer=250; //duration of animation in frames
PFont font1;
PFont font2;
PImage bg2;  //anim

//float snowX = 0; //fallingsnow position
//float snowY = 0;
//float m = random(30); //amount of snow

PImage bg3; //main
int clockX;
int clockY;
float clockMins;
float clockSize;

PFont font3;
PFont arial;
PFont arialB;
PFont arial3;

int zone;
int c;
float n;
String lang = "eng";
String extension;
int refresh; //to prevent DDOSing websites


String[] country = {
  "New Zealand", //0
  "New Zealand", 
  "Russia", 
  "Russia", //1
  "USA", //2
  "Japan", //3
  "South Korea", //3
  "China", //4
  "Thailand", //5
  "Burma", //6
  "India", //7
  "India", 
  "Nepal", 
  "Russia", //8
  "Russia", 
  "Saudi Arabia", //9
  "Greece", //10
  "Finland", //10
  "South Africa", 
  "Netherlands", //11
  "Germany", 
  "Italy", 
  "Poland", 
  "France", 
  "Scotland", //12
  "England", 
  "Portugal", 
  "Morocco", 
  "Iceland", 
  "Cape Verde", //13
  "Azores", 
  "Coffee break", //14
  "Canada", //15
  "Argentina", 
  "Argentina", //16
  "Venezuela", 
  "Chile", 
  "Peru", //17
  "Mexico", //18
  "USA", //19
  "USA", //20
  "USA", //20
  "Bagel break", //21
  "USA", //22
  "Samoa" //23
};


String[] territory = {
  "Auckland", //0
  "Wellington", 
  "Petropavlovsk", 
  "Magadan", //1
  "Guam", //2
  "Tokyo", //3
  "Seoul", //3
  "Hong Kong", //4
  "Bangkok", //5
  "Yangon", //6
  "Mumbai", //7
  "New Delhi", 
  "Kathmandu", 
  "Moscow", //8
  "St. Petersburg", 
  "Riyadh", //9
  "Athens", //10
  "Helsinki", 
  "Cape Town", 
  "Amsterdam", //11
  "Berlin", 
  "Rome", 
  "Warsaw", 
  "Paris", 
  "Dundee", //12
  "London", 
  "Lisbon", 
  "Casablanca", 
  "Reykjavik", 
  "Mindelo", //13
  "Azores", 
  "Atlantic Ocean", //14
  "Newfoundland", //15
  "Buenos Aires", 
  "San Juan", //16
  "Caracas", 
  "Santiago", 
  "Lima", //17
  "Mexico City", //18
  "Arizona", //19
  "Alaska", //20
  "California", //20
  "Pacific Ocean", //21
  "Hawaii", //22
  "Apia", //23
};

String weather[];



void setup() {
  frameRate(60);
  size(900, 400);
  bg3 = loadImage("bg3.png");
  bg2 = loadImage("bg2.png");
  background(bg3);
  smooth();
  font1 = loadFont("font1.vlw");
  font2 = loadFont("font2.vlw");
  font3 = loadFont("font3.vlw");
  arial = loadFont("arial.vlw");
  arialB = loadFont("arialB.vlw");
  arial3 = loadFont("arial3.vlw");



  int radius = min(100, 100) / 2;
  clockMins = radius * 0.75;
  clockSize = radius * 2;
}

void draw() {
  

  if (hour()<=23 && hour()>=11) {
    zone = hour()-11;
  }
  else {
    zone = hour()+13;
  }

  if (anim == true) {
    group7intro();
    textFont(font3);
    fill(200, 0, 10);
    text("Santa's Little Helper", 200, 100);
  }
  else {
    frameRate(1);
    background(bg3);
    for (float z = 150;z<750;z+=(600/24)) {
      noFill();
      stroke(100);
      rect(z, 0, (600/24), 350);
    }
    // snow();
    fill(99, 222, 245);
    rect(0, 0, 150, height);
    rect(750, 0, width, height);

    currentCountry();

    clock(825, 333);
    println("Hour:" + hour());

    displayCountry(5, 5);
    nextDestination(5, 65);
    naughtyDisplay(5, 130);
    naughtyList(5, 200);
    niceList(5, 300);
    weatherDisplay(755, 5);

    if (zone == 14 | zone == 21) {
      fill(99, 222, 245);
      rect(5, 200, 140, 200);
      rect(755,7,140,50);
 

    }
          textFont(arial3);
    fill(0,0,255);
    text("Bg image: Wikipedia",760,90);
    text("Info: NationMaster.com",760,102);
    text("and WeatherReports.com",760,114);
    text("created by:",760,130);
    text("Roderick McNeill",760,142);
    text("Hamish Fenton",760,154);
    text("Craig Murdo",760,166);
    text("Mikolaj Gackowski",760,178);
    
    textFont(font1);
    fill(255,0,0,50);
    text("Santa's Little Helper",228,390);
    }
  }


void clock(int clockX, int clockY) {
  fill(0);
  ellipse(clockX, clockY, clockSize, clockSize);


  float mins = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 

  stroke(255);
  strokeWeight(2);
  line(clockX, clockY, clockX + cos(mins) * clockMins, clockY + sin(mins) * clockMins);



  noFill();
  stroke(100);
  float h = 725-(zone*25);
  rect(h, 0, (600/24), 350);
  
  fill(0,0,255,50);
  rect(h, 0, (600/24), map(minute(),0,59,0,350));
  textFont(arial);
  fill(255);
  text(minute(),h+5,map(minute(),0,59,0,350)-2);

  strokeWeight(1);
}

/*void snow() {
 fill(99, 222, 245);
 rect(0, 0, 150, height);
 rect(750, 0, width, height);
 stroke(255);
 
 for (snowX=10;snowX<140;snowX+=m) {
 line(snowX-5, snowY, snowX+5, snowY);
 line(snowX, snowY-5, snowX, snowY+5);
 line(snowX-4, snowY-4, snowX+4, snowY+4);
 line(snowX+4, snowY-4, snowX-4, snowY+4);
 }
 
 for (snowX=760;snowX<width;snowX+=m) {
 line(snowX-5, snowY, snowX+5, snowY);
 line(snowX, snowY-5, snowX, snowY+5);
 line(snowX-4, snowY-4, snowX+4, snowY+4);
 line(snowX+4, snowY-4, snowX-4, snowY+4);
 }
 if (snowY>height) {
 snowY=-20;
 }
 snowY+=0.5;
 }*/

void group7intro() {

  if (animbox<230) {
    textFont(font1);
    background(bg2);
    //  fill(255);
    // noStroke();
    // rect(animbox, 186, 200, 40);
    textFont(font1);
    fill(200, 0, 10);
    text("Group  7", animbox, 220);
    animbox=animbox+2;
  }

  animtimer=animtimer-1;

  if (animbox==230) {
    textFont(font2);
    fill(255);
    text("Replacing elves with software since 1955", 230, 247);
    //replace text if political correctness is needed

    if (animtimer<=0) {
      anim = false; //replace with desired progression
    } //e.g. change an "intro" variable to false
  }
}


void currentCountry() {
  if (zone == 0) {
    if (minute()>=0 && minute()<20) {
      c = 0; n=1.5;
      lang="eng";
      extension = "New_Zealand/Auckland";
    }


    if (minute()>=20 && minute()<40) {
      c = 1;  n=1.5;
      lang="eng";
      extension = "New_Zealand/Wellington";
    }
    if (minute()>=40 && minute()<60) {
      c = 2;  n=29.7;
      lang="rus";
      extension = "Russia/Petropavlovsk_Kamchatskij";
    }
  }
  if (zone == 1) {
    c = 3; n=29.7;
    lang="rus";
    extension = "Russia/Magadan";
  }
  if (zone == 2) {
    c = 4; n=29.7;
    lang="eng";
    extension = "Russia/Yekaterinburg";
  }
  if (zone == 3) {
    if (minute()>=0 && minute()<30) {
      c = 5;  n=0;
      lang="jap";
      extension = "Japan/Tokyo";
    }
    if (minute()>=30 && minute()<60) {
      c = 6;  n=0;
      lang="kor";
      extension = "South_Korea/Seoul";
    }
  }
  if (zone == 4) {
    c = 7; n=2.2;
    lang="chi";
    extension = "China/Hong_Kong";
  }
  if (zone == 5) {
    c = 8; n=9;
    lang="tha";
    extension = "Thailand/Bangkok";
  }
  if (zone == 6) {
    c = 9; n=5;
    lang="tha";
    extension ="Burundi/Bujumbura";
  }
  if (zone == 7) {
    if (minute()>=0 && minute()<20) {
      c = 10; n=5.5;
      lang="ind";
      extension ="India/Mumbai";
    }
    if (minute()>=20 && minute()<40) {
      c = 11; n=5.5;
      lang="ind";
      extension ="India/New_Delhi";
    }
    if (minute()>=40 && minute()<60) {
      c = 12; n=2.1;
      lang="ind";
      extension ="Nepal/Kathmandu";
    }
  }
  if (zone == 8) {
    if (minute()>=0 && minute()<30) {
      c = 13; n=29.7;
      lang="rus";
      extension ="Russia/Moscow";
    }
    if (minute()>=30 && minute()<60) {
      c = 14; n=29.7;
      lang="rus";
      extension ="Russia/St_Peterburg";
    }
  }
  if (zone == 9) {
    c = 15; n=3.2;
    lang="ara";
    extension ="Saudi_Arabia/Riyadh";
  }
  if (zone == 10) {
    if (minute()>=0 && minute()<20) {
      c = 16; n=1;
      lang="gre";
      extension ="Greece/Athens";
    }
    if (minute()>=20 && minute()<40) {
      c = 17; n=2.8;
      lang="fin";
      extension ="Finland/Helsinki";
    }
    if (minute()>=40 && minute()<60) {
      c = 18; n=69;
      lang="afr";
      extension ="South_Africa/Cape_Town";
    }
  }
  if (zone == 11) {
    if (minute()>=0 && minute()<12) {
      c = 19; n=1.4;
      lang="dut";
      extension ="Netherlands/Amsterdam";
    }
    if (minute()>=12 && minute()<24) {
      c = 20; n=1;
      lang="ger";
  extension = "Germany/Berlin_Dahlem"; 
  }
    if (minute()>=24 && minute()<36) {
      c = 21; n=1.2;
      lang="ita";
      extension ="Italy/Rome";
    }
    if (minute()>=36 && minute()<48) {
      c = 22; n=1.7;
      lang="pol";
      extension ="Poland/Warsaw";
    }
    if (minute()>=48 && minute()<60) {
      c = 23; n=1.6;
      lang="fre";
      extension ="France/Paris";
    }
  }
  if (zone == 12) {
    if (minute()>=0 && minute()<12) {
      c = 24; n=99.9;
      lang="sco";
      extension = "United_Kingdom/Dundee";
    }
    if (minute()>=12 && minute()<24) {
      c = 25; n=1;
      lang="eng";
      extension ="United_Kingdom/London";
    }
    if (minute()>=24 && minute()<36) {
      c = 26; n=1.8;
      lang="por";
      extension ="Portugal/Lisbon";
    }
    if (minute()>=36 && minute()<48) {
      c = 27; n=1.1;
      lang="ara";
      extension ="Morocco/Casablanca";
    }
    if (minute()>=48 && minute()<60) {
      c = 28; n=1;
      lang="ice";
      extension ="Iceland/Reykjavik";
    }
  }
  if (zone == 13) {
    if (minute()>=0 && minute()<30) {
      c = 29; n=1.8;
      lang="por";
      extension ="Cape_Verde/Mindelo";
    }
    if (minute()>=30 && minute()<60) {
      c = 30; n=1.8;
      lang="por";
      extension ="Azores/Flores";
    }
  }
  if (zone == 14) {
    c = 31; n=0;
    lang="chi";//filler
    extension ="Azores/Flores";
  }
  if (zone == 15) {
    if (minute()>=0 && minute()<30) {
      c = 32; n=2;
      lang="eng";
      extension ="Canada/Vancouver";
    }
    if (minute()>=30 && minute()<60) {
      c = 33; n=5.5;
      lang="spa";
      extension ="Argentina/Buenos_Aires";
    }
  }
  if (zone == 16) {
    if (minute()>=0 && minute()<20) {
      c = 34; n=5.5;
      lang="spa";
      extension ="Argentina/San_Juan";
    }
    if (minute()>=20 && minute()<40) {
      c = 35; n=37;
      lang="spa";
      extension ="Venezuela/Caracas";
    }
    if (minute()>=40 && minute()<60) {
      c = 36; n=5.5;
      lang="spa";
      extension ="Chile/Santiago";
    }
  }
  if (zone == 17) {
    c = 37; n=5.7;
    lang="spa";
    extension ="Peru/Lima";
  }
  if (zone == 18) {
    c = 38; n=11.3;
    lang="spa";
    extension ="Mexico/Mexico_City";
  }
  if (zone == 19) {
    c = 39; n=5.9;
    lang="eng";
    extension ="United_States/AZ/Phoenix";
  }
  if (zone == 20) {
    if (minute()>=0 && minute()<30) {
      c = 40; n=5.9;
      lang="eng";
      extension ="United_States/AK/Anchorage";
    }
    if (minute()>=30 && minute()<60) {
      c = 41; n=5.9;
      lang="eng";
      extension ="United_States/CA/Los_Angeles";
    }
  }
  if (zone == 21) {
    c = 42; n=0;
    lang="chi";//filler
    extension ="United_States/CA/Los_Angeles";
  }
  if (zone == 22) {
    c = 43; n=5.9;
    lang="haw";
    extension ="United_States/HI/Honolulu";
  }
  if (zone == 23) {
    c = 44; n=1;
    lang="eng";
    extension ="Samoa/Apia";
  }
}

void displayCountry(int x1, int y1) {
  noStroke();
  fill(255, 50);
  rect(x1, y1, 140, 50);
  fill(0);
  textFont(arial);
  text("Scheduled location:", x1+3, y1+10);
  textFont(arialB);
  text(country[c], x1+3, y1+30);
  textFont(arial);
  text(territory[c], x1+3, y1+43);
}

void nextDestination(int x2, int y2) {
  noStroke();
  fill(255, 50);
  rect(x2, y2, 140, 50);
  fill(0);
  textFont(arial);
  text("Next destination:", x2+3, y2+10);
  textFont(arialB);
  text(country[c+1], x2+3, y2+30);
  textFont(arial);
  text(territory[c+1], x2+3, y2+43);
}

void naughtyDisplay(int x3, int y3) {
  noStroke();
  fill(255,50);
  rect(x3, y3, 140, 45);
  fill(0);
  textFont(arial);
  text("Naughty level here:", x3+5, y3+22);
  textFont(arialB);
  text(n + "%", x3+50, y3+42);
  colorMode(RGB);
}

void naughtyList(int x4, int y4) {

  String country = "&usage_" + lang + "=1";

  refresh++;
  if (refresh>60) {
    refresh = 0;
  }
  // if (refresh == 60){
  String [] page = loadStrings("http://www.behindthename.com/random/random.php?number=1&gender=both&surname=&randomsurname=1&all=no" + country);



  String [] firstname = page[85].split(">");
  firstname = firstname[1].split("<");

  String [] surname = page[85].split(">");
  surname = surname[3].split("<");



  print(firstname[0]);
  print(" ");
  println(surname[0]);

  noStroke();
  fill(255, 50);
  rect(x4, y4, 140, 95);
  fill(0);
  textFont(arial);
  text("Who`s been naughty:", x4+5, y4+22);
  textFont(arial);
  fill(200, 0, 0);
  text(firstname[0] + " " + surname[0], x4+5, y4+42);
}

void niceList(int x5, int y5) {

  String country = "&usage_" + lang + "=1";

  refresh++;
  if (refresh>60) {
    refresh = 0;
  }
  // if (refresh == 60){
  String [] page = loadStrings("http://www.behindthename.com/random/random.php?number=1&gender=both&surname=&randomsurname=1&all=no" + country);



  String [] firstname = page[85].split(">");
  firstname = firstname[1].split("<");

  String [] surname = page[85].split(">");
  surname = surname[3].split("<");



  print(firstname[0]);
  print(" ");
  println(surname[0]);

  noStroke();
  fill(255, 50);
  rect(x5, y5, 140, 95);
  fill(0);
  textFont(arial);
  text("Who`s been nice:", x5+5, y5+22);
  textFont(arial);
  fill(0, 200, 0);
  text(firstname[0] + " " + surname[0], x5+5, y5+42);
  
      if (c == 24) {
      fill(99, 222, 245);
      rect(5, 330, 140, 100);
      fill(0,200,0);
      text("Roderick McNeill", x5+5, y5+42);
      text("Mikolaj Gackowski", x5+5, y5+54);
      text("Hamish Fenton", x5+5, y5+66);
      text("Craig Murdo", x5+5, y5+78);
}
  }

void weatherDisplay(int x6, int y6) {


  weather = loadStrings("http://www.weatherreports.com/" + extension);

  String[] bits = weather[154].split(">");
  bits = bits[1].split("<");
  println(bits[0]);
  String weathertxt = bits[0];

  noStroke();
  fill(255, 50);
  rect(x6, y6, 140, 65);
  fill(0);
  textFont(arial);
  text("Local conditions:", x6+5, y6+22);
  textFont(arialB);
  text(weathertxt, x6+5, y6+44);
}


