
float x = 0;
float y = 0;
float p = 500;

//Color-Randomizing//
float r = 255; //Red
float g = 255; //Green
float b = 255; //Blue
float cloud_r = 255; //Red
float cloud_g = 255; //Green
float cloud_b = 255; //Blue

//Evening Such//
float night = 0;
float nightback = 0;
float rise = 0;

//Upward Smog/clouds from Factory//
float upward = 245;
float upward2 = 253;
float upward3 = 270;
float upward4 = 238;
float upward5 = 266;
float upward6 = 257;
float upward7 = 252;
float upward8 = 245;

/*--Linking SVG Illustrator Files-----------*/
PShape factory_main_L1; PShape factory_main_L2;
PShape factory_insideSkin;
PShape factory_coneHead; PShape factory_coneStem;

PShape City_L1; PShape City_L2; PShape City_L3; PShape City_L4;

PShape Cloud_L1a; PShape Cloud_L1b; PShape Cloud_L1c; PShape Cloud_L1d;
PShape Cloud_L2a; PShape Cloud_L2b; PShape Cloud_L2c; PShape Cloud_L2d;

PShape Haze_1; PShape Haze_2;

PShape Pollute;

PShape Gear1; PShape Gear2; PShape Gear3; PShape Gear4;

PShape Rocket;


/*--Declared Variables---------------------*/
/*Night Overlay:*/

/*Clouds: Back Layer*/
int C2a = 0; float C2aDrag = 0;
int C2b = 0; float C2bDrag = 0;
int C2c = 0; float C2cDrag = 0;
int C2d = 0; float C2dDrag = 0;
/*Clouds: Front Layer*/
int C1a = 0; float C1aDrag = 0;
int C1b = 0; float C1bDrag = 0;
int C1c = 0; float C1cDrag = 0;
int C1d = 0; float C1dDrag = 0;
/*Haze: 1 & 2*/
int Haze1 = 0; float Haze1Drag = 0;
int Haze2 = 0; float Haze2Drag = 0; float Haze2DragBack = 0;
float h1x = 520; float h1y = 300;
float speed = 0; float gravity = 0.01;
float h2x = 0; float h2y = 0;
float speed2 = 0; float gravity2 = -0.01;
/*Gears*/
float Gear_1 = 0; float Gear_2 = 0; float Gear_3 = 0; float Gear_4 = 0;
float Gear_rotation = 0;
float xLocation = 0;
float yLocation = 0;
/*Rocket*/
float Rocket_1 = 0;

/*---Single Declarations----------------------------*/void setup() {
   background(0,0,0); size(1080,613); smooth();
  
/*--Initializing SVGs for loading----------*/
  factory_main_L1 = loadShape("factory_main_L1.svg"); 
  factory_main_L2 = loadShape("factory_main_L2.svg");
  factory_insideSkin = loadShape("factory_insideSkin.svg");
  factory_coneHead = loadShape("factory_coneHead.svg"); 
  factory_coneStem = loadShape("factory_coneStem.svg");
  
  City_L1 = loadShape("City_L1.svg"); City_L2 = loadShape("City_L2.svg");
  City_L3 = loadShape("City_L3.svg"); City_L4 = loadShape("City_L4.svg");
  
  Cloud_L1a = loadShape("Cloud_L1A.svg"); Cloud_L1b = loadShape("Cloud_L1B.svg");
  Cloud_L1c = loadShape("Cloud_L1C.svg"); Cloud_L1d = loadShape("Cloud_L1D.svg");
  
  Cloud_L2a = loadShape("Cloud_L2A.svg"); Cloud_L2b = loadShape("Cloud_L2B.svg");
  Cloud_L2c = loadShape("Cloud_L2C.svg"); Cloud_L2d = loadShape("Cloud_L2D.svg");
  
  Haze_1 = loadShape("Haze_1.svg"); Haze_2 = loadShape("Haze_2.svg");
  
  Pollute = loadShape("Pollute_Button.svg");
  
  Gear1 = loadShape ("gear1.svg");
  Gear2 = loadShape ("gear2.svg");
  Gear3 = loadShape ("gear3.svg");
  Gear4 = loadShape ("gear4.svg");
  
  Rocket = loadShape ("Rocket.svg");
}//Closing 'void setup'//


/*---Looping Declarations------------------------*/void draw() { 
  background(229,234,231, night);smooth();  
    float m = map(night,0,width,0,300);
    fill(0,0,0,m);
    rect(0,0,width,height);
    
    //spontaineous rain
    /*if (mouseX > 900 && mouseY < 100) {
      for (int i=0; i>900; i++) {
    fill(37, 141, 244, m-20);
    ellipse(random(width), random(250), 3.5, 3.5);
    fill(37, 141, 244, m-40);
    ellipse(random(width), random(height), 3, 3); 
      }
    }*/
  
  shape(Rocket,1005,m);
  m = m-20;
  
  
  shape(City_L4,837,234);
  
  shape(factory_insideSkin, 0, 160);
  
  
  //Clouds: Back Layer//
  for(int C2b = 120; C2b < width; C2b = C2b + width) {
    shape(Cloud_L2b, C2b + C2bDrag, -3, 390.83, 119.5); }
  for(int C2b = -960; C2b < width; C2b = C2b + width) {
    shape(Cloud_L2b, C2b + C2bDrag, -3, 390.83, 119.5); }
  if(C2bDrag > width){C2bDrag = 0;}
    C2bDrag = C2bDrag + 0.2;
   
  for(int C2c = 527; C2c < width; C2c = C2c + width) {
    shape(Cloud_L2c, C2c + C2cDrag, 0, 515.63, 116.06); }
  for(int C2c = -553; C2c < width; C2c = C2c + width) {
    shape(Cloud_L2c, C2c + C2cDrag, 0, 515.63, 116.06); }
  if(C2cDrag > width){C2cDrag = 0;}
    C2cDrag = C2cDrag + 0.2;
    
  for(int C2d = 900; C2d < width; C2d = C2d + width) {
    shape(Cloud_L2d, C2d + C2dDrag, 40, 138.44, 56.94); }
  for(int C2d = -180; C2d < width; C2d = C2d + width) {
    shape(Cloud_L2d, C2d + C2dDrag, 40, 138.44, 56.94); }
  if(C2dDrag > width){C2dDrag = 0;}
    C2dDrag = C2dDrag + 0.2;
  //Closing 'Clouds: Back Layer'//
  
  shape(City_L3,540,244);
  shape(City_L2,577,405);
  
  shape(factory_main_L2,129,190);
  
  //Haze #1
    shape(Haze_1, h2x, 50); //Over Factory
    h2x = h2x - speed2;
    speed2 = speed2 - gravity2;
    if(h2x<-100) {speed2 = speed2 + 0.99;}
    
    /*shape(Haze_2, h1x, h1y, 481.88, 84.63);
      h1x = h1x + speed;
      speed = speed + gravity;
      if(h1x > 800) {speed = speed * -0.99;}
      if (h1x < speed) {speed = 0;}*/
  
  
  //Factory Smoke-reel - flow of color-changing smoke//
  fill (cloud_r,cloud_g,cloud_b); 
 ellipse (343,upward,50,50);
 ellipse (378,upward2,35,35);
 ellipse (370,upward3,20,20);
 ellipse (367,upward4,30,30);
 ellipse (350,upward5,40,40);
 ellipse (328,upward6,50,50);
 ellipse (308,upward7,25,25);
 ellipse (325,upward8,40,40);
 upward = upward - 2.5;
 upward2 = upward2 - 2.5;
 upward3 = upward3 - 2.5;
 upward4 = upward4 - 2.5;
 upward5 = upward5 - 2.5;
 upward6 = upward6 - 2.5;
 upward7 = upward7 - 2.5;
 upward8 = upward8 - 2.5;
 if (upward < -50) {
   upward = 245;
   upward2 = 253;
   upward3 = 270;
   upward4 = 238;
   upward5 = 266;
   upward6 = 257;
   upward7 = 252;
   upward8 = 245;
   cloud_r = random(255);
   cloud_g = random(255);
   cloud_b = random(255);
 }
 
 //Factory Gears / Insides//
 shape(Gear1,-30,260);
 shape(Gear2, -20, 495);
 shape(Gear4,142,450);
  
  shape(factory_main_L1, 0, 144,407.17,469);
  
  //Factory Smoke-Button HERE - Clickable & Alerts Red vs. Green//
  noStroke(); fill(114,56,56); ellipse(320.5,284,41.5,41.5); // Divide By 2= 20.75
    if(mouseX>299.75 && mouseX<341.25 && mouseY>263.25 && mouseY<304.75){
      fill(204,31,31); ellipse(320.5,284,41.5,41.5);}
      
  shape(Pollute,301,272);
      
    
  //Clouds: Front Layer//
  for(int C1b = 250; C1b < width; C1b = C1b + width) {
    shape(Cloud_L1b, C1b + C1bDrag, 0, 341.94, 95); }
  for(int C1b = -830; C1b < width; C1b = C1b + width) {
    shape(Cloud_L1b, C1b + C1bDrag, 0, 341.94, 95); }
  if(C1bDrag > width){C1bDrag = 0;}
    C1bDrag = C1bDrag + 0.3;
    
  for(int C1c = 535; C1c < width; C1c = C1c + width){
    shape(Cloud_L1c, C1c + C1cDrag, 40, 350, 115.33);}
  for(int C1c = -545; C1c < width; C1c = C1c + width){
    shape(Cloud_L1c, C1c + C1cDrag, 40, 350, 115.33);}
  if(C1cDrag > width){C1cDrag = 0;}
  C1cDrag = C1cDrag + 0.5;
    
  for(int C1a = -20; C1a < width; C1a = C1a + width) {
    shape(Cloud_L1a, C1a + C1aDrag, 0, 244.75, 71.5); }
  for(int C1a = -1100; C1a < width; C1a = C1a + width) {
    shape(Cloud_L1a, C1a + C1aDrag, 0, 244.75, 71.5); }
  if(C1aDrag > width){C1aDrag = 0;}
    C1aDrag = C1aDrag + 0.27;
    
  for(int C1d = 860; C1d < width; C1d = C1d + width){
    shape(Cloud_L1d, C1d + C1dDrag, 0, 350, 115.33);}
  for(int C1d = -220; C1d < width; C1d = C1d + width){
    shape(Cloud_L1d, C1d + C1dDrag, 0, 350, 115.33);}
  if(C1dDrag > width){C1dDrag = 0;}
  C1dDrag = C1dDrag + 0.3;
  
  for(int C2a = -20; C2a < width; C2a = C2a + width) {
    shape(Cloud_L2a, C2a + C2aDrag, 20, 173.5, 93); }
  for(int C2a = -1100; C2a < width; C2a = C2a + width) {
    shape(Cloud_L2a, C2a + C2aDrag, 20, 173.5, 93); }
  if(C2aDrag > width){C2aDrag = 0;}
    C2aDrag = C2aDrag + 0.2;
  //Closing 'Clouds: Front Layer'//
  
  shape(City_L1,677,351);
  
  //All Changeable City Windows Located HERE - Dimension Note:1080x630//
  noStroke();
  /*City Layer 4 - Back Layer*/
        //Party Windows//
      fill(45,36,6); rect(920,240,12,20); //Pink
      fill(45,36,6); rect(905, 260, 12, 20); //Blue
      fill(45,36,6); rect(920, 283, 12, 20); //Green
      fill(45,36,6); rect(905, 283, 12, 20); //purple
      fill(45,36,6); rect(870, 283, 12, 20); //orange
      fill(45,36,6); rect(885, 315, 12, 20); //yellow
        if(mouseX>868 && mouseX<935 && mouseY>220 && mouseY<330){
          fill(r,g-100,b-100); rect(920,240,12,20); //Pink
          fill(r-100,g-100,b); rect(905, 260, 12, 20); //Blue
          fill(r-100,g,b-100); rect(920, 283, 12, 20); //Green
          fill(r,g-100,b); rect(905, 283, 12, 20); //purple
          fill(r,g,b-100); rect(870, 283, 12, 20); //orange
          fill(r-100,g,b); rect(885, 315, 12, 20); //yellow
            r = random(255);
            g = random(255);
            b = random(255);
        }//Closing 'If' statement//
            
            if(night>650) {
              fill(r,g-100,b-100); rect(920,240,12,20); //Pink
          fill(r-100,g-100,b); rect(905, 260, 12, 20); //Blue
          fill(r-100,g,b-100); rect(920, 283, 12, 20); //Green
          fill(r,g-100,b); rect(905, 283, 12, 20); //purple
          fill(r,g,b-100); rect(870, 283, 12, 20); //orange
          fill(r-100,g,b); rect(885, 315, 12, 20); //yellow
            r = random(255);
            g = random(255);
            b = random(255);
        }//Closing 'If' statement//
  
  /*City Layer 3*/
  fill(67,54,8); rect(689,326,12,20);
  
  fill(71,57,9); rect(703,285,12,20); //Window 1A
    if(mouseX>703 && mouseX<716 && mouseY>285 && mouseY<308){
       fill(220,179,16); rect(703,285,12,20);}
       
  fill(57,47,12); rect(703,385,12,20);
  fill(57,47,12); rect(790,322,12,20);
  fill(57,47,12); rect(1005,295,12,20);
  fill(57,47,12); rect(1027,320,12,20);
  fill(57,47,12); rect(1069,251,12,20);
  
  /*City Layer 2*/
  fill(220,179,16); rect(585,414,14,22);
    if(mouseX>585 && mouseX<599 && mouseY>414 && mouseY<436){
      fill(100,85,23); rect(585,414,14,22);}
  
      
  /*City Layer 1 - Front Layer*/
  fill(220,179,16); rect(798,450,14,22);
    if (mouseX>798 && mouseX<812 && mouseY>450 && mouseY<472){
      fill(100,85,23); rect(798,450,14,22);}
      
  fill(220,179,16); rect(798,480,14,22);
    if (mouseX>798 && mouseX<812 && mouseY>480 && mouseY<502){
      fill(100,85,23); rect(798,480,14,22);}
      
        //fill(0,0,0); rect(880,0,1,613); rect(894,0,1,613); rect(0,365, 1080,1); rect(0,387,1080,1);
      
  fill(190,152,20); rect(880,365, 14,22);
    if(mouseX>880 && mouseX<894 && mouseY>365 && mouseY<389){
      fill(100,85,23); rect(880,365,14,22);}
      
  /*for(float x = 357; x < 540; x = x+20) {
    fill (100,85,23);
    rect (1000,x,14,22);
  }*/
  

  
  //Haze: 2//
  
      //float h1x = 520; float h1y = 300;
      //float speed = 0; float gravity = 0.1;
      
      shape(Haze_2, h1x, h1y, 481.88, 84.63);
      h1x = h1x + speed;
      speed = speed + gravity;
      if(h1x > 800) {speed = speed * -0.99;}
      if (h1x < speed) {speed = 0;}
    
    /*for(int Haze2 = 520; Haze2 < width; Haze2 = Haze2 + width) {
      shape(Haze_2, Haze2 + Haze2Drag, 300, 481.88, 84.63); }
      
    if(Haze2 >= width-70){ Haze2Drag = Haze2DragBack;
      if(Haze2DragBack < 1){Haze2DragBack = Haze2Drag;}*/

    
    /*Haze2Drag = Haze2Drag + 0.9;
    Haze2DragBack = Haze2Drag - 1;*/
  

  
  /*Day to Night Manipulation*/
    /*noStroke(); fill(0,0,0); ellipse(night,100,10,10);
    night = night + 3;
    if(night>=540) {night = rise;}
    rise = rise - 3;
    if(night>800) {}*/
    
    noStroke(); noFill(); ellipse(night,100,0,0);
    night = night + 0.8;
    if(night>=width) {night = 0;}
    if(night>800) {}
    
    /*Not Working: Oh well.
    night = night + 5;
    if(night>=width) {night = nightback;}
    nightback = nightback-1;
    if(nightback < 0) {nightback = night;}
    */
  
}//closing 'void-draw'//

/*---Mouse Pressed----------------------------*/void mousePressed(){
      if(mouseX>(299.75) && mouseX<(341.25) && mouseY>(263.25) && mouseY<(304.75)){
      fill(164,86,86); ellipse(320.5,284,41.5,41.5);
      cloud_r = 92;
      cloud_g = 89;
      cloud_b = 75;
      fill(250,0,0); ellipse(371.5,268,15,15);
    }
}//closing 'void-mousePressed'//

