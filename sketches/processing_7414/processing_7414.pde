
PShape brooklyn;
PShape shield;
PShape statue;
PShape mount;
PShape skyline;
PShape moon;
PShape tetons;
PShape gate;
PShape twin;
PImage sky1;
PImage sky2;
PFont font;

void setup(){
  size(640, 480);
  noLoop();
  smooth();
  brooklyn = loadShape("Brooklyn_Bridge.svg");
  shield = loadShape("Captain_America_Shield.svg");
  statue = loadShape("statue of liberty.svg");
  mount = loadShape("Mount_Rushmore.svg");
  skyline = loadShape("Sky_Line.svg");
  moon = loadShape("moon.svg");
  tetons = loadShape("Grand_Tetons.svg");
  gate = loadShape("golden_gate.svg");
  twin = loadShape("world_trade_center.svg");
  sky1 = loadImage("awesome_sky.jpg");
  sky2 = loadImage("blue2.jpg");
  font = loadFont("CopperplateGothic-Light-48.vlw");
  textFont(font, 48);
}

void draw(){
  
  float style = random(0,2);
  float circle = random(0,2);
  
  if (style<=1){
    background(255);
    noFill();
    brooklyn.disableStyle();
    shield.disableStyle();
    statue.disableStyle();
    mount.disableStyle();
    skyline.disableStyle();
    moon.disableStyle();
    tetons.disableStyle();
    gate.disableStyle();
    twin.disableStyle();
    
    float angle = random(-PI/2, PI/2);
    
    pushMatrix();
    fill(0);
    translate(random(0,500), random(0,400));
    rotate(angle);
    text("America", 0, 0);
    popMatrix();
    pushMatrix();
    fill(0);
    translate(random(0,500), random(50,400));
    rotate(angle);
    text("Unity", 0,0);
    popMatrix();
    pushMatrix();
    translate(random(0,500), random(50,400));
    rotate(angle);
    text("Independence",0,0);
    popMatrix();
    pushMatrix();
    translate(random(0,500), random(50,400));
    rotate(angle);
    text("Freedom",0,0);
    popMatrix();
    pushMatrix();
    translate(random(0,500), random(50,400));
    rotate(angle);
    text("Representation",0,0);
    popMatrix();
    pushMatrix();
    translate(random(0,500), random(50,400));
    rotate(angle);
    text("Equality",0,0);
    popMatrix();
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
    gate.enableStyle();
    twin.enableStyle();
    
  
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


  
  float bridge = random(0,2);
  float scaler = random(.25,1);
      
  if(bridge <=1){
    shapeMode(CORNER);


    
    pushMatrix();
    translate(random(100, 500), 480-50*scaler);
    scale(random(.75, 1.2));
    shape(twin, -twin.width, -twin.height);
    popMatrix();
    
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
  }
  
  if(bridge >1){
    shapeMode(CORNER);
    
    pushMatrix();
    translate(random(100, 500), 480-90*scaler);
    scale(random(.75, 1.2));
    shape(twin, -twin.width, -twin.height);
    popMatrix();

    pushMatrix();
    translate(640, 480-90*scaler);
    scale(random(.75,2));
    shape(skyline, -skyline.width, -skyline.height);
    popMatrix();
    
    pushMatrix();
    translate(640,480);
    scale(scaler);
    shape(gate, -gate.width, -gate.height);
    popMatrix();
  }

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
}

