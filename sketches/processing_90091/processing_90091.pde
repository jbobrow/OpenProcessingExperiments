
/* information websites:
 * http://gscentral.net/pricing1.htm
 * http://en.wikipedia.org/wiki/List_of_The_Price_Is_Right_pricing_games
 * http://tpirsummaries.8m.com/Other/index.html
 * http://thepriceisright.balloflightning.com/odds.php
 * http://www.ncssm.edu/courses/math/TCMConf/TCM2003/talks%202003/GAMESHOW1_carltonmort.pdf
 * http://www.priceisright.com/show/games/double-cross
 */
import processing.pdf.*;

public color WHITE = color(255);
public color ORANGE = color(250, 162, 27);
public color DARK_ORANGE = color(161, 95, 34);
public color RED = color(237, 53, 35);
public color YELLOW = color(255, 221, 0);
public color BLUE = color(79, 144, 195);
public color LIGHT_BLUE = color(115, 168, 193);

boolean startedCapture;

PFont font_normal;
PFont font_bold;

float graphX;
float graphY;
float graphWidth;
float graphHeight;

TextReader textReader;
GameData gameData;
GameGraph gameGraph;

ButtonStrip buttonStrip;
About about;
Help help;

CustomCursor customCursor;

void setup() {
  size(1024, 680);
  noCursor();
  smooth();

  startedCapture = false;

  font_normal = loadFont("Utsaah-48.vlw");
  font_bold = loadFont("Utsaah-Bold-48.vlw");

  graphX = 50;
  graphY = height-75-20;
  graphWidth = width-75-25-25-25-25;
  graphHeight = height-75-25-20;

  textReader = new TextReader("priceIsRightGamesFinal.txt");
  gameData = new GameData();
  gameGraph = new GameGraph(gameData, graphX, graphY, graphWidth, graphHeight);

  buttonStrip = new ButtonStrip(gameData, width-60, 0, 55, height);
  about = new About(width/8, height/4, 600, 300);
  help = new Help();

  customCursor = new CustomCursor();

  textReader.readHeader(1);

  String ln;
  while ( (ln = textReader.readLine ()) != null) {
    ln = ln.replace("\"", "");

    String[] elements = split(ln, TAB);
    gameData.insertGame(elements);
  }
}

void draw() {
  update();
  render();
}

void update() {  
  gameGraph.update();
}

void render() {
  background(ORANGE);
  gameGraph.render();
}

void drawCircles(float r, float x, float y) {
  ellipseMode(CENTER);
  for (int i=0; i < 10; i++) {
    pushMatrix();
    translate(x, y);
    rotate(radians(i * 36));
    translate(-x, -y);
    ellipse(x, y-r, r/2, r/2);
    popMatrix();
  }
}

float getBottomX() {
  float bottomX = map(mouseX, 0, width, 3, width-1);
  if (mouseX <= graphX+graphWidth && mouseY < graphY-22) {
    bottomX = map(getTopX()-45, 0, width, 3, width-1);
  }
  if (mouseX > graphX+graphWidth) bottomX = graphX+graphWidth;
  return bottomX;
}

float getTopX() {
  float topX = map(mouseX, 0, width, graphX+22, width-27);
  if (mouseX > graphX+graphWidth+22) topX = width-32.1;
  return topX;
}

float getTopY() {
  float topY = map(mouseY, 0, graphY-22, 22, graphY-22);
  if (mouseX > graphX+graphWidth+22) {
    float quadHeight = height/10;
    topY = 23.9+getQuadrant(quadHeight)*quadHeight;
  }
  return topY;
}

float getQuadrant(float quadHeight) {
  return (int)(mouseY/quadHeight);
}

void keyPressed() {
  /*if (key == 'r') {
   if (!startedCapture) {
   startedCapture = true;
   beginRecord(PDF, "priceIsRight.pdf");
   }
   else {
   startedCapture = false;
   endRecord();
   exit();
   }
   }*/
}

public class About {
  float x;
  float y;

  float w;
  float h;
  
  public About(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    
    this.w = w;
    this.h = h;
  }
  
  public void render() {
    fill(WHITE, 200);
    noStroke();
    rectMode(CORNER);
    rect(0, 0, width-65, height);
    
    // draw price tag
    noFill();
    stroke(BLUE);
    strokeWeight(7);
    bezier(x+w/10, y+h/2, x-w/10, y+3*h/4, x+10, y+9*h/8, x+10, y+9*h/8);

    noFill();
    stroke(WHITE);
    strokeWeight(2);
    bezier(x+w/10, y+h/2, x-w/10, y+3*h/4, x+10, y+9*h/8, x+10, y+9*h/8);

    fill(YELLOW);
    stroke(WHITE);
    strokeWeight(3);
    beginShape();
    vertex(x, y+h/4);
    vertex(x+w/6, y);
    vertex(x+7*w/6, y);
    vertex(x+7*w/6, y+h);
    vertex(x+w/6, y+h);
    vertex(x, y+3*h/4);
    endShape(CLOSE);
    //rectMode(CORNER);
    //rect(x, y, w, h);

    ellipseMode(CENTER);
    fill(ORANGE);
    stroke(WHITE);
    strokeWeight(3);
    ellipse(x+w/10, y+h/2, 15, 15);

    noFill();
    stroke(BLUE);
    strokeWeight(7);
    bezier(x+w/10, y+h/2, x+w/5, y+3*h/4, x, y+9*h/8, x, y+9*h/8);
    
    noFill();
    stroke(WHITE);
    strokeWeight(2);
    bezier(x+w/10, y+h/2, x+w/5, y+3*h/4, x, y+9*h/8, x, y+9*h/8);

    textAlign(LEFT, CENTER);
    String s;
    float textX = x+40+w/6;
    float textY = y+80;
    float textYOffset = 60;

    fill(RED);
    textFont(font_bold, 60);
    s = "The Price is in the Payoff";
    text(s, textX, textY);

    fill(RED);
    textFont(font_normal, 30);
    rectMode(CORNER);
    s = "A visualization of the payoffs of the currently played";
    text(s, textX, textY + 1*textYOffset);
    
    fill(RED);
    textFont(font_normal, 30);
    s = "Price is Right games, as determined by the ratio";
    text(s, textX, textY + 1.5*textYOffset);

    fill(RED);
    textFont(font_normal, 30);
    s = "of maximum possible dollar winnings to the probability";
    text(s, textX, textY + 2*textYOffset);

    fill(RED);
    textFont(font_normal, 30);
    s = "of winning each game";
    text(s, textX, textY + 2.5*textYOffset);
  }
}
public class Button {
  float x;
  float y;
  String[] s;
  int quad;
  float quadHeight;

  boolean selected;  

  public Button(float x, float y, String[] s, int quad, float quadHeight) {
    this.x = x;
    this.y = y;
    this.s = s;
    this.quad = quad;
    this.quadHeight = quadHeight;
    
    selected = false;
  }

  public void render() {
    drawCircles(18, x, y);
    drawCircles(10, x, y);
    drawCircles(5, x, y);

    for (int i=0; i < s.length; i++) {
      text(s[i], x, y+25+10*i);
    }
  }
  
  public void update() {
      if (mouseX > graphX+graphWidth+22 && quad == getQuadrant(quadHeight)) {
        selected = true;
      }    
      else {
        selected = false;
      }
  }
}

public class ButtonStrip {
  float x; // left
  float y; // upper
  float w;
  float h;

  GameData gameData;
  
  int[] colors;
  Button[] buttons;

  public ButtonStrip(GameData gameData, float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    this.gameData = gameData;

    colors = new int[10];
    for (int i=0; i < colors.length; i++) {
      colors[i] = YELLOW;
    }

    buttons  = new Button[10];
    for (int i=0; i < buttons.length; i++) {
      buttons[i] = new Button(x+w/2, (i+0.35)*h/10, new String[2], i, height/10);
    }
    buttons[0].s[0] = "about";
    buttons[0].s[1] = "";
    buttons[1].s[0] = "help";
    buttons[1].s[1] = "";
    buttons[2].s[0] = "least $";
    buttons[2].s[1] = "average";
    buttons[3].s[0] = "most $";
    buttons[3].s[1] = "average";
    buttons[4].s[0] = "least $";
    buttons[4].s[1] = "possible";
    buttons[5].s[0] = "most $";
    buttons[5].s[1] = "possible";
    buttons[6].s[0] = "least";
    buttons[6].s[1] = "wins";
    buttons[7].s[0] = "most";
    buttons[7].s[1] = "wins";
    buttons[8].s[0] = "least";
    buttons[8].s[1] = "plays";
    buttons[9].s[0] = "most";
    buttons[9].s[1] = "plays";
  } 
  
  public void update() {
    for (int i=0; i < buttons.length; i++) {
      buttons[i].update();
      
      if (buttons[i].selected) colors[i] = RED;
      else colors[i] = YELLOW;
    }
  }

  public void render() {
    fill(DARK_ORANGE);
    noStroke();
    rectMode(CORNER);
    rect(x, y, w, h);

    noStroke();
    textAlign(CENTER, CENTER);
    rectMode(CENTER);
    textFont(font_bold, 18);
    for (int i=0; i < buttons.length; i++) {
      fill(colors[i]);
      buttons[i].render();
    }
  }
  
  public int getSelectedData() {
    if (buttons[2].selected) {
      return gameData.minAverageWinnings();
    }
    if (buttons[3].selected) {
      return gameData.maxAverageWinnings();
    }
    if (buttons[4].selected) {
      return gameData.minMaxWinnings();
    }
    if (buttons[5].selected) {
      return gameData.maxMaxWinnings();
    }
    if (buttons[6].selected) {
      return gameData.minMaxWinningStats();
    }
    if (buttons[7].selected) {
      return gameData.maxMaxWinningStats();
    }
    if (buttons[8].selected) {
      return gameData.minFrequencies();
    }
    if (buttons[9].selected) {
      return gameData.maxFrequencies();
    }
    return -1;
  }
}

public class CustomCursor {
  boolean overTop;

  float x;
  float y;

  public CustomCursor() {
    overTop = false;

    x = mouseX;
    y = mouseY;
  }

  public void render() {
    if (mouseX > graphX+graphWidth+42 || mouseY < graphY-22) {
      noStroke();
      if (!overTop) fill(BLUE);
      else fill(RED);
      float r;

      x = getTopX();
      y = getTopY();
      
      for (int i=0; i < gameGraph.points.size(); i++) {
        float dx = abs(x - gameGraph.points.get(i).x);
        float dy = abs(y - gameGraph.points.get(i).y);

        if (/*dx < gameGraph.wBtwTicks/2*/(dx*dx + dy*dy) <= 25) {
          x = gameGraph.points.get(i).x;
          y = gameGraph.points.get(i).y;
        }
      }

      if (overTop && mouseX <= graphX+graphWidth+22 ) {
        drawCircles(32, x, y);
      }
      drawCircles(18, x, y);
      drawCircles(10, x, y);
      drawCircles(5, x, y);
    }

    noFill();
    stroke(RED);
    strokeWeight(3);
    line(getBottomX(), height, getBottomX(), height-20);
  }
}

public class GameData {
  ArrayList<String> games; // names
  ArrayList<String> averageWinnings; // in dollars
  ArrayList<String> maxWinnings; // in dollars
  ArrayList<String> maxWinningStats; // percentage
  ArrayList<String> frequencies; // percentage

  public GameData() {
    games = new ArrayList<String>();
    averageWinnings = new ArrayList<String>();
    maxWinnings = new ArrayList<String>();
    maxWinningStats = new ArrayList<String>();
    frequencies = new ArrayList<String>();
  }

  public void insertGame(String[] elements) {
    games.add(elements[0].replace("-", " "));
    averageWinnings.add(elements[1]);
    maxWinnings.add(elements[2]);
    maxWinningStats.add(elements[3]);  
    frequencies.add(elements[4]);
  }

  public double getAverageWinnings(int i) {
    String ln = averageWinnings.get(i);
    ln = ln.replace("$", "");
    ln = ln.replace(",", "");

    return Double.parseDouble(ln);
  }

  public double getMaxWinnings(int i) {
    String ln = maxWinnings.get(i);
    ln = ln.replace("$", "");
    ln = ln.replace(",", "");

    return Double.parseDouble(ln);
  }

  public double getMaxWinningStats(int i) {
    String ln = maxWinningStats.get(i);
    ln = ln.replace("%", "");

    return Double.parseDouble(ln);
  }

  public double getFrequencies(int i) {
    String ln = frequencies.get(i);
    ln = ln.replace("%", "");

    return Double.parseDouble(ln);
  }
  
  public int minAverageWinnings() {
    double min = getAverageWinnings(0);
    int j = 0;
    for (int i=0; i < averageWinnings.size(); i++) {
      if (getAverageWinnings(i) < min) {
        min = getAverageWinnings(i);
        j = i;
      }
    }
    return j;
  }
  
  public int maxAverageWinnings() {
    double max = getAverageWinnings(0);
    int j = 0;
    for (int i=0; i < averageWinnings.size(); i++) {
      if (getAverageWinnings(i) > max) {
        max = getAverageWinnings(i);
        j = i;
      }
    }
    return j;
  }
  
    public int minMaxWinnings() {
    double min = getMaxWinnings(0);
    int j = 0;
    for (int i=0; i < maxWinnings.size(); i++) {
      if (getMaxWinnings(i) < min) {
        min = getMaxWinnings(i);
        j = i;
      }
    }
    return j;
  }
  
  public int maxMaxWinnings() {
    double max = getMaxWinnings(0);
    int j = 0;
    for (int i=0; i < maxWinnings.size(); i++) {
      if (getMaxWinnings(i) > max) {
        max = getMaxWinnings(i);
        j = i;
      }
    }
    return j;
  }
  
    public int minMaxWinningStats() {
    double min = getMaxWinningStats(0);
    int j = 0;
    for (int i=0; i < maxWinningStats.size(); i++) {
      if (getMaxWinningStats(i) < min) {
        min = getMaxWinningStats(i);
        j = i;
      }
    }
    return j;
  }
  
  public int maxMaxWinningStats() {
    double max = getMaxWinningStats(0);
    int j = 0;
    for (int i=0; i < maxWinningStats.size(); i++) {
      if (getMaxWinningStats(i) > max) {
        max = getMaxWinningStats(i);
        j = i;
      }
    }
    return j;
  }
  
    public int minFrequencies() {
    double min = getFrequencies(0);
    int j = 0;
    for (int i=0; i < frequencies.size(); i++) {
      if (getFrequencies(i) < min) {
        min = getFrequencies(i);
        j = i;
      }
    }
    return j;
  }
  
  public int maxFrequencies() {
    double max = getFrequencies(0);
    int j = 0;
    for (int i=0; i < frequencies.size(); i++) {
      if (getFrequencies(i) > max) {
        max = getFrequencies(i);
        j = i;
      }
    }
    return j;
  }
}

public class GameGraph {
  boolean setUp;

  float graphX; // left axis
  float graphY; // lower axis

  float graphWidth;
  float graphHeight;

  float leftOffset;
  float rightOffset;

  float upperOffset;
  float lowerOffset;

  float vertTickHorOffset;
  float vertTickVertOffset;

  int selected;
  int neighbor1;
  int neighbor2;

  GameData gameData;

  float upperBound;
  float lowerBound;
  float diff;

  int numGameTicks;
  int numPriceTicks;

  float wBtwTicks;
  float hBtwTicks;

  ArrayList<Line> axes;

  ArrayList<Line> horLines;
  ArrayList<Line> vertLines;

  ArrayList<TickHor> horTicks;
  ArrayList<TickVert> vertTicks;

  ArrayList<Point> points;
  ArrayList<Line> connectors;
  ArrayList<Line> heights;

  ArrayList<GameInfoBlock> gameInfoBlocks;

  ArrayList<Integer> pointColors;
  ArrayList<Integer> dataColors;
  ArrayList<Integer> lineColors;

  ArrayList<Float> dataFontSizes;
  ArrayList<PFont> dataFonts;
  ArrayList<Float> dataRadii;
  ArrayList<Float> dataLineWeights; 

  public GameGraph(GameData gameData, float graphX, float graphY, float graphWidth, float graphHeight) {
    setUp = false;

    this.graphX = graphX;
    this.graphY = graphY;  

    this.graphWidth = graphWidth;
    this.graphHeight = graphHeight;

    leftOffset = 0 + graphX;
    rightOffset = width - (graphX+graphWidth);

    upperOffset = 0 + (graphY-graphHeight);
    lowerOffset = height - graphY;

    vertTickHorOffset = 35;
    vertTickVertOffset = 75;

    selected = -1;
    neighbor1 = -1;
    neighbor2 = -1;

    this.gameData = gameData;

    upperBound = 0;
    lowerBound = 0;

    numGameTicks = 0;
    numPriceTicks = 0;

    wBtwTicks = 0;
    hBtwTicks = 0;

    axes = new ArrayList<Line>();

    horLines = new ArrayList<Line>();
    vertLines = new ArrayList<Line>();

    horTicks = new ArrayList<TickHor>();
    vertTicks = new ArrayList<TickVert>();

    points = new ArrayList<Point>();
    connectors = new ArrayList<Line>();
    heights = new ArrayList<Line>();

    gameInfoBlocks = new ArrayList<GameInfoBlock>();

    pointColors = new ArrayList<Integer>();
    dataColors = new ArrayList<Integer>();
    lineColors = new ArrayList<Integer>();

    dataFontSizes = new ArrayList<Float>();
    dataFonts = new ArrayList<PFont>();
    dataRadii = new ArrayList<Float>();
    dataLineWeights = new ArrayList<Float>();
  }

  public boolean setUp() {
    lowerBound = 0.0;
    //100*floor((float)(gameData.minAverageWinnings()/100));
    upperBound = 15000.0; 
    //100*ceil((float)(gameData.maxAverageWinnings()/100));
    diff = upperBound - lowerBound;

    numGameTicks = gameData.games.size();
    numPriceTicks = ((int)diff / 100); 

    wBtwTicks = (graphWidth - 2*vertTickHorOffset) / numGameTicks;
    hBtwTicks = graphHeight / numPriceTicks;

    getAxes();

    getTicks();

    getCoords();

    return true;
  }

  public void getAxes() {
    axes.add(new Line(graphX, graphY, graphX, graphY-graphHeight)); // vert axis
    axes.add(new Line(graphX, graphY, graphX+graphWidth, graphY)); // hor axis
  }

  public void getTicks() { 
    for (int i=0; i < numGameTicks+1; i++) {
      vertLines.add(new Line(graphX+vertTickHorOffset+i*wBtwTicks, graphY, graphX+36+i*wBtwTicks, graphY-graphHeight));
      if (i > 0) 
        vertTicks.add(new TickVert(graphX+vertTickHorOffset+i*wBtwTicks, graphY, graphX+vertTickHorOffset-leftOffset/2+i*wBtwTicks-20, (graphY+vertTickVertOffset)-5, gameData.games.get(i-1)));
    }

    for (int i=0; i < numPriceTicks+1; i++) {
      if (i % 10 == 0) {
        horLines.add(new Line(graphX, graphY-i*hBtwTicks, graphX+graphWidth, graphY-i*hBtwTicks));
        String str = "$" + ((int)(lowerBound + i*100));
        horTicks.add(new TickHor(graphX, graphY-i*hBtwTicks, graphX - leftOffset/2, graphY-i*hBtwTicks, str));
      }
    }
  }

  public void getCoords() {  
    for (int i=0; i < numGameTicks; i++) {
      double winnings = gameData.getAverageWinnings(i);

      float xCoord = graphX + vertTickHorOffset + (i+1)*wBtwTicks;
      float yCoord = 
        map((float)winnings, lowerBound, upperBound, graphY, graphY-graphHeight);

      points.add(new Point(xCoord, yCoord));
      heights.add(new Line(xCoord, graphY, xCoord, yCoord));

      gameInfoBlocks.add(new GameInfoBlock(i, 85, 35));

      pointColors.add(WHITE);
      dataColors.add(WHITE);
      lineColors.add(YELLOW);

      dataFonts.add(font_normal);
      dataFontSizes.add(12.0);
      dataRadii.add(5.0);
      dataLineWeights.add(1.0);

      if (i > 0) {
        connectors.add(new Line(points.get(i), points.get(i-1)));
      }
    }
  }

  public void update() {
    if (!setUp) setUp = setUp();

    boolean overtop = false;

    buttonStrip.update();
    int selectedData = buttonStrip.getSelectedData();
    if (selectedData > -1 
      || buttonStrip.buttons[0].selected
      || buttonStrip.buttons[1].selected) overtop = true;

    for (int i=0; i < points.size(); i++) {
      float dx = abs(getTopX() - points.get(i).x);
      float dy = abs(getTopY() - points.get(i).y);

      float dh = mouseY - graphY;      
      float dw = points.get(i).x - getBottomX();

      if ((dx*dx + dy*dy) <= 25/*dx < gameGraph.wBtwTicks/2*/) {
        pointColors.set(i, YELLOW);
        dataColors.set(i, BLUE);
        lineColors.set(i, WHITE);

        dataFonts.set(i, font_bold);  
        dataFontSizes.set(i, 40.0);
        dataRadii.set(i, 8.0);
        dataLineWeights.set(i, 3.0);

        overtop = true;
        selected = i;
        neighbor1 = i-1;
        neighbor2 = i+1;
      } 
      else if (mouseY >= graphY-22 && 35 < dw && dw < 45 || i == selectedData) {
        pointColors.set(i, RED);
        dataColors.set(i, BLUE);
        lineColors.set(i, WHITE);

        dataFonts.set(i, font_bold);  
        dataFontSizes.set(i, 40.0);
        dataRadii.set(i, 12.0);
        dataLineWeights.set(i, 2.0);

        overtop = true;
        selected = i;
        neighbor1 = i-1;
        neighbor2 = i+1;
      }
      else {
        pointColors.set(i, WHITE);
        dataColors.set(i, WHITE);
        lineColors.set(i, YELLOW);

        dataFontSizes.set(i, 12.0);
        dataFonts.set(i, font_normal);
        dataRadii.set(i, 5.0);
        dataLineWeights.set(i, 1.0);
      }
    }

    if (overtop) {
      customCursor.overTop = true;
      if (buttonStrip.buttons[0].selected
        || buttonStrip.buttons[1].selected) {
        selected = -1;
        neighbor1 = -1;
        neighbor2 = -1;
      }
    }
    else {
      customCursor.overTop = false;
      selected = -1;
      neighbor1 = -1;
      neighbor2 = -2;
    }

    /*if (neighbor1 >= 0) {
      //pointColors.set(neightbor1, YELLOW);
      dataColors.set(neighbor1, RED);
      //lineColors.set(neighbor1, WHITE);

      dataFonts.set(neighbor1, font_bold);  
      dataFontSizes.set(neighbor1, 20.0);
      //dataRadii.set(neighbor1, 6.0);
      //dataLineWeights.set(neighbor1, 3.0);
    }
    if (0 < neighbor2 && neighbor2 < points.size()) {
      //pointColors.set(neightbor2, YELLOW);
      dataColors.set(neighbor2, RED);
      //lineColors.set(neighbor2, WHITE);

      dataFonts.set(neighbor2, font_bold);  
      dataFontSizes.set(neighbor2, 20.0);
      //dataRadii.set(neighbor2, 6.0);
      //dataLineWeights.set(neighbor2, 3.0);
    }*/
  }

  public void render() {
    for (int i=0; i < axes.size(); i++) {
      stroke(RED);
      strokeWeight(2);
      axes.get(i).render();
    }

    for (int i=0; i < horLines.size(); i++) {
      stroke(RED);
      strokeWeight(0.25);
      horLines.get(i).render();
    }

    for (int i=0; i < heights.size(); i++) {
      stroke(lineColors.get(i));
      strokeWeight(dataLineWeights.get(i));
      heights.get(i).render();
    }

    for (int i=0; i < horTicks.size(); i++) {
      fill(RED);
      stroke(RED);
      strokeWeight(2);
      textAlign(RIGHT, CENTER);
      textFont(font_normal, 16);
      horTicks.get(i).render();
    }

    for (int i=0; i < vertTicks.size(); i++) {
      fill(dataColors.get(i));
      stroke(lineColors.get(i));
      strokeWeight(dataLineWeights.get(i));
      textFont(dataFonts.get(i), dataFontSizes.get(i));
      if (selected != i /*&& neighbor1 != i && neighbor2 != i*/) vertTicks.get(i).render();
    }

    buttonStrip.render();

    for (int i=0; i < points.size(); i++) {
      fill(pointColors.get(i));
      noStroke();
      points.get(i).render(dataRadii.get(i));
    }

    customCursor.render();
    
    /*if (0 <= neighbor1) {
      fill(dataColors.get(neighbor1));
      stroke(lineColors.get(neighbor1));
      strokeWeight(dataLineWeights.get(neighbor1));
      textFont(dataFonts.get(neighbor1), dataFontSizes.get(neighbor1));
      vertTicks.get(neighbor1).render();

      gameInfoBlocks.get(neighbor1).render(gameData);
    }
    
    if (0 < neighbor2 && neighbor2 < points.size()) {
      fill(dataColors.get(neighbor2));
      stroke(lineColors.get(neighbor2));
      strokeWeight(dataLineWeights.get(neighbor2));
      textFont(dataFonts.get(neighbor1), dataFontSizes.get(neighbor2));
      vertTicks.get(neighbor2).render();

      gameInfoBlocks.get(neighbor2).render(gameData);
    }*/

    if (selected != -1) {
      fill(dataColors.get(selected));
      stroke(lineColors.get(selected));
      strokeWeight(dataLineWeights.get(selected));
      textFont(dataFonts.get(selected), dataFontSizes.get(selected));
      vertTicks.get(selected).render();

      gameInfoBlocks.get(selected).render(gameData);
    }

    if (buttonStrip.buttons[0].selected) {
      about.render();
    }

    if (buttonStrip.buttons[1].selected) {
      help.render();
    }
  }
}

public class GameInfoBlock {
  int index;

  float x;
  float y;

  float w;
  float h;

  public GameInfoBlock(int index, float x, float y) {
    this.index = index;

    this.x = x;
    this.y = y;

    w = 200;
    h = 100;
  }

  public void render(GameData gameData) {
    // draw price tag
    noFill();
    stroke(BLUE);
    strokeWeight(7);
    bezier(x+w/10, y+h/2, x-w/10, y+3*h/4, x+10, y+9*h/8, x+10, y+9*h/8);

    noFill();
    stroke(WHITE);
    strokeWeight(2);
    bezier(x+w/10, y+h/2, x-w/10, y+3*h/4, x+10, y+9*h/8, x+10, y+9*h/8);

    fill(YELLOW);
    stroke(WHITE);
    strokeWeight(3);
    beginShape();
    vertex(x, y+h/4);
    vertex(x+w/6, y);
    vertex(x+7*w/6, y);
    vertex(x+7*w/6, y+h);
    vertex(x+w/6, y+h);
    vertex(x, y+3*h/4);
    endShape(CLOSE);
    //rectMode(CORNER);
    //rect(x, y, w, h);

    ellipseMode(CENTER);
    fill(ORANGE);
    stroke(WHITE);
    strokeWeight(3);
    ellipse(x+w/10, y+h/2, 15, 15);

    noFill();
    stroke(BLUE);
    strokeWeight(7);
    bezier(x+w/10, y+h/2, x+w/5, y+3*h/4, x, y+9*h/8, x, y+9*h/8);
    
    noFill();
    stroke(WHITE);
    strokeWeight(2);
    bezier(x+w/10, y+h/2, x+w/5, y+3*h/4, x, y+9*h/8, x, y+9*h/8);

    textAlign(LEFT, CENTER);
    String s;
    float textX = x+20+w/6;
    float textY = y+8;
    float textYOffset = 20;

    fill(RED);
    textFont(font_bold, 20);
    s = gameData.games.get(index);
    text(s, textX, textY + 0*textYOffset);

    fill(RED);
    textFont(font_normal, 14);
    s = "Payoff: " + gameData.averageWinnings.get(index);
    text(s, textX, textY + 1*textYOffset);

    fill(RED);
    textFont(font_normal, 14);
    s = "Max Possible Winnings: " + gameData.maxWinnings.get(index);
    text(s, textX, textY + 2*textYOffset);

    fill(RED);
    textFont(font_normal, 14);
    s = "Win Max " + gameData.maxWinningStats.get(index) + "of the Time";
    text(s, textX, textY + 3*textYOffset);

    fill(RED);
    textFont(font_normal, 14);
    s = "Is Played " + gameData.frequencies.get(index) + "of the Time";
    text(s, textX, textY + 4*textYOffset);
  }
}

public class Help {

  public Help() {
  }

  public void render() {
    String s;

    fill(WHITE, 100);
    noStroke();
    rectMode(CORNER);
    rect(0, 0, width-65, height);

    fill(RED);
    textAlign(CENTER, CENTER);
    textFont(font_bold, 20);
    s = "browse games by payoff by scrolling mouse over plotted points";
    text(s, graphX+graphWidth/2+4, 20);

    fill(RED);
    textAlign(CENTER, CENTER);
    textFont(font_bold, 20);
    s = "browse games alphabetically by scrolling mouse laterally";
    text(s, graphX+graphWidth/2+4, height-15);

    noFill();
    stroke(RED);
    strokeWeight(3);
    line(graphX, height-12, graphX+graphWidth/4, height-12);
    line(graphX+graphWidth-75, height-12, graphX+3*graphWidth/4, height-12);
    line(graphX, height-12, graphX-15, height-12-20);
    line(graphX+graphWidth-75, height-12, graphX+graphWidth-75+15, height-12-20);

    noFill();
    stroke(RED);
    strokeWeight(3);
    ellipseMode(CENTER);
    ArrayList<Point> points = gameGraph.points;
    for (int i=0; i < points.size(); i++) {
      Point point = points.get(i);
      if (point.y < height/3) ellipse(point.x, point.y, 20, 20);
    }
    
    fill(RED);
    textAlign(CENTER, CENTER);
    textFont(font_bold, 16);
    s = "browse game data extrema by scrolling vertically";
    for (int i=0; i < s.length(); i++) {
      char c = s.charAt(i);
      text(c, graphX+graphWidth+45, 170+i*10);
    }


    fill(BLUE);
    textAlign(LEFT, CENTER);
    textFont(font_bold, 20);
    s = "payoffs";
    text(s, 110, graphHeight/2+20);

    noFill();
    stroke(BLUE);
    strokeWeight(3);
    drawBracketOpenLeft(60, 20, 80, graphHeight+10);

    fill(BLUE);
    textAlign(RIGHT, CENTER);
    textFont(font_bold, 20);
    s = "extrema";
    text(s, graphX+graphWidth, graphHeight/2+126);

    noFill();
    stroke(BLUE);
    strokeWeight(3);
    drawBracketOpenRight(graphX+graphWidth+50, 150, 80, 520);

    fill(BLUE);
    textAlign(CENTER, CENTER);
    textFont(font_bold, 20);
    s = "games";
    text(s, graphX+graphWidth/2+4, graphY-50);

    noFill();
    stroke(BLUE);
    strokeWeight(3);
    drawBracketOpenDown(graphX+34, graphY+10, 80, 790);
  }

  public void drawBracketComponent(float x, float y, float w, float h) {
    beginShape();
    vertex(x, y);
    bezierVertex(x, y, x+w/2, y, x+w/2, y+h/15);
    vertex(x+w/2, y+14*h/15);
    bezierVertex(x+w/2, y+14*h/15, x+w/2, y+h, x+w, y+h);
    endShape();
  }

  public void drawBracketOpenLeft(float x, float y, float w, float h) {
    drawBracketComponent(x, y, w/2, h/2);
    drawBracketComponent(x, y+h, w/2, -h/2);
  }

  public void drawBracketOpenRight(float x, float y, float w, float h) {
    drawBracketOpenLeft(x, y, -w, h);
  }

  public void drawBracketOpenDown(float x, float y, float w, float h) {
    pushMatrix();
    translate(x, y);
    rotate(radians(-90));
    translate(-x, -y);
    drawBracketOpenLeft(x, y, w, h);
    popMatrix();
  }
}

public class Line {
  Point p1;
  Point p2;

  public Line(float x1, float y1, float x2, float y2) {
    p1 = new Point(x1, y1);
    p2 = new Point(x2, y2);
  }

  public Line(Point p1, Point p2) {
    this.p1 = p1;
    this.p2 = p2;
  }

  public void render() {
    line(p1.x, p1.y, p2.x, p2.y);
  }
}

public class Point {
  float x;
  float y;

  public Point(float x, float y) {
    this.x = x;
    this.y = y;
  }

  public void render(float r) {
    ellipseMode(CENTER);
    ellipse(x, y, r, r);
  }
}

public class TextReader {
  BufferedReader bufferedReader;

  public TextReader(String filename) {
      bufferedReader = createReader(filename);
      
      println("file loaded successfully");
  }

  public String[] readHeader(int numLines) {
    try {
      String[] header = new String[numLines];
      for (int i=0; i < numLines; i++) {
        header[i] = bufferedReader.readLine();
      }
      return header;
    }
    catch (IOException e) {
      println("Error: " + e.getMessage());
    }
    return null;
  }

  public String readLine() {
    try {
      return bufferedReader.readLine();
    }
    catch (IOException e) {
      println("Error: " + e.getMessage());
    }
    return null;
  }
}

public abstract class Tick {
  Point tp;
  Point sp;
  String s;

  public Tick(float tx, float ty, float sx, float sy, String s) {
    tp = new Point(tx, ty);
    sp = new Point(sx, sy);
    this.s = s;
  }

  public Tick(Point tp, Point sp, String s) {
    this.tp = tp;
    this.sp = sp;
    this.s = s;
  }

  public abstract void render();
}

public class TickHor extends Tick {
  public TickHor(float tx, float ty, float sx, float sy, String s) {
    super(tx, ty, sx, sy, s);
  }

  public TickHor(Point tp, Point sp, String s) {
    super(tp, sp, s);
  }

  public void render() {
    line(tp.x-5, tp.y, tp.x+5, tp.y);
    textAlign(CENTER, CENTER);
    text(s, sp.x, sp.y);
  }
}

public class TickVert extends Tick {
  public TickVert(float tx, float ty, float sx, float sy, String s) {
    super(tx, ty, sx, sy, s);
  }

  public TickVert(Point tp, Point sp, String s) {
    super(tp, sp, s);
  }

  public void render() {
    line(tp.x, tp.y-5, tp.x, tp.y+5);
    
    pushMatrix();
    translate(tp.x, tp.y+5);
    rotate(radians(-60));
    translate(-tp.x, -(tp.y+5));
    line(tp.x, tp.y+5, tp.x-75, tp.y+5);
    popMatrix();
    
    textAlign(LEFT, CENTER);
    pushMatrix();
    translate(sp.x, sp.y);
    rotate(radians(-60));
    translate(-sp.x, -sp.y);
    text(s, sp.x, sp.y);
    popMatrix();
  }
}



