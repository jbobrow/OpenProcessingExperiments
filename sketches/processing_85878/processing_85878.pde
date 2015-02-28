

int year = 0;
HScrollbar hs1;
Application app;

// data displayed
float co2, ind, bui, tra;
String stateSelected;
Image img1, img2, img3;

// The scale of our world
float zoom;
// A vector to store the offset from the center
PVector offset;
// The previous offset
PVector poffset;
// A vector for the mouse position
PVector mouse;

void setup()
{
  size(900,500);

  hs1 = new HScrollbar(30, height-8, width-60, 8, 8);
  // initialize a new instance of application
  app = new Application("STANDARD");
  setupApp(app);
  
  zoom = 1.0;
  offset = new PVector(0, 0);
  poffset = new PVector(0, 0);
  
  stateSelected = " ";
  smooth();
}


void draw()
{
  background(255);
  
  pushMatrix();
  translate(width/2, height/2);
  // Use scale for 2D "zoom"
  scale(zoom);
  // The offset (note how we scale according to the zoom)
  translate(offset.x/zoom, offset.y/zoom);
  
  strokeWeight(1);
  stroke(47,124,124, 80);
  line(-6000, 50, 6000, 50);
  line(-4, -6000, -4, 6000);
  stroke(150, 80);
  fill(225, 244, 244, 100);
  rect(-20-width/2, -30-height/2, width+20, height+50);
  
  app.display();
  popMatrix();
  
  zoomBtns();
  
  fill(47,124,124);
  textSize(20);
  text(stateSelected, 30, 35);
  textSize(12);
  bar01.displayStandard(app);
  bar01.setValue(co2);
  bar02.displayStandard(app);
  bar02.setValue(ind);
  bar03.displayStandard(app);
  bar03.setValue(bui);
  bar04.displayStandard(app);
  bar04.setValue(tra);
  img1.displayStandard(app);
  img2.displayStandard(app);
  img3.displayStandard(app);
  hs1.update();
  hs1.display();
  year = int(hs1.getPos()/100);
}


void mousePressed()
{
  if (mouseY < height - 50) {
    mouse = new PVector(mouseX, mouseY);
    poffset.set(offset);
  }
}

void keyPressed() {
  if (key == '+' && zoom <= 2.3) {
    zoom += 0.1;
  } 
  else if (key == '-' && zoom > 1.0) {
    zoom -= 0.1;
  }
}

// Calculate the new offset based on change in mouse vs. previous offsey
void mouseDragged() {
  if (mouseY < height - 80) {
    offset.x = mouseX - mouse.x + poffset.x;
    offset.y = mouseY - mouse.y + poffset.y;
  }
}
class Application
{
  private int state;
  String appMode = "STANDARD"; // environments: STANDARD / DEBUG
  PImage[] images;
  String[] imageFilenames;
  UI[] ui;
  
  
  Application (String _appMode)
  {
    state = 0;
    appMode = _appMode; 
  }
  
  void addUI (UI uiObj)
  {
    if (ui != null) {
      ui = (UI[]) append(ui, uiObj);
    } else {
      ui = new UI[1];
      ui[0] = uiObj;
    }
  }

  void display()
  {
    if (ui != null) {
      for (int i=0; i<ui.length; i++) {
        ui[i].display(this, appMode);
        ui[i].interact();
      }
    }
  }
  
  void setState (int newState)
  {
    state = newState;
  }
  
  int getState()
  {
    return state;
  }
  
  //--- IMAGE MANAGER ---//
  
  int loadImg (String filename)
  {
    if (images != null) {
      boolean imageFound = false;
      int imageIndex = -404;
      // verify if an image is already present
      for (int i=0; i<imageFilenames.length; i++) {
        if (filename.equals(imageFilenames[i])) {
          imageFound = true;
          imageIndex = i;
        }
      }
      if (!imageFound) {
        images = (PImage[]) append(images, loadImage(filename));
        imageFilenames = (String[]) append(imageFilenames, filename);
        imageIndex = images.length-1;
      }
      return imageIndex;
    } else {
      images = new PImage[1];
      imageFilenames = new String[1];
      images[0] = loadImage(filename);
      imageFilenames[0] = filename;
      return 0;
    } 
  }

  PImage getImg (int imageIndex)
  {
    if (images!=null && imageIndex<=images.length-1 && imageIndex>=0) {
      return images[imageIndex];
    }
    else {
      return null;
    }
  }
}

class HScrollbar
{
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if(overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if(mousePressed && over) {
      locked = true;
    }
    if(!mousePressed) {
      locked = false;
    }
    if(locked) {
      newspos = constraint(mouseX-sheight/2, sposMin, sposMax);
    }
    if(abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constraint(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if(mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos-20 && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(47,124,124);
    rect(xpos, ypos, swidth, sheight/4);
    if(over || locked) {
      fill(232, 96, 92);
    } else {
      fill(47,124,124);
    }
    ellipse(spos, ypos, sheight*2, sheight*2);
    noFill();
    stroke(255);
    strokeWeight(3);
    ellipse(spos, ypos, sheight*2, sheight*2);
    fill(47,124,124);
    textSize(12);
    text(1965+(year*5), spos-16, ypos-13);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}

class UI {

  float x, y, r, s;
  int sizeX, sizeY;
  Boolean visible;

  UI (float _x, float _y, int _sizeX, int _sizeY)
  {
    x = _x;
    y = _y;
    r = 0;
    s = 1;
    sizeX = _sizeX;
    sizeY = _sizeY;
    visible = true;
  }

  //--- DISPLAY METHODS ---//

  void display(Application app, String mode)
  {
    if (visible) {
      if (mode == "STANDARD") {
        displayStandard(app);
      }
      if (mode == "DEBUG") {
        displayDebug(app);
      }
    }
  }

  void displayDebug(Application app)
  {
    stroke(255);
    fill(255, 100);
    rect(x, y, sizeX, sizeY);
  }

  void displayStandard(Application app) 
  {
    // to be extended by subclasses
  }
  
  //--- INTERACT METHODS ---//
  
  void interact()
  {
    // to be extended by subclasses
  }
}


class StateDot extends UI {
  
  String state;
  String capital;
  PVector loc;
  float[] co2tot, indtot, buitot, tratot;
  float size;
  Boolean mouseOver;
  
  StateDot(String _state, String _capital, float _x, float _y, float[] _co2tot, float[] _ind, float[] _bui, float[] _tra) {
    super(_x, _y, 0, 0);
    state = _state;
    capital = _capital;
    loc = new PVector(_x, _y);
    co2tot = _co2tot;
    indtot = _ind;
    buitot = _bui;
    tratot = _tra;
    mouseOver = false;
  }
  
  void displayStandard(Application app)
  {
    noStroke();
    size = log(map(co2tot[year], 0, 7000000, 1, 50))*30;
    
    if (!mouseOver) {
      fill(50, 30);
      ellipse(loc.x, loc.y, size, size);
      fill(50);
      ellipse(loc.x, loc.y, 2, 2);
    } else {
      fill(232, 96, 92, 80);
      ellipse(loc.x, loc.y, size, size);
      fill(47,124,124);
      ellipse(loc.x, loc.y, 4, 4);
      fill(47,124,124);
      textSize(16);
      if (mouseX > width-150) {
        textAlign(RIGHT);
        text(capital, x-(size/2)-13, y+5);
        stroke(47,124,124);
        strokeWeight(1);
        line(x, y, x-(size/2)-10, y);
        textAlign(LEFT);
      } else {
        text(capital, x+(size/2)+13, y+5);
        stroke(47,124,124);
        strokeWeight(1);
        line(x, y, x+(size/2)+10, y);
      }
      stateSelected = state;
      co2 = int(co2tot[year]);
      ind = int(indtot[year]);
      bui = int(buitot[year]);
      tra = int(tratot[year]);
    }
  }
  
  void interact()
  {
    hover();
  }
  
  void hover()
  {
    if (dist((mouseX-width/2-offset.x)/zoom, (mouseY-height/2-offset.y)/zoom, loc.x, loc.y) < 8/zoom) {
      mouseOver = true;
    } else {
      mouseOver = false;
    }
  }
}

class Co2indicator extends UI {

  String title, unit;
  float value;
  
  Co2indicator (float _x, float _y, String _title, String _unit, float _value)
  {
    super(_x, _y, 25, 25);
    title = _title;
    value = _value;
    unit = _unit;
  }
  
  void displayStandard(Application app)
  {
    noStroke();
    fill(150);
    if (value*20 > 0) {
      text(int(value*20) + " " + unit, x, y+sizeY+30);
      fill(47,124,124);
      beginShape();
      vertex(x, y);
      vertex(x+sizeX+value, y);
      vertex(x+sizeX+8+value, y+sizeY/2);
      vertex(x+sizeX+value, y+sizeY);
      vertex(x, y+sizeY);
      endShape();
    } else {
      text("N/A", x, y+sizeY+30);
    }
    text(title, x, y+sizeY+15);
    rect(x, y, sizeX+value, sizeY);
  }
  
  void setValue(float v)
  {
    value = v/20;
  }
}


class Co2TotIndicator extends Co2indicator
{
  Co2TotIndicator (float _x, float _y, String _title, String _unit, float _value)
  {
    super(_x, _y, _title, _unit, _value);
  }
  
  void displayStandard(Application app)
  {
    noStroke();
    fill(150);
    if (value*20000 > 0) {
      text(int(value*20000) + " " + unit, x, y+sizeY+30);
      fill(232, 96, 92);
      beginShape();
      vertex(x, y);
      vertex(x+sizeX+value, y);
      vertex(x+sizeX+8+value, y+sizeY/2);
      vertex(x+sizeX+value, y+sizeY);
      vertex(x, y+sizeY);
      endShape();
    } else {
      text("N/A", x, y+sizeY+30);
      rect(x, y, sizeX+value, sizeY);
    }
    text(title, x, y+sizeY+15);
  }
  
  void setValue(float v)
  {
    value = v/20000;
  }
}


class Image extends UI
{
  int imageIndex;
  
  Image (Application app, String filename, float _x, float _y)
  {
    super(_x, _y, 0, 0);
    imageIndex = app.loadImg(filename);
  }
  
  void displayStandard (Application app)
  {
    image(app.getImg(imageIndex), x, y);
  }
}
float mapGeoTop = 64.18;
float mapGeoBottom = -41.20;
float mapGeoLeft = -175.44;
float mapGeoRight = 178.44;

Co2indicator bar01, bar02, bar03, bar04;

void setupApp (Application app)
{
  bar01 = new Co2TotIndicator (30, 50, "CO2 total", "Kt", co2);
  bar02 = new Co2indicator (30, 120, "Industry", "Mt", ind);
  bar03 = new Co2indicator (30, 190, "Buildings", "Mt", bui);
  bar04 = new Co2indicator (30, 260, "Transports", "Mt", tra);
  img1 = new Image (app, "ind.png", 30, 120);
  img2 = new Image (app, "bui.png", 30, 190);
  img3 = new Image (app, "tra.png", 31, 261);
  
  String[] rows = loadStrings("world-capitals-location.csv");
  String[] worldCo2 = loadStrings("world-co2.csv");
  
  for(int i=0; i<rows.length; i++) {
    String[] tokens = splitTokens(rows[i], ",");
    PVector loc = geoToPixel(parseFloat(tokens[2]), parseFloat(tokens[3]));
    
    String[] co2totS = splitTokens(worldCo2[i*8], ",");
    float[] co2tot = new float[10];
    for(int p=1; p<co2totS.length; p++) {
      co2tot[p-1] = parseFloat(co2totS[p]);
    }
    
    String[] indS = splitTokens(worldCo2[i*8+4], ",");
    float[] ind = new float[10];
    for(int p=1; p<indS.length; p++) {
      ind[p-1] = parseFloat(indS[p]);
    }
    
    String[] buiS = splitTokens(worldCo2[i*8+5], ",");
    float[] bui = new float[10];
    for(int p=1; p<buiS.length; p++) {
      bui[p-1] = parseFloat(buiS[p]);
    }
    
    String[] traS = splitTokens(worldCo2[i*8+7], ",");
    float[] tra = new float[10];
    for(int p=1; p<traS.length; p++) {
      tra[p-1] = parseFloat(traS[p]);
    }
    
    app.addUI(new StateDot (tokens[0], tokens[1], loc.x, loc.y, co2tot, ind, bui, tra));
  }
}

PVector geoToPixel (float lat, float lon)
{
    return new PVector(map(lon, mapGeoLeft, mapGeoRight, 20, width-20)-width/2,
                       map(lat, mapGeoTop, mapGeoBottom, 20, height-20)-height/2);
}

String[] extractData (String filename)
{
  String[] data = loadStrings(filename);
  
  return data;
}

void zoomBtns()
{
  if (dist(mouseX, mouseY, width-30, 40) < 12 && mousePressed && zoom <= 2.3) {
    zoom += 0.01;
    fill(232, 96, 92);
  } else {
    fill(47,124,124);
  }
  ellipse(width-30, 40, 20, 20);
  if (dist(mouseX, mouseY, width-30, 70) < 12 && mousePressed && zoom > 1.0) {
    zoom -= 0.01;
    fill(232, 96, 92);
  } else {
    fill(47,124,124);
  }
  ellipse(width-30, 70, 20, 20);
  if (dist(mouseX, mouseY, width-30, 100) < 12 && mousePressed) {
    zoom = 1.0;
    offset.x = 0;
    offset.y = 0;
    fill(232, 96, 92);
  } else {
    fill(150);
  }
  ellipse(width-30, 100, 20, 20);
  fill(255);
  textSize(15);
  textAlign(LEFT);
  text("+", width-35, 45);
  text("-", width-33, 75);
  textSize(16);
  text("x", width-34, 104);
}


