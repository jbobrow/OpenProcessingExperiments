

Graph graph;
Graph1 graph1;
Graph2 graph2;
Graph3 graph3;
Table table; 
PImage b;
PImage gbpusd;
PImage eurusd;
PImage usdjpy;
PImage eurjpy;
PImage footer;
PImage back;
boolean clickgbpusd = false;
boolean clickeurusd = false;
boolean clickeurjpy = false;
boolean clickusdjpy = false;
boolean gbpusdover = false; 
boolean eurusdover = false;
boolean usdjpyover = false;
boolean eurjpyover = false;
PFont font;

void setup() {
  smooth();
  size(600, 600);

  b = loadImage("bg.png");
  background(b);
  frameRate(30);
  graph = new Graph(0, 0);
  graph1 = new Graph1(0, 0);
  graph2 = new Graph2(0, 0);
  graph3 = new Graph3(0, 0);
  table = new Table(0, 0);
}

void draw() {

  inter();
  over();
  // checks if the mouse is over and clicked on the specific image button.
  if (gbpusdover && mouseButton == LEFT)
  {
    clickgbpusd = true;
  }
  else if (eurusdover && mouseButton == LEFT)
  {
    clickeurusd = true;
  }
  else if (eurjpyover && mouseButton == LEFT)
  {
    clickeurjpy = true;
  }
  else if (usdjpyover && mouseButton == LEFT)
  {
    clickusdjpy = true;
  }

  //if clicked and over the specific image the clicked currency is shown.
  if (clickgbpusd)
  {
    
    graph.gbpusd();
  }
  if (clickeurusd)
  {
    
    graph1.eurusdupdate();
  }
  if (clickeurjpy)
  {
    
    graph3.eurjpyupdate();
  }
  if (clickusdjpy)
  {
    
    graph2.usdjpyupdate();
  }
}
void inter()
{
  // displays images
  gbpusd = loadImage("gbpusd.png");
  image(gbpusd, 5, 40);
  eurusd = loadImage("eurusd.png");
  image(eurusd, 80, 40);
  usdjpy = loadImage("usdjpy.png");
  image(usdjpy, 5, 70);
  eurjpy = loadImage("eurjpy.png");
  image(eurjpy, 80, 70);
  footer = loadImage("key.png");
  image(footer, 0, 520);
  table.display();
}
void over()
{
  //checks if over image
  if (mouseX >= 5 && mouseX <=80 && mouseY >= 40 && mouseY <= 70)
  {
    gbpusd = loadImage("gbpusdhover.png");
    image(gbpusd, 5, 40);
    gbpusdover = true;
    eurusdover = false;
    usdjpyover = false;
    eurjpyover = false;
  }
  if (mouseX >= 80 && mouseX <=155 && mouseY >= 40 && mouseY <= 70)
  {
    eurusd = loadImage("eurusdhover.png");
    image(eurusd, 80, 40);
    eurusdover = true;
    gbpusdover = false;
    usdjpyover = false;
    eurjpyover = false;
  }
  if (mouseX >= 5 && mouseX <=80 && mouseY >= 70 && mouseY <= 100)
  {
    usdjpy = loadImage("usdjpyhover.png");
    image(usdjpy, 5, 70);
    usdjpyover = true;
    eurusdover = false;
    gbpusdover = false;
    eurjpyover = false;
  }
  if (mouseX >= 80 && mouseX <=155 && mouseY >= 70 && mouseY <= 100)
  {
    eurjpy = loadImage("eurjpyhover.png");
    image(eurjpy, 80, 70);
    eurjpyover = true;
    eurusdover = false;
    usdjpyover = false;
    gbpusdover = false;
  }
}


class Graph {
  int i = 0;
  float bit;
  int y;
  float x = 0;
  String[] bits;
  String[] high;
  String[] low;
  String [] time;
  float h = 0;
  float x1 = 41;


  Graph(int y, float bit) {
    bit = 0;
    y = 0;
  }
  // FOR POUND TO DOLLAR
  void gbpusd() {
    font = loadFont("MyriadApple-Medium-48.vlw"); 
    textFont(font, 16);

    String[] page = loadStrings("http://www.marketwatch.com/investing/currencies/tools");

    // initilise a new string variable to put the page into
    String p = "";

    //for every line 
    for (int i=0;i<page.length;i++) {
      p += page[i];
    }

    String startMarker = "4867886";
    String endMarker = "</tr>";
    int start = p.indexOf(startMarker);
    p = p.substring(start+startMarker.length(), p.length());
    int end = p.indexOf(endMarker);
    String ss = p.substring(0, end);


    String[] list = split(ss, "bgBid");
    bits = list[1].split(">");
    //bits = list[1].split("<td class=\"bgBid\">");
    bits = bits[1].split("<");

    String[] list1 = split(ss, "/td>");
    high = list1[3].split(">");
    high = high[1].split("<");

    String[] list2 = split(ss, "/td>");
    low = list2[4].split(">");
    low = low[1].split("<");

    String[] list3 = split(ss, "/td>");
    time = list3[5].split(">");
    time = time[1].split("<");


    bit =  float(bits[0]) * 20;

    h = map(bit, 20, 40, 0, 500);

    fill(155);

    back = loadImage("back.png");
    image(back, 135, 465);
    fill(255);
    text("Showing rate for Pound to US Dollars", 160, 515);
    text("Current Rate: " + bits[0] + ".", 150, 480);
    text("Highest Rate of the Day: " + high[0] + ".", 325, 480);
    text("Lowest Rate of the Day: " + low[0] + ".", 150, 500);
    text("Last Updated: " + time[0] + ".", 385, 500);
    fill(0);


    for (i = 0; i < page.length; i++);
    {
      noFill();
      strokeWeight(2);
      
      scale(4);
      point(x1, 375-h);

      if (x1 > 141) {
        x1 = 41;
        background(b);
      }
      else {
        x1++;
      }
    }
  }
}

// FOR EURO TO DOLLAR
class Graph1 {
  int i1 = 0;
  float bit1;
  int y1;
  float x1 = 0;
  String[] bits1;
  String[] high1;
  String[] low1;
  String [] time1;
  float h1 = 0;
  float x3 = 41;

  Graph1(int y1, float bit1) {
    bit1 = 0;
    y1 = 0;
  }
  void eurusdupdate() {
    font = loadFont("MyriadApple-Medium-48.vlw"); 
    textFont(font, 14);
    String[] page = loadStrings("http://www.marketwatch.com/investing/currencies/tools");

    // initilise a new string variable to put the page into
    String p = "";

    //for every line 
    for (int i=0;i<page.length;i++) {
      p += page[i];
    }

    String startMarker = "4867876";
    String endMarker = "</tr>";
    int start = p.indexOf(startMarker);
    p = p.substring(start+startMarker.length(), p.length());
    int end = p.indexOf(endMarker);
    String ss = p.substring(0, end);


    String[] list = split(ss, "bgBid");
    bits1 = list[1].split(">");
    //bits = list[1].split("<td class=\"bgBid\">");
    bits1 = bits1[1].split("<");

    String[] list1 = split(ss, "/td>");
    high1 = list1[3].split(">");
    high1 = high1[1].split("<");

    String[] list2 = split(ss, "/td>");
    low1 = list2[4].split(">");
    low1 = low1[1].split("<");

    String[] list3 = split(ss, "/td>");
    time1 = list3[5].split(">");
    time1 = time1[1].split("<");

    bit1 =  float(bits1[0]) * 20;

    h1 = map(bit1, 20, 40, 0, 500);

    fill(155);

    back = loadImage("back.png");
    image(back, 135, 465);
    fill(255);
    text("Showing rate for Euro to US Dollars", 160, 515);
    text("Current Rate: " + bits1[0] + ".", 150, 480);
    text("Highest Rate of the Day: " + high1[0] + ".", 325, 480);
    text("Lowest Rate of the Day: " + low1[0] + ".", 150, 500);
    text("Last Updated: " + time1[0] + ".", 385, 500);
    fill(0);

    for (i1 = 0; i1 < page.length; i1 ++);
    {
      noFill();
      strokeWeight(2);
      scale(4);
      point(x3, 375-h1);
      if (x3 > 141) {
        x3 = 41;
        background(b);
      }
      else {
        x3++;
      }
    }
  }
}
class Graph2 {
  int i2 = 0;
  float bit2;
  int y2;
  float x4 = 0;
  String[] bits2;
  String[] high2;
  String[] low2;
  String [] time2;
  float h2 = 0;
  float x5 = 41;


  Graph2(int y2, float bit2 ) {
    bit2 = 0;
    y2 = 0;
  }

  // FOR DOLLAR TO YEN
  void usdjpyupdate() {
    font = loadFont("MyriadApple-Medium-48.vlw"); 
    textFont(font, 14);
    String[] page = loadStrings("http://www.marketwatch.com/investing/currencies/tools");

    // initilise a new string variable to put the page into
    String p = "";

    //for every line 
    for (int i=0;i<page.length;i++) {
      p += page[i];
    }

    String startMarker = "4868123";
    String endMarker = "</tr>";
    int start = p.indexOf(startMarker);
    p = p.substring(start+startMarker.length(), p.length());
    int end = p.indexOf(endMarker);
    String ss = p.substring(0, end);


    String[] list = split(ss, "bgBid");
    bits2 = list[1].split(">");
    //bits = list[1].split("<td class=\"bgBid\">");
    bits2 = bits2[1].split("<");

    String[] list1 = split(ss, "/td>");
    high2 = list1[3].split(">");
    high2 = high2[1].split("<");

    String[] list2 = split(ss, "/td>");
    low2 = list2[4].split(">");
    low2 = low2[1].split("<");

    String[] list3 = split(ss, "/td>");
    time2 = list3[5].split(">");
    time2 = time2[1].split("<");

    bit2 =  float(bits2[0]) * 20;

    h2 = map(bit2, 20, 40, 0, 500);

    fill(155);

    back = loadImage("back.png");
    image(back, 135, 465);
    fill(255);
    text("Showing rate for US Dollars to Yen", 160, 515);
    text("Current Rate: " + bits2[0] + ".", 150, 480);
    text("Highest Rate of the Day: " + high2[0] + ".", 325, 480);
    text("Lowest Rate of the Day: " + low2[0] + ".", 150, 500);
    text("Last Updated: " + time2[0] + ".", 385, 500);
    fill(0);

    for (i2 = 0; i2 < page.length; i2 ++);
    {
      noFill();
      strokeWeight(2);
      scale(4);

      point(x5, 375-h2);
      if (x5 > 141) {
        x5 = 41;
        background(b);
      }
      else {
        x5++;
      }
    }
  }
}

class Graph3 {
  int i3 = 0;
  float bit3;
  int y3;
  float x6 = 0;
  String[] bits3;
  String[] high3;
  String[] low3;
  String [] time3;
  float h3 = 0;
  float x7 = 41;


  Graph3(int y3, float bit3 ) {
    bit3 = 0;
    y3 = 0;
  }


  // FOR EURO TO YEN
  void eurjpyupdate() {
    font = loadFont("MyriadApple-Medium-48.vlw"); 
    textFont(font, 14);
    String[] page = loadStrings("http://www.marketwatch.com/investing/currencies/tools");

    // initilise a new string variable to put the page into
    String p = "";

    //for every line 
    for (int i=0;i<page.length;i++) {
      p += page[i];
    }

    String startMarker = "4868123";
    String endMarker = "</tr>";
    int start = p.indexOf(startMarker);
    p = p.substring(start+startMarker.length(), p.length());
    int end = p.indexOf(endMarker);
    String ss = p.substring(0, end);


    String[] list = split(ss, "bgBid");
    bits3 = list[1].split(">");
    //bits = list[1].split("<td class=\"bgBid\">");
    bits3 = bits3[1].split("<");

    String[] list1 = split(ss, "/td>");
    high3 = list1[3].split(">");
    high3 = high3[1].split("<");

    String[] list2 = split(ss, "/td>");
    low3 = list2[4].split(">");
    low3 = low3[1].split("<");

    String[] list3 = split(ss, "/td>");
    time3 = list3[5].split(">");
    time3 = time3[1].split("<");

    bit3 =  float(bits3[0]) * 20;

    h3 = map(bit3, 20, 40, 0, 500);

    fill(155);

    back = loadImage("back.png");
    image(back, 135, 465);
    fill(255);
    text("Showing rate for Euro to Yen", 160, 515);
    text("Current Rate: " + bits3[0] + ".", 150, 480);
    text("Highest Rate of the Day: " + high3[0] + ".", 325, 480);
    text("Lowest Rate of the Day: " + low3[0] + ".", 150, 500);
    text("Last Updated: " + time3[0] + ".", 385, 500);
    fill(0);

    for (i3 = 0; i3 < page.length; i3 ++);
    {
      noFill();
      strokeWeight(2);
      scale(4);
      point(x7, 375-h3);
      if (x7 > 141) {
        x7 = 41;
        background(b);
      }
      else {
        x7++;
      }
    }
  }
}

class Table {

  float x;
  float y;



  Table(float x, float y) {
    this.y = y;
    this.x = x;
  }

  void display()
  {
    stroke(255);
    line(160, 450, 575, 450);
    line(160, 45, 160, 450);
  }
}


