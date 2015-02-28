
PShape brooklyn;
PShape shield;
PShape statue;
PShape mount;
PShape skyline;
PShape moon;
PShape tetons;
PImage sky1;
PImage sky2;
PFont font;

void setup(){
  size(640, 480);
  frameRate(0.5);
  smooth();
  brooklyn = loadShape("Brooklyn_Bridge.svg");
  shield = loadShape("Captain_America_Shield.svg");
  statue = loadShape("statue of liberty.svg");
  mount = loadShape("Mount_Rushmore.svg");
  skyline = loadShape("Sky_Line.svg");
  moon = loadShape("moon.svg");
  tetons = loadShape("Grand_Tetons.svg");
  sky1 = loadImage("awesome_sky.jpg");
  sky2 = loadImage("blue2.jpg");
  font = loadFont("CopperplateGothic-Light-48.vlw");
  textFont(font, 32);
}

void draw(){
  
  float style = random(0,2);
  float circle = random(0,2);
  
  if (style<=1){
    background(255);
    brooklyn.disableStyle();
    shield.disableStyle();
    statue.disableStyle();
    mount.disableStyle();
    skyline.disableStyle();
    moon.disableStyle();
    tetons.disableStyle();
    noFill();
    
     if(circle <= 1){
      pushMatrix();
      shapeMode(CENTER);
      translate(random(500), random(200));
      scale(random(.25,1));
      shape(moon);
      popMatrix();
    
    }
    if (circle>1){
      pushMatrix();
      shapeMode(CENTER);
      translate(random(500), random(200));
      scale(random(.25,1.5));
      rotate(random(0, TWO_PI));
      shape(shield);
      popMatrix();
    }

  }
  
  if(style>1){
    brooklyn.enableStyle();
    shield.enableStyle();
    statue.enableStyle();
    mount.enableStyle();
    skyline.enableStyle();
    moon.enableStyle();
    tetons.enableStyle();
    
  
    if(circle <= 1){
      image(sky2, 0, 0);
      pushMatrix();
      shapeMode(CENTER);
      translate(random(500), random(200));
      scale(random(.25,1));
      shape(moon);
      popMatrix();
    
    }
    if (circle>1){
      image(sky1, 0, 0);
      pushMatrix();
      shapeMode(CENTER);
      translate(random(500), random(200));
      scale(random(.25,1.5));
      rotate(random(0, TWO_PI));
      shape(shield);
      popMatrix();
    }
  }
  

  
  float mountain = random(0,2);
  
  if(mountain <=1){
    pushMatrix();
    shapeMode(CORNER);
    shape(tetons);
    popMatrix();
  }
  else{
    pushMatrix();
    shapeMode(CORNER);
    shape(mount);
    popMatrix();
  }

shapeMode(CORNER);

  float scaler = random(.25,1);
  pushMatrix();
  translate(640, 480-50*scaler);
  scale(random(.75,2));
  shape(skyline, -skyline.width, -skyline.height);
  popMatrix();
  
  

  pushMatrix();
  translate(640,480);
  scale(scaler);
  shape(brooklyn, -brooklyn.width, -brooklyn.height);
  popMatrix();

  pushMatrix();
  float scaler1 = random(.5, 1.5);
  translate(random(400, 640), 490);
  scale(scaler1);
  shape(statue, -statue.width, -statue.height);
  popMatrix();  
  
  float tinterRand = random(0, 2);
  float tinter = 0;
  

  if (tinterRand<=1){
    tinter = random(1,200);
  }

  
  fill(random(0,255), random(0,255), random(0,255), tinter);
  rect(0, 0, width, height);
  println(tinter);
}

