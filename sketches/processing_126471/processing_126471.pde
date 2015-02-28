
/*@pjs font="http://mod.zlotskiy.com/EdMaxPrime/Fonts/Molot.otf,http://mod.zlotskiy.com/EdMaxPrime/Fonts/saxmono.ttf,http://mod.zlotskiy.com/EdMaxPrime/Fonts/Raleway-Regular.otf";*/
int counter;
String place;
String dna = "";
boolean released;
int whenreleased;
PFont big;
PFont sax;
PFont reg;
Bubble test = new Bubble(width/2, height/2);
color defaultColor; //For cells with no owner

void setCookie(String name, var value, int expH, int expM) {
  var d = new Date();
  d.setTime(d.getTime()+(expH*60*60*1000)+(expM*60*1000));
  document.cookie = name+"="+value+"; expires="+d.toGMTString();
}
String getCookie(String name) {
  var allcookies = document.cookie.split(";");
  for(int i = 0; i < allcookies.length; i++) {
    String thisCookie = allcookies[i].trim();
    if(thisCookie.indexOf(name) == 0) {
      return allcookies[i].substring(name.length()+2, allcookies[i].length());
    }
  }
  return "We couldn't find your cookie that matches \'"+name+"\'";
}

void setup() {  //setup function called initially, only once
  size(600, 600);
  place = "home";
  background(120, 240, 240);
  big = createFont("http://mod.zlotskiy.com/EdMaxPrime/Fonts/Molot.otf", 60, true);
  sax = createFont("http://mod.zlotskiy.com/EdMaxPrime/Fonts/saxmono.ttf", 18, true);
  reg = createFont("http://mod.zlotskiy.com/EdMaxPrime/Fonts/Raleway-Regular.otf", 16, true);
  rectMode(CORNER);
  released = false;
  whenreleased = 0;
  defaultColor = color(64, 11, 99);
  console.log("Time:"+(new Date().getTime())+" Day:"+day()+" Month:"+month()+" Year:"+year());
  //setCookie("virtuallyH-", "1.0", 5, 30);
}

void draw() {  //draw function loops 
  if(whenreleased > 0) { released = false; }
  whenreleased++;
  if(place.indexOf("home") == 0) {
    background(120, 240, 240);
    fill(255);
    textFont(big);
    text(" Virtually \nHomeostasis", width/5, 100);
    button("Play =>","GoTo:library",2*width/5,height/2);
    button("Help?","GoTo:help?GoTo:home",2*width/5,height/2+height/15);
    test.update(true);
  }
  else if(place.indexOf("library") == 0) {
    if(second() % 2 == 0) { 
      background(222, 195, 221);
      fill(255);
      textFont(big);
      text(" Customize \nGenetic Code", width/5, 100);
      textFont(sax);
      stroke(255);
      fill(222, 195, 221);
      rect(5, 3*height/10, width-5, height/2);
    }
    button("Home", "GoTo:home", 3*width/8, 4*height/5);
    button("Play", "GoTo:start", width/8, 4*height/5);
  }
  else if(place.indexOf("help") == 0) {
    background(240);
    textFont(big);
    fill(0);
    text("Help", 3*width/8, height/8);
    textFont(reg);
    text("    This is the help page. The game is a petridish where special cells can thrive. Your cell is one of these, and you are the genetecist in charge. \n\n In this simulation your cell maintains homeostasis by maintaining a specific color. It will divide and try to create necessary protiens. But it needs supplies. The supplies are the colors in your cell. It will draw the needed amounts from the cytoplasm. But this can also mean it will take too much, and its color will be out of wack. You need to make sure it does not have too much or too little of each. \n\n Vesicles(in VH they are called bubbles) provide your cell with supplies. We have inserted a pipe into your petridish that pumps these bubbles into a steady stream. Each vesicle contains a little of each color, and can easily enter your cell.", 5, height/4, width-10, height/2);
    textFont(big);
    fill(240, 120, 33);
    text("Genes -->", width/8, 16*height/18);
    button("Done", place.split("\\?", 2)[1], width/12, 17*height/18-2);
    button("Next", "GoTo:help/2?"+place.split("\\?", 2)[1], 5*width/12, 17*height/18-2);
  }
  else if(place.indexOf("game") == 0) {
    background(12, 23, 79);
    test.update(true);
    fill(255);
    text("This is a BETA test!", 5, width/4);
  }
  else if(place.equals("error1")) {
    background(237, 47, 21);
    fill(230);
    textFont(big);
    text("Error 1 : \nUnknown action!", (width-textWidth("Unknown action!"))/2, 100);
    button("<= Home", "GoTo:home", 2*width/5, height/2);
  }
  else {
    background(237, 47, 21);
    fill(230);
    textFont(big);
    text("Error 2 : \nUnknown location!", (width-textWidth("Unknown location!"))/2, 100);
    textFont(sax);
    text("Place: \""+place+"\"", 20, 2*height/5);
    button("<= Home", "GoTo:home", 2*width/5, height/2);
  }
}

void mouseReleased() {
  released = true;
  whenreleased = 0;
  test = new Bubble(width/2, height/2);
}

void mousePressed() {
  released = false;
}

void button(String btext, String act, int x, int y) {
  if(inside(x, y, width/4-4, height/18-4)) {
    fill(89, 216, 107);
  } else {
    fill(67, 143, 89);
  }
  stroke(0);
  rect(x, y, (width/4)-4, height/18-4);
  fill(255);
  textFont(sax);
  text(btext, x+( (width/4-4)-textWidth(btext) )/2, y+height/25-4);
  if(released && inside(x, y, width/4-4, height/18-4)) { doAction(act); }
}

boolean inside(int x, int y, int w, int h) {
  if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) { return true; }
  else { return false; }
}

void doAction(String action) {
  if(action.indexOf(";") != -1) {
    String[] code = action.split(";");
    for(int i = 0; i < code.length; i++) {
      doAction(code[i]);
    }
  }
    else {
    if(action.indexOf("GoTo:") == 0) { place = action.substring(5, action.length()); }
    else { place = "error1"; }
    }
}

class Bubble {
  int xpos, ypos;
  int red, green, blue;
  int diam;
  
  Bubble(int x, int y) {
    red = int(floor(random(0, 256)));
    green = int(floor(random(0, 256)));
    blue = int(floor(random(0, 256)));
    xpos = x;
    ypos = y;
    diam = round(random(7, 20));
  }
  void setColor(int r, int g, int b) {
    red = r; green = g; blue = b;
  }
  void update(boolean shouldIDisplay) {
    if(shouldIDisplay) { displer(); }
  }
  void displer() {
    stroke(0);
    fill(red, green, blue);
    ellipseMode(CENTER);
    ellipse(xpos, ypos, diam, diam);
  }
}

class Cell{
  color ownerColor;
}

class Player{
  int aitype;
  int index;
  color flag;
  ArrayList cells;
  String dna;
  
  Player(int ai, int index, color c) {
    aitype = ai;
    this.index = index;
    flag = c;
    cells = new ArrayList();
    dna = "";
  }
  
  void update() {
    switch(aitype) {
      case 1:
      
      break;
      default:
      
      break;
    }
  }
  /*Adds or removes a cell from the array
  @conquer - true if adding the cell false if removing*/
  void editCell(Cell cellToEdit, boolean conquer) {
    if(conquer) {
      cell.ownerColor = flag;
      cells.add(cell);
    } else {
      cell.ownerColor = defaultColor;
      cells.remove(cells.indexOf(cell));
    }
  }
}
