
private static final color BG_COLOUR = 0;
private static final int WIDTH = 750;
private static final int HEIGHT = 750;
private static PImage img;

private Planet sun = new Planet("Sun");
private Planet mercury = new Planet("Mercury");
private Planet venus = new Planet("Venus");
private Planet earth = new Planet("Earth");
private Planet mars = new Planet("Mars");
private Planet jupiter = new Planet("Jupiter");
private Planet saturn = new Planet("Saturn");
private Planet uranus = new Planet("Uranus");
private Planet neptune = new Planet("Neptune");

private Planet[] planets = {sun, 
                            mercury, 
                            venus,
                            earth,
                            mars,
                            jupiter,
                            saturn,
                            uranus,
                            neptune};

void setup(){
  size(WIDTH, HEIGHT);
  frameRate(60);
  smooth();
  img = loadImage("background.jpg");
}

void draw(){
  fill(BG_COLOUR);
  rect(0, 0, WIDTH, HEIGHT);
  tint(255, 125);
  image(img, 0, 0);
  
  drawPlanets();
  movePlanets();
  checkMousePos();
}

class Planet{
  // Stats about the planet
  private String name;
  private float massKg;
  private float radiusKm;
  private float radiusOfOrbitKm;
  private long ellipseOfOrbit;
  private float gravitationalPullN;
  private String[] mainElements;
  
  // For use in drawing the planet
  private float xPos;
  private float yPos;
  private float xChange;
  private float yChange;
  private float angle;
  private float orbit;
  private int size;
  private color colour;
  private boolean stopped;
  
  Planet(String planet){
    stopped = false;
    name = planet;
    
    if(planet.equals("Sun")){
        massKg = 1.989E30;
        radiusKm = 695500;
        gravitationalPullN = 273.7;
        
        mainElements = new String[2];
        mainElements[0] = "Hydrogen";
        mainElements[1] = "Helium";
        
        yPos = HEIGHT/2;
        xPos = WIDTH/2;
        angle = 0;
        size = 75;
        colour = #FFD34F;
        stopped = true;
    }
    else if(planet.equals("Mercury")){
        massKg = 328.5E21;
        radiusKm = 2440;
        radiusOfOrbitKm = 47910000;
        gravitationalPullN = 3.6;
        
        mainElements = new String[2];
        mainElements[0] = "Iron";
        mainElements[1] = "Silicon";
                
        yPos = HEIGHT/2 + 37;
        xPos = WIDTH/2 + 43;
        angle = 130;
        orbit = 1;
        size = 15;
        colour = #949494;
    }
    else if(planet.equals("Venus")){
        massKg = 4.869E24;
        radiusKm = 6052;
        radiusOfOrbitKm = 108200000;
        gravitationalPullN = 8.9;
        
        mainElements = new String[2];
        mainElements[0] = "Uranium";
        mainElements[1] = "Potassium";
        
        yPos = HEIGHT/2 + 57;
        xPos = WIDTH/2 + 67;
        angle = 130;
        orbit = 0.65;
        size = 20;
        colour = #FCE195;
    }
    else if(planet.equals("Earth")){
        massKg = 5.972E24;
        radiusKm = 6378;
        radiusOfOrbitKm = 149600000;
        gravitationalPullN = 9.8;
        
        mainElements = new String[2];
        mainElements[0] = "Iron";
        mainElements[1] = "Oxygen";
        
        yPos = HEIGHT/2 + 77;
        xPos = WIDTH/2 + 91;
        angle = 130;
        orbit = 0.48;
        size = 20;
        colour = #98CFF1;
    }
    else if(planet.equals("Mars")){
        massKg = 6.4219E23;
        radiusKm = 3397;
        radiusOfOrbitKm = 227940000;
        gravitationalPullN = 3.7;
        
        mainElements = new String[2];
        mainElements[0] = "Iron";
        mainElements[1] = "Silicates (Silicon & Oxygen)";
        
        yPos = HEIGHT/2 + 97;
        xPos = WIDTH/2 + 115;
        angle = 130;
        orbit = 0.38;
        size = 15;
        colour = #FF6505;
    }
    else if(planet.equals("Jupiter")){
        massKg = 1.900E27;
        radiusKm = 71492;
        radiusOfOrbitKm = 778330000;
        gravitationalPullN = 24.8;
        
        mainElements = new String[2];
        mainElements[0] = "Hydrogen";
        mainElements[1] = "Helium";
        
        yPos = HEIGHT/2 + 128;
        xPos = WIDTH/2 + 153;
        angle = 130;
        orbit = 0.285;
        size = 50;
        colour = #FCBF79;
    }
    else if(planet.equals("Saturn")){
        massKg = 5.68E26;
        radiusKm = 60268;
        radiusOfOrbitKm = 1429400000;
        gravitationalPullN = 10.4;
        
        mainElements = new String[2];
        mainElements[0] = "Hydrogen";
        mainElements[1] = "Helium";
        
        yPos = HEIGHT/2 + 170;
        xPos = WIDTH/2 + 203;
        angle = 130;
        orbit = 0.215;
        size = 40;
        colour = #C78840;
    }
    else if(planet.equals("Uranus")){
        massKg = 8.683E14;
        radiusKm = 25559;
        radiusOfOrbitKm = 287099E4;
        gravitationalPullN = 8.7;
        
        mainElements = new String[2];
        mainElements[0] = "Ice, Hydrogen & Oxygen";
        mainElements[1] = "Methane, Carbon & Hydrogen";
        
        yPos = HEIGHT/2 + 197;
        xPos = WIDTH/2 + 235;
        angle = 130;
        orbit = 0.185;
        size = 25;
        colour = #6ACCFC;
    }
    else if(planet.equals("Neptune")){
        massKg = 1.0247E36;
        radiusKm = 49532;
        radiusOfOrbitKm = 4504E6;
        gravitationalPullN = 11.2;
        
        mainElements = new String[2];
        mainElements[0] = "Ice, Hyrdrogen & Oxygen";
        mainElements[1] = "Ammonia, Nitrogen & Hydrogen";
        
        yPos = HEIGHT/2 + 221;
        xPos = WIDTH/2 + 264;
        angle = 130;
        orbit = 0.165;
        size = 25;
        colour = #4F90FF;
    }
  }
  
  public float[] getXBounds(){
    float[] xBounds = new float[2];
    xBounds[0] = xPos-(size/2);
    xBounds[1] = xPos+(size/2);
    return xBounds;
  }
  
  public float[] getYBounds(){
    float[] yBounds = new float[2];
    yBounds[0] = yPos-(size/2);
    yBounds[1] = yPos+(size/2);
    return yBounds;
  }
  
  public boolean getStopped(){
    return stopped;
  }
  
  public String getName(){
    return name; 
  }
  
  public void display(){
    fill(colour);
    ellipse(xPos, yPos, size, size);
  }
  
  public void move(){
    if(stopped == false){
      angle += orbit;
      if(angle%360==0){
        angle = 0;
      }
      xChange = cos(radians(angle));
      yChange = sin(radians(angle));
      xPos += xChange;
      yPos += yChange;
    }
  }
  
  public void stopMoving(){
    stopped = true;
  }
  
  public void startMoving(){
    stopped = false;
  }
  
  public void showName(){
    textSize(20);
    text(name, xPos-15, yPos-10-size/2);
  }
  
  public void displayStats(){
    int spacing = 50;
    int elementSpacing = 50;
    fill(255);
    
    text("Mass: " + str(massKg) + " Kg", 50, spacing);
    spacing+=50;
    
    text("Gravitational Pull: " + str(gravitationalPullN) + " N", 50, spacing);
    spacing+=50;
    
    text("Radius: " + str(radiusKm) + " Km", 50, spacing);
    spacing+=50;
    
    if(!name.equals("Sun")){
      text("Orbital Radius: " + str(radiusOfOrbitKm) + " Km", 50, spacing);
      spacing+=50;
    }
    
    text("Most Abundunt Elements: ", 50, spacing);
    spacing+=50;
    for(int i=0; i<mainElements.length; i++){
      text(mainElements[i], 100, spacing);
      spacing+=50;
    }
    
    //mainElements;
  }
}

void drawPlanets(){
  sun.display();
  mercury.display();
  venus.display();
  earth.display();
  mars.display();
  jupiter.display();
  saturn.display();
  uranus.display();
  neptune.display();
}

void movePlanets(){
  mercury.move();
  venus.move();
  earth.move();
  mars.move();
  jupiter.move();
  saturn.move();
  uranus.move();
  neptune.move();
}

void checkMousePos(){
  float[] xBounds = new float[2];
  float[] yBounds = new float[2];
  
  for(int i=0; i<planets.length; i++){
    xBounds = planets[i].getXBounds();
    yBounds = planets[i].getYBounds();
    if(mouseX>xBounds[0] && mouseX<xBounds[1] && mouseY>yBounds[0] && mouseY<yBounds[1]){
       planets[i].stopMoving();
       planets[i].showName();
       planets[i].displayStats();
    }
    else{
       planets[i].startMoving();
    }
  }
}

