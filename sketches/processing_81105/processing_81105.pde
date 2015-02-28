
boolean menu = true;
boolean prices = false;
boolean map1 = false;
boolean results = false;
boolean ticketmaster = false;
boolean gMapper = false;





void setup () {
  size (400, 550);
  smooth();
  noStroke();
}
void draw  () {
  if (menu == true) 
  { 
    textAlign (TOP, LEFT);
    menu();
  }
  if (map1 == true) 
  {
    textAlign (TOP, LEFT);
    map1();
  }
  if (results == true)
  {
    textAlign (TOP, LEFT);
    results();
  }
  if (prices == true)
  {
    textAlign (CENTER, BOTTOM);
    prices();
  }
}


void menu() {
  noStroke();
  size (400, 550);
  PImage b;
  b = loadImage("image.jpg");
  background(b);

  PImage a;
  a = loadImage("title.jpg");
  image (a, 0, 0);
  fill (0, 191, 255);
  ellipse(190, 175, 50, 50);  
  ellipse(175, 175, 50, 50);
  ellipse(190, 275, 50, 50);
  ellipse(175, 275, 50, 50);
  ellipse(190, 375, 50, 50);
  ellipse(175, 375, 50, 50);
  ellipse(190, 475, 50, 50);
  ellipse(175, 475, 50, 50);  
  rect (100, 150, 200, 50, 7, 7, 7, 7);
  rect (100, 250, 200, 50, 7, 7, 7, 7);
  rect (100, 350, 200, 50, 7, 7, 7, 7);
  rect (127, 450, 150, 50, 7, 7, 7, 7);
  fill (255);
  PFont font;
  font = loadFont ("AgencyFB-Bold-48.vlw");
  textFont (font, 40);
  text("Map", 180, 190);
  text("1.", 115, 190);
  text("Prices", 180, 290);
  text("2.", 115, 290);
  text("Results", 180, 390);
  text("3.", 115, 390);
  textFont (font, 25);
  text("Ticket Master", 160, 490);
  text("4.", 135, 490);
}




void map1 () 
{
  // This code was taken from http://googlemapper.pt.vu/
  noStroke();

  PImage map;
  GoogleMapper gMapper;    


  double maCenterLat = 53.47629816758783;
  double mapCenterLon = -2.245931625366211;
  int zoomLevel = 13;
  String mapType = GoogleMapper.MAPTYPE_HYBRID;
  int mapWidth=400;
  int mapHeight=550;

  gMapper = new GoogleMapper(maCenterLat, mapCenterLon, zoomLevel, mapType, mapWidth, mapHeight);

  map = gMapper.getMap();

  image(map, 0, 0);

  //saveFrame("map.jpg");

  println(gMapper.y2lat(240));//outputs 40.7782667
  println(gMapper.x2lon(320));//outputs -73.9698797
  println(gMapper.lat2y(40.7782667));//outputs 240.0
  println(gMapper.lon2x(-73.9698797));//outputs 320.0
  fill (0, 191, 255);

  //end of code taken from http://googlemapper.pt.vu/

  // test ellipse (40, 40, 20, 20);
  ellipse (340, 350, 15, 15);
  ellipse (220, 160, 15, 15);
  ellipse (260, 210, 15, 15);
  ellipse (218, 285, 15, 15);
  ellipse (260, 360, 15, 15);
  ellipse (280, 390, 15, 15);
  ellipse (235, 275, 15, 15);

  if ( dist(pmouseX, pmouseY, 340, 350) <=15) {
    rect(0, 400, 550, 500);
    fill (0, 191, 255);
    fill (0);
    PFont font;
    font = loadFont ("AgencyFB-Bold-48.vlw");
    textFont (font, 20);
    text("Venue2: Manchester 02 Apollo", 2, 425);
    text("Band: Rizzle Kicks", 2, 450);
    text("Date: 24/11/2012", 2, 475);
    text("Doors: 7pm", 2, 500);
    text("Price: £18.00", 2, 525);
  }
  if (dist(pmouseX, pmouseY, 220, 160) <=15) {
    rect(0, 400, 550, 500);
    fill (0, 191, 255);
    fill(0);
    PFont font;
    font = loadFont ("AgencyFB-Bold-48.vlw");
    textFont (font, 20);
    text("Venue3: MEN Arena", 2, 425);
    text("Band:Mumford & Sons", 2, 450);
    text("Date: 10/12/2012", 2, 475);
    text("Doors:7.30pm", 2, 500);
    text("price: £35.00", 2, 525);
  }
  if (dist(pmouseX, pmouseY, 260, 210) <=15) {
    rect(0, 400, 550, 500);
    fill (0, 191, 255);
    fill(0);
    PFont font;
    font = loadFont ("AgencyFB-Bold-48.vlw");
    textFont (font, 40);
    text("Venue: NQ live", 2, 435);
    text("Band: No Events", 2, 480);
  }
  if (dist(pmouseX, pmouseY, 218, 285) <=15) {
    rect(0, 400, 550, 500);
    fill (0, 191, 255);
    fill(0);
    PFont font;
    font = loadFont ("AgencyFB-Bold-48.vlw");
    textFont (font, 20);
    text("Venue5: HMV Ritz", 2, 425);
    text("Band: Saxon", 2, 450);
    text("Date: 23/04/2013", 2, 475);
    text("Doors:7.30pm", 2, 500);
    text("Price: £21.00", 2, 525);
  }
  if (dist(pmouseX, pmouseY, 260, 360) <=15) {
    rect(0, 400, 550, 500);
    fill (0, 191, 255);
    fill(0);
    PFont font;
    font = loadFont ("AgencyFB-Bold-48.vlw");
    textFont (font, 20);
    text("Venue6: Academy 3", 2, 425);
    text("Band: Glasvegas", 2, 450);
    text("Date: 02/12/2012", 2, 475);
    text("Doors: 7pm", 2, 500);
    text("price: £15.95", 2, 525);
  } 
  if (dist(pmouseX, pmouseY, 280, 390) <=15) {
    rect(0, 400, 550, 500);
    fill (0, 191, 255);
    fill(0);
    PFont font;
    font = loadFont ("AgencyFB-Bold-48.vlw");
    textFont (font, 20);
    text("Venue4:Academy 1", 2, 425);
    text("Band:Stereophonics", 2, 450);
    text("Date: 16/12/2012", 2, 475);
    text("Doors:7pm", 2, 500);
    text("price: £35.75", 2, 525);
  }
  if (dist(pmouseX, pmouseY, 235, 275) <=15) {
    rect(0, 400, 550, 500);
    fill (0, 191, 255);
    fill(0);
    PFont font;
    font = loadFont ("AgencyFB-Bold-48.vlw");
    textFont (font, 20);
    text("Venue1:Palace Theatre", 2, 425);
    text("Band: Greenday", 2, 450);
    text("Date: 22/11/2012", 2, 475);
    text("Doors: 8pm", 2, 500);
    text("Price: £31.35", 2, 525);
  }
  stroke(255); 
  strokeWeight(5);
  ellipse (35, 25, 30, 30);
  rect (1, 1, 100, 40, 7, 7, 7, 7);
  fill (255);
  PFont font;
  font = loadFont ("AgencyFB-Bold-48.vlw");
  textFont (font, 20);
  text("Home", 35, 30);

  //noLoop();
}

void prices ()
{

  PImage b;
  b = loadImage("image.jpg");
  background(b);
  PImage a;
  a = loadImage("title.jpg");
  image (a, 0, 0);
  fill (255);
  ellipse (120, 300, 30, 30);
  ellipse (160, 280, 30, 30);
  ellipse (200, 250, 30, 30);
  ellipse (240, 155, 30, 30);
  ellipse (280, 120, 30, 30);
  ellipse (320, 110, 30, 30);
  loadStrings("prices.csv");
  stroke(255);
  strokeWeight(1);


  String[] Venue = {
    "1:", 
    "2:", 
    "3:", 
    "4:", 
    "5:", 
    "6:",
  };

  float[] price = {
    15.95, 
    18.00, 
    21.00, 
    31.35, 
    34.45, 
    35.75,
  };
  int x=100;
  for (int i=0;i<price.length;i++) {

    float h = map(price[i], 0, 40, 0, 400);


    if (mouseX>x && mouseX<=x+40) {
      fill(0, 191, 255);
    }
    else {
      fill (122, 92, 178);
    }
    rect(x+4, (height-h) -50, 35, h);
    x+=40;
  }
  stroke(255); 
  strokeWeight(5);
  line(90, 130, 90, 500);
  line(90, 500, 350, 500);
  fill (122, 92, 178);

  PFont font;
  font = loadFont ("AgencyFB-Bold-48.vlw");
  float p =133;
  float u= 420; 
  pushMatrix();
  translate (p, u);
  rotate(-HALF_PI);
  text ("Glasvegas £15.95", 0, 0);
  popMatrix(); 
  float p1 =173;
  float u1= 420; 
  pushMatrix();
  translate (p1, u1);
  rotate(-HALF_PI);
  text ("Rizzle Kicks £18", 0, 0);
  popMatrix(); 
  float p2 =213;
  float u2= 420; 
  pushMatrix();
  translate (p2, u2);
  rotate(-HALF_PI);
  text ("Saxon £21", 0, 0);
  popMatrix();
  float p3 =253;
  float u3= 420; 
  pushMatrix();
  translate (p3, u3);
  rotate(-HALF_PI);
  text ("Green Day £31.35", 0, 0);
  popMatrix();
  float p4 =293;
  float u4= 400; 
  pushMatrix();
  translate (p4, u4);
  rotate(-HALF_PI);
  text ("Mumford & Sons £34.45", 0, 0);
  popMatrix();
  float p5 =333;
  float u5= 400; 
  pushMatrix();
  translate (p5, u5);
  rotate(-HALF_PI);
  text ("Stereophonics £35.75", 0, 0);
  popMatrix();

  fill (255);
  textFont(font, 30); 
  float p6=80;
  float u6=350; 
  pushMatrix();
  translate (p6, u6);
  rotate(-HALF_PI);
  text ("Cost of Tickets", 0, 0);
  popMatrix();




  fill (0, 191, 255);
  noStroke();
  ellipse (330, 530, 40, 40);
  stroke(255); 
  strokeWeight(5);
  rect (290, 510, 100, 40, 7, 7, 7, 7);

  fill (255);
  textAlign (TOP, LEFT);
  font = loadFont ("AgencyFB-Bold-48.vlw");
  textFont (font, 25);

  text ("Artists in order of cost", 30, 530);
  textFont (font, 20);
  text("Home", 325, 540);
}


void results ()
{
  PImage b;
  b = loadImage("image.jpg");
  background(b);

  PImage a;
  a = loadImage("title.jpg");
  PImage r;
  r = loadImage ("results.jpg");
  image (r, 0, 88);
  image (a, 0, 0);
  stroke(255); 
  strokeWeight(5);
  fill (255);
  ellipse (330, 525, 40, 40);
  fill (0, 191, 255);


  rect (290, 505, 100, 40, 7, 7, 7, 7);
  PFont font;
  font = loadFont ("AgencyFB-Bold-48.vlw");
  fill (255);
  textFont (font, 20);
  text("Home", 325, 535);
} 
void keyPressed() {
  if (key == '1')
  { 
    menu = false;
    map1 = true;
  }
  if (key == '2')
  {
    menu = false;
    prices = true;
  }
  if (key == '3')
  {
    menu = false;
    results = true;
  }
  if (key == '4')

  {
    link ("www.ticketmaster.co.uk");
  }
  if (key == 'b')

  {
    menu = true;
    results = false;
    map1= false;
    prices = false;
    gMapper = false;
    loop();
  }
}
void mouseClicked() {

  if (menu == true && dist(pmouseX, pmouseY, 190, 175)<=50)

  {
    menu = false;
    map1= true;
  }

  if (menu == true && dist(mouseX, mouseY, 190, 275)<=50) 
  {

    menu = false;
    prices= true;
  }

  if (menu == true && dist(pmouseX, pmouseY, 190, 375) <=50) 
  {
    menu = false;
    results= true;
  }

  if (menu == true && dist(pmouseX, pmouseY, 190, 475) <=50) 
  {
    menu = true;
    link ("www.ticketmaster.co.uk");
  }
  if (prices == true && dist(pmouseX, pmouseY, 120, 300) <=30)
  {
    prices = true;
    link ("http://www.ticketmaster.co.uk/event/1F004943A25320D2?artistid=1243253&majorcatid=10001&minorcatid=60");
  }
  if (prices == true && dist(pmouseX, pmouseY, 160, 280) <=30)
  {
    prices = true;
    link ("http://www.ticketmaster.co.uk/event/1F004943A25320D2?artistid=1243253&majorcatid=10001&minorcatid=60");
  }
  if (prices == true && dist(mouseX, mouseY, 200, 250) <=30)
  {
    prices = true;
    link ("http://www.ticketmaster.co.uk/event/1F00496198583790?artistid=736050&majorcatid=10001&minorcatid=200");
  }
  if (prices == true && dist(pmouseX, pmouseY, 240, 155) <=30)
  {
    prices = true;
    link ("http://www.ticketmaster.co.uk/event/1F004943A25320D2?artistid=1243253&majorcatid=10001&minorcatid=60");
  }
  if (prices == true && dist(pmouseX, pmouseY, 280, 120) <=30)
  {
    prices = true;
    link ("http://www.ticketmaster.co.uk/event/1F00493592E9BFFD?artistid=1388154&majorcatid=10001&minorcatid=2");
  }
  if (prices == true && dist(pmouseX, pmouseY, 320, 110) <=30)
  {
    prices = true;
    link ("http://www.ticketmaster.co.uk/event/1F004961E9E699E4?artistid=795944&majorcatid=10001&minorcatid=1");
  }
  if (prices == true && dist (pmouseX, pmouseY, 330, 530) <=40)
  {
    prices = false;
    menu = true;
  }
  if (map1 == true && dist (pmouseX, pmouseY, 35, 25) <=30)
  {
    map1 = false;
    menu = true;
  }
  if (results == true && dist (pmouseX, pmouseY, 330, 525) <=40)
  {
    results=false;
    menu = true;
  }
}

 
 

