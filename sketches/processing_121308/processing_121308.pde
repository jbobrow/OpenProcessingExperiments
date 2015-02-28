
private static final color BG_COLOUR = 0;
private static final int WIDTH = 750;
private static final int HEIGHT = 750;

private Planet sun = new Planet("sun");
private Planet mercury = new Planet("mercury");
private Planet venus = new Planet("venus");
private Planet earth = new Planet("earth");
private Planet mars = new Planet("mars");
private Planet jupiter = new Planet("jupiter");
private Planet saturn = new Planet("saturn");
private Planet uranus = new Planet("uranus");
private Planet neptune = new Planet("neptune");

void setup(){
  size(750, 750);
  frameRate(60);
  smooth();
}

void draw(){
  fill(BG_COLOUR, 200);
  rect(0, 0, WIDTH, HEIGHT);
  
  drawPlanets();
  movePlanets();
  checkMousePos();
}

class Planet{
  // Stats about the planet
  private String name;
  private float massKg;
  private int radiusKm;
  private long radiusOfOrbitKm;
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
    
    if(planet.equals("sun")){
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
    else if(planet.equals("mercury")){
        massKg = 328.5E21;
        radiusKm = 2440;
        radiusOfOrbitKm = 0;
        ellipseOfOrbit = 0;
        gravitationalPullN = 3.6;
        
        mainElements = new String[0];
        
        yPos = HEIGHT/2 + 37;
        xPos = WIDTH/2 + 43;
        angle = 130;
        orbit = 1;
        size = 15;
        colour = #949494;
    }
    else if(planet.equals("venus")){
        massKg = 0;
        radiusKm = 0;
        radiusOfOrbitKm = 0;
        ellipseOfOrbit = 0;
        gravitationalPullN = 0;
        
        mainElements = new String[0];
        
        yPos = HEIGHT/2 + 57;
        xPos = WIDTH/2 + 67;
        angle = 130;
        orbit = 0.65;
        size = 20;
        colour = #FCE195;
    }
    else if(planet.equals("earth")){
        massKg = 0;
        radiusKm = 0;
        radiusOfOrbitKm = 0;
        ellipseOfOrbit = 0;
        gravitationalPullN = 0;
        
        mainElements = new String[0];
        
        yPos = HEIGHT/2 + 77;
        xPos = WIDTH/2 + 91;
        angle = 130;
        orbit = 0.48;
        size = 20;
        colour = #98CFF1;
    }
    else if(planet.equals("mars")){
        massKg = 0;
        radiusKm = 0;
        radiusOfOrbitKm = 0;
        ellipseOfOrbit = 0;
        gravitationalPullN = 0;
        
        mainElements = new String[0];
        
        yPos = HEIGHT/2 + 97;
        xPos = WIDTH/2 + 115;
        angle = 130;
        orbit = 0.38;
        size = 15;
        colour = #FF6505;
    }
    else if(planet.equals("jupiter")){
        massKg = 0;
        radiusKm = 0;
        radiusOfOrbitKm = 0;
        ellipseOfOrbit = 0;
        gravitationalPullN = 0;
        
        mainElements = new String[0];
        
        yPos = HEIGHT/2 + 128;
        xPos = WIDTH/2 + 153;
        angle = 130;
        orbit = 0.285;
        size = 50;
        colour = #FCBF79;
    }
    else if(planet.equals("saturn")){
        massKg = 0;
        radiusKm = 0;
        radiusOfOrbitKm = 0;
        ellipseOfOrbit = 0;
        gravitationalPullN = 0;
        
        mainElements = new String[0];
        
        yPos = HEIGHT/2 + 170;
        xPos = WIDTH/2 + 203;
        angle = 130;
        orbit = 0.215;
        size = 40;
        colour = #C78840;
    }
    else if(planet.equals("uranus")){
        massKg = 0;
        radiusKm = 0;
        radiusOfOrbitKm = 0;
        ellipseOfOrbit = 0;
        gravitationalPullN = 0;
        
        mainElements = new String[0];
        
        yPos = HEIGHT/2 + 197;
        xPos = WIDTH/2 + 235;
        angle = 130;
        orbit = 0.185;
        size = 25;
        colour = #6ACCFC;
    }
    else if(planet.equals("neptune")){
        massKg = 0;
        radiusKm = 0;
        radiusOfOrbitKm = 0;
        ellipseOfOrbit = 0;
        gravitationalPullN = 0;
        
        mainElements = new String[0];
        
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
  
  Planet[] planets = {sun, 
                      mercury, 
                      venus,
                      earth,
                      mars,
                      jupiter,
                      saturn,
                      uranus,
                      neptune};
  
  for(int i=0; i<planets.length; i++){
    xBounds = planets[i].getXBounds();
    yBounds = planets[i].getYBounds();
    if(mouseX>xBounds[0] && mouseX<xBounds[1] && mouseY>yBounds[0] && mouseY<yBounds[1]){
       planets[i].stopMoving();
    }
    else{
       planets[i].startMoving();
    }
  }
}

void mouseClicked(){
  Planet[] planets = {sun, 
                      mercury, 
                      venus,
                      earth,
                      mars,
                      jupiter,
                      saturn,
                      uranus,
                      neptune};
                      
  for(int i=0; i<planets.length; i++){
    if(planets[i].getStopped()){
      System.out.println(planets[i].getName());
    }
  }
}


