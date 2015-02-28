
PImage osnova;
PImage bus1;
PImage bus2;
PImage bus3;
PImage temp2;
PFont font;
PFont boldfont;
String busstops57 = " Dundee bus station\n Lochee bypass\n Camperdown\n Muirhead post office\n Newtyle church\n Meigle opp church\n Alyth Square\n New Alyth opp shelter\n Rattray Glenshee Drive\n Blairgowrie Wellmeadow\n Blairgowrie Wellmeadow\n Coupar Angus Cross\n Burrelton opp post office\n Kinrossie bus shelter\n Balbeggie opp garage\n Scone opp post office\n Perth Kinnoull Street\n Perth bus station\n Crieff Road Perth College\n Aviva Pitheavlis";
String timetable57_1 = "-\n-\n-\n-\n-\n-\n-\n-\n-\n-\n0605\n-\n0615\n0620\n-\n0630\n0635\n0643\n0645\n- ";
String timetable57_2= "-\n\n-\n-\n-\n-\n-\n0637\n0641\n0648\n0653\n0655\n0705\n0710\n0717\n0722\n0728\n0738\n0740\n-\n-";
String timetable57_3 = "-\n-\n-\n-\n-\n-\n-\n-\n0735\n0742\n0747\n0802\n0807\n-\n0817\n0823\n0835\n0840\n0850\n-";
String timetable57_4 = "0735\n0750\n0753\n0758\n0807\n0812\n0822\n0828\n0837\n0842\n0905\n0918\n0923\n0931\n0936\n0942\n0952\n0954\n-\n-\n";
String timetable57_5 = "1610\n1629\n1633\n1638\n1647\n1652\n1702\n1708\n-\n1814\n1820\n1830\n1835\n1843\n1848\n1853\n1903\n1905\n-\n-\n";
String timetable57_6 = "1705\n1724\n1728\n1733\n1742\n1747\n1757\n1803\n-\n1814\n1820\n1830\n1835\n1843\n1848\n1853\n1903\n1905\n-\n-\n";
String timetable57_7 = "1725\n1744\n1748\n1753\n1802\n1807\n1817\n1823\n1830\n1835\n-\n-\n-\n-\n-\n-\n-\n-\n-\n-\n";
String timetable57_8 = "1820\n1832\n1835\n1840\n1850\n1855\n1905\n1909\n1916\n1921\n1925\n1935\n1940\n1948\n1953\n1958\n2008\n2010\n-\n-\n";

String busstops202 = "Meadowside\nVictoria Road\nInfirmary Brae\nAlbany Terrace\nLawside Road\nThe Glens\nKingsway Retail Park\nThe Dales\nBaldowan Avenue\nHarestane Road\nDerwent Avenue";
String timetable202_1 = "-\n0605\n-\n0615\n0620\n-\n0630\n0635\n0643\n0645\n- ";
String timetable202_2= "0648\n0653\n0655\n0705\n0710\n0717\n0722\n0728\n0738\n0740\n-";
String timetable202_3 = "-\n0735\n0742\n0747\n0802\n0807\n-\n0817\n0823\n0835\n0840";
String timetable202_6 = "-\n1814\n1820\n1830\n1835\n1843\n1848\n1853\n1903\n1905\n-";
String timetable202_7 = "1725\n1744\n1748\n1753\n1802\n1807\n1817\n1823\n1830\n1835\n-";
String timetable202_8 = "1840\n1850\n1855\n1905\n1909\n1916\n1921\n1925\n1935\n1940\n1948";

String busstops206 = "Ethiebeaton Park\nPanmurefield\nEast Balgillo Road\nNursery Road\nGray Street\nBrook Street\nDundee Road West\nCraigie Drive";
String timetable206_1 = "0615\n0620\n-\n0630\n0635\n0643\n0645\n- ";
String timetable206_2= "0648\n0653\n0655\n0705\n0710\n0717\n0722\n0728";
String timetable206_3 = "0735\n0742\n0747\n0802\n0807\n-\n0817\n0823";
String timetable206_6 = "1830\n1835\n1843\n1848\n1853\n1903\n1905\n-";
String timetable206_7 = "1725\n1744\n1748\n1753\n1802\n1807\n1817\n1823";
String timetable206_8 = "1840\n1850\n1855\n1905\n1909\n1916\n1921\n1925";



void setup() {
  size(800, 675);
  font=loadFont("CenturyGothic-20.vlw");
  boldfont=loadFont("CenturyGothic-Bold-20.vlw");
  smooth();

  osnova=loadImage("template.jpg");
  bus1=loadImage("57.png");
  bus2=loadImage("202.png");
  bus3=loadImage("206.png");
  temp2 = loadImage("temp2.jpg");
  image(osnova, 0, 0);
}

void draw() {
  
  // MAPS

  if ((mouseX > 220)&&(mouseX<345)&&(mouseY>16)
    &&(mouseY<100)&&(mousePressed)) {
    image(bus1, 0, 0);
  }

  if ((mouseX > 415)&&(mouseX<520)&&(mouseY>16)
    &&(mouseY<100)&&(mousePressed)) {
    image(bus2, 0, 0);
  }

  if ((mouseX > 560)&&(mouseX<700)&&(mouseY>16)
    &&(mouseY<100)&&(mousePressed)) {
    image(bus3, 0, 0);
  }
  
//TIMETABLE 57

  fill(50);
  textFont(boldfont);
  textSize(13);
  if ((mouseX > 250)&&(mouseX<345)&&(mouseY>105)
    &&(mouseY<133)&&(mousePressed)) {

    image(temp2, 0, 0);
    fill(#01425b);
    textLeading(22);
    text(busstops57, 75, 205);
    busstops57 = busstops57.toUpperCase();
    textFont(font);
    textSize(14);
    textLeading(22);
    text(timetable57_1, 290, 205);
    text(timetable57_2, 340, 205);
    text(timetable57_3, 390, 205);
    text(timetable57_4, 440, 205);
    text(timetable57_5, 520, 205);
    text(timetable57_6, 570, 205);
    text(timetable57_7, 620, 205);
    text(timetable57_8, 670, 205);
  }
  
  //TIMETABLE 202
    fill(50);
  textFont(boldfont);
  textSize(13);
  if ((mouseX > 415)&&(mouseX<527)&&(mouseY>105)
    &&(mouseY<133)&&(mousePressed)) {

    image(temp2, 0, 0);
    fill(#01425b);
    textLeading(22);
    text(busstops202, 75, 205);
    busstops202 = busstops202.toUpperCase();
    textFont(font);
    textSize(14);
    textLeading(22);
    text(timetable202_1, 320, 205);
    text(timetable202_2, 370, 205);
    text(timetable202_3, 420, 205);

    text(timetable202_6, 540, 205);
    text(timetable202_7, 590, 205);
    text(timetable202_8, 640, 205);
  }
  
    
  //TIMETABLE 206
    fill(50);
  textFont(boldfont);
  textSize(13);
  if ((mouseX > 600)&&(mouseX<710)&&(mouseY>105)
    &&(mouseY<133)&&(mousePressed)) {

    image(temp2, 0, 0);
    fill(#01425b);
    textLeading(22);
    text(busstops206, 75, 205);
    busstops206 = busstops206.toUpperCase();
    textFont(font);
    textSize(14);
    textLeading(22);
    text(timetable206_1, 320, 205);
    text(timetable206_2, 370, 205);
    text(timetable206_3, 420, 205);

    text(timetable206_6, 540, 205);
    text(timetable206_7, 590, 205);
    text(timetable206_8, 640, 205);
  }
}


