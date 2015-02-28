
color mp= color(0);

//tests
color cc=color(0, 0, 0);
int xx; 
int xy;
//tests


Boolean confirm = false;

PImage themap2;
PImage back;
PImage vimage;
PImage[]country= new PImage[50];

PFont font;
PFont font2;

int V =13;
int v=13;

String[] cntyname = new String[15];
String[] language = new String[15];
String[] currency = new String[15];
String[] population = new String[15];

String[] localtime = new String[15];


void setup()
{ 
  size(900, 600);
  background(0);
  font=loadFont("Calibri-50.vlw");
  font2=loadFont("Cambria-50.vlw");
  textFont(font, 20);

  //############################################
  //                COUNTRY DATA
  //############################################
  String[] lineno = loadStrings("info.csv");
  for (int i=1; i<lineno.length;i++) {
    String[] bit = split(lineno[i], ",");
    cntyname[i-1] = bit[0];
    language[i-1] = bit[2];
    currency[i-1] = bit[3];
    population[i-1] = bit[1];
  }  


  //############################################
  //                TIMEZONES
  //############################################

  String[] ln = loadStrings("http://www.timeanddate.com/worldclock/custom.html?continent=samerica&sort=1");
  String[] time = new String[15];
  String fullpage = "";

  for (int ii=0; ii<ln.length;ii++) {
    fullpage=fullpage+ln[ii];
  }

  //FIRST TIME ZONE########################################################
  String[] bits=split(fullpage, "</td></tr><tr class=c0><td><a href=\"/worldclock/city.html?n=915\">Ecuador - Galapagos Islands</a><span id=p54s class=wds></span></td><td id=p54 class=rbi>");

  String[] timezone = split (bits[1], "</td></tr><tr class=c1><td><a href=\"/worldclock/city.html?n=93\">Ecuador - Guayaquil</a><span id=p55s class=wds></span></td><td id=p55 class=rbi>");
  time[0] = timezone[0];
  println("time0 " +time[0]);

  //SECOND TIME ZONE########################################################
  String[] bits2=split(fullpage, "</td></tr><tr class=c0><td><a href=\"/worldclock/city.html?n=914\">Chile - Easter Island</a><span id=p40s class=wds> *</span></td><td id=p40 class=rbi>");

  String[] timezone2 = split (bits2[1], "</td></tr><tr class=c1><td><a href=\"/worldclock/city.html?n=574\">Chile - Punta Arenas</a><span id=p41s class=wds> *</span></td><td id=p41 class=rbi>");
  time[1] = timezone2[0];
  println("time1 " +time[1]);

  //THIRD TIME ZONE########################################################
  String[] bits3=split(fullpage, "</td></tr><tr class=c1><td><a href=\"/worldclock/city.html?n=441\">Venezuela - Barquisimeto</a><span id=p85s class=wds></span></td><td id=p85 class=rbi>");

  String[] timezone3 = split (bits3[1], "</td></tr><tr class=c0><td><a href=\"/worldclock/city.html?n=58\">Venezuela - Caracas</a><span id=p86s class=wds></span></td><td id=p86 class=rbi>");
  time[2] = timezone3[0];
  println("time2 " +time[2]);

  //FOURTH TIME ZONE###################################################
  String[]bits4 = split(fullpage, "<tr class=c1><td><a href=\"/worldclock/city.html?n=124\">Bolivia - La Paz</a><span id=p11s class=wds></span></td><td id=p11 class=rbi>");

  String[] timezone4 = split(bits4[1], "</td></tr><tr class=c0><td><a href=\"/worldclock/city.html?n=615\">Bolivia - Santa Cruz</a><span id=p12s class=wds></span></td><td id=p12 class=rbi>");
  time[3] = timezone4[0];
  println("time3 " +time[3]);

  // FIFTH TIME ZONE##################################################
  String[] bits5 = split(fullpage, "<td><a href=\"/worldclock/city.html?n=51\">Argentina - Buenos Aires</a><span id=p0s class=wds></span></td><td id=p0 class=rbi>");

  String[] timezone5 = split(bits5[1], "</td></tr><tr class=c1><td><a href=\"/worldclock/city.html?n=541\">Argentina - Buenos Aires - La Plata");
  time[4] = timezone5[0];
  println("time4 " +time[4]);

  //SIXTH TIME ZOME####################################################
  String[]bits6 = split (fullpage, "</td></tr><tr class=c1><td><a href=\"/worldclock/city.html?n=445\">Brazil - Minas Gerais - Belo Horizonte</a><span id=p23s class=wds> *</span></td><td id=p23 class=rbi>");

  String[] timezone6 = split(bits6[1], "</td></tr><tr class=c0><td><a href=\"/worldclock/city.html?n=446\">Brazil - Para - Belém</a><span id=p24s class=wds></span></td><td id=p24 class=rbi>");
  time[5] = timezone6[0];
  println("time5 " +time[5]);


  //############################################
  //                Value to Time
  //############################################


  localtime[0] = time[4]; // Argentina
  localtime[1] = time[3]; // Bolivia
  localtime[2] = time[4]; // Brazil
  localtime[3] = time[4]; // Chile
  localtime[4] = time[1]; // Colombia
  localtime[5] = time[0]; // Ecuador
  localtime[6] = time[4]; // French Giuna
  localtime[7] = time[3]; // Guyana
  localtime[8] = time[4]; // Paraguay
  localtime[9] = time[1]; // Peru 
  localtime[10] = time[4];// Suriname
  localtime[11] = time[5];// Uruguay
  localtime[12] = time[2];// Venezuela


  //############################################
  //                IMAGES
  //############################################
  back=loadImage("back.jpg");
  back.resize(70, 40);

  vimage=loadImage("vimage.jpg");
  vimage.resize(70, 40);


  //Loading the images for each country
  country[0] = loadImage("argentina.jpg");
  country[0].resize(width, height);

  country[1] = loadImage("bolivia.jpg");
  country[1].resize(width, height);

  country[2] = loadImage("brazil.jpg");
  country[2].resize(width, height);

  country[3] = loadImage("chile.jpg");
  country[3].resize(width, height);

  country[4] = loadImage("colombia.jpg");
  country[4].resize(width, height);

  country[5] = loadImage("ecuador.jpg");
  country[5].resize(width, height);

  country[6] = loadImage("french.jpg");
  country[6].resize(width, height);

  country[7] = loadImage("guyana.jpg");
  country[7].resize(width, height);

  country[8] = loadImage("paraguay.jpg");
  country[8].resize(width, height);

  country[9] = loadImage("peru.jpg");
  country[9].resize(width, height);

  country[10] = loadImage("suriname.jpg");
  country[10].resize(width, height);

  country[11] = loadImage("uruguay.jpg");
  country[11].resize(width, height);

  country[12] = loadImage("venezuela.jpg");
  country[12].resize(width, height);

  country[13] = loadImage("themap2.jpg");
  country[13].resize(500, 600);
}


void draw()
{
  frameRate(60);
  noStroke();
  smooth();

  if (confirm == true)
    v=13;
  displayArea();

  if (v!=13)
    displayInfo();    


  if (V==13 && (confirm== false)) {
    image(country[13], 0, 0) ;
  }
}


void mousePressed() {

  mp = get (mouseX, mouseY);  

  //Checks if the view image button has been pressed
  if (mousePressed == true && (dist(700, 500, mouseX, mouseY)<75) &&
    v!= 13) {
    V=v;
    confirm = true;
  }

  //Directs back to the map
  if ((mousePressed == true) &&
    (mouseY > 500) &&
    (mouseY < 540) && 
    (mouseX < 470) && 
    (mouseX > 400) && V!=13)
  {
    V=13;
    v=13;
    confirm = false;
  }


  if (mousePressed == true &&
    (mouseY > 350)  &&
    (mouseY < 550)  && 
    (mouseX < 239)  && 
    (mouseX > 147)) /*dist(mouseX, mouseY, 192, 258) < 35)*/
  {     
    v=0;    //Argentina
  }

  if (mousePressed == true && dist(mouseX, mouseY, 192, 258) < 35)
  {
    v=1;    //Bolivia
  }

  if (mousePressed == true && (
  ( (mouseY > 109)  &&  //Big Square Check for Brazil
  (mouseY < 290)  && 
    (mouseX < 475)  && 
    (mouseX > 260)) || 
    ( (mouseY > 115)  &&  //Minor Square Check for Brazil
  (mouseY < 193)  && 
    (mouseX < 260)  && 
    (mouseX > 140) ) ))
  {
    v=2;    //Brazil
  }

  if (mousePressed == true && 
    (mouseY > 277)  &&
    (mouseY < 565)  && 
    (mouseX < 147)  && 
    (mouseX > 109))
  {
    v=3;    //Chile
  }

  if (mousePressed == true && 
    (mouseY > 15)  &&
    (mouseY < 105)  && 
    (mouseX < 150)  && 
    (mouseX > 42))
  {
    v=4;    //Columbia
  }

  if (mousePressed == true && 
    (mouseY > 105)  &&
    (mouseY < 150)  && 
    (mouseX < 80)  && 
    (mouseX > 20))
  {
    v=5;    //Ecuador
  }

  if (mousePressed == true && 
    (mouseY > 70)  &&
    (mouseY < 105)  && 
    (mouseX < 310)  && 
    (mouseX > 290))
  {
    v=6;    //French Guiana
  }

  if (mousePressed == true && 
    (mouseY > 50)  &&
    (mouseY < 110)  && 
    (mouseX < 253)  && 
    (mouseX > 233))
  {
    v=7;    //Guyana
  }

  if (mousePressed == true && 
    (mouseY > 282)  &&
    (mouseY < 346)  && 
    (mouseX < 270)  && 
    (mouseX > 208))
  {
    v=8;    //Paraguay
  }

  if (mousePressed == true && 
    (mouseY > 163)  &&
    (mouseY < 272)  && 
    (mouseX < 137)  && 
    (mouseX > 20))
  {
    v=9;    //Peru
  }

  if (mousePressed == true && 
    (mouseY > 70)  &&
    (mouseY < 100)  && 
    (mouseX < 288)  && 
    (mouseX > 260))
  {
    v=10;    //Suriname
  }

  if (mousePressed == true && 
    (mouseY > 375)  &&
    (mouseY < 412)  && 
    (mouseX < 285)  && 
    (mouseX > 245))
  {
    v=11;    //Uruguay
  }

  if (mousePressed == true && 
    (mouseY > 30)  &&
    (mouseY < 110)  && 
    (mouseX < 220)  && 
    (mouseX > 150))
  {
    v=12;    //Venezuela
  }
}

void info()
{ 
  fill(255);
  textFont(font, 50);
  textAlign(CENTER);
  text(cntyname[v], 680, 50);
  textFont(font2, 30);
  textAlign(LEFT);
  text("Population: "+population[v], 515, 170);
  text("Language: "+language[v], 515, 230);
  text("Currency: "+currency[v], 515, 290);
  text("Local Time: " +localtime[v], 515, 350);
}

void displayInfo() {
  textBG();
  info();

  noFill();
  strokeWeight(2);
  stroke(255);
  ellipse(700, 500, 150, 150);
  textFont(font, 20);
  textAlign(CENTER);
  text("View Image", 700, 510);
}

void displayArea() {
  background(0);
  image(country[V], 0, 0);

  if (V!=13)
    image(back, 400, 500);
}

void textBG() {

  fill(90, 140, 112);
  rect(500, 0, 400, height);

  noFill();
  strokeWeight(3);
  stroke(255);
  rect(510, 10, 380, height-20);
}


