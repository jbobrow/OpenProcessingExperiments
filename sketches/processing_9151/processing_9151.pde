
/* 

  Thomas Diewald
  25.04.2010
  
  experimenting with Gravity (just for fun)

*/

//import processing.opengl.*;
import peasy.*;


PeasyCam cam; 
PFont font;

int sizeX, sizeY ;
int gridSizeX, gridSizeY;

GravityField gF[] = new GravityField[3];
Planet pl[] = new Planet[6];
Grid grid;

boolean showGravityFieldLabel = true;

boolean RESET = false;


void setup(){
  if(! RESET){
    //size(800, 600, OPENGL);
    size(800, 600, P3D);
    
    sizeX = width; sizeY = height;
    gridSizeX = int((sizeX + sizeY)/2) ;
    gridSizeY = int((sizeX + sizeY)/2);

    //------------------------------------------------------------------------------------------
    // initialize camera ---> needed library: import peasy.*;
    cam = new PeasyCam(this, sizeX/2 , sizeY/2, 0, 600);  // default settings on double click
    cam.setMinimumDistance(.001);
    cam.setMaximumDistance(50000);
    cam.setRotations( -0.7301672, -0.274728, 0.30156484); 
  } // end if(! RESET)
  
  

  
  //------------------------------------------------------------------------------------------
  // initialize Grid
  int res = 7;
  int gridPointsX = gridSizeX / res;
  int gridPointsY = gridSizeY / res;
  grid = new Grid(gridPointsX, gridPointsY);
  float s = 1.5; // scale Grid
  for(int i = 0; i < gridPointsY; i++){
    for(int j = 0; j < gridPointsX; j++){
      int index = i*gridPointsX + j;
      float x = j * res * s + (sizeX - gridSizeX*s) / 2;
      float y = i * res * s + (sizeY - gridSizeY*s) / 2;
      float z = 0;
      grid.setGridPoint(index, x, y, z);
    } // end for j
  } // end for i
  
  
  
  int border = 0;
  //------------------------------------------------------------------------------------------ 
  // initialize gravityFields
  for(int i = 0; i < gF.length; i++){
    int id       = i;
    float x      = random(border, gridSizeX-border);
    float y      = random(border, gridSizeY-border);
    float radius = random(20, 40);
    color col = color( random(200,255), random(200,255),  random(1)); 
    gF[i] = new GravityField(id, x, y, radius, col);
  } // end for i
  
  //------------------------------------------------------------------------------------------
  // initialize Planets
  for(int i = 0; i < pl.length; i++){
    int id       = i;
    float x      = random(border, gridSizeX-border);
    float y      = random(border, gridSizeY-border);
    float dirX   = random(1,3); //dirX = 2;
    float dirY   = random(0,1); //dirY = 0;
    float radius = random(5,10);
    color col = color( random(110, 255), random(110, 255),  random(110, 220)); 
    pl[i] = new Planet(id, x, y, dirX, dirY, radius, col);    
  } // end for i
  

  
  
  //------------------------------------------------------------------------------------------
  // font
  font = loadFont("ArialMT-48.vlw"); 
  textFont(font); 
  
  frameRate(60);
} // end void setup
  
  
  
  
  
  


void draw(){
  println(frameRate);
  background(0); noLights();


  moveAndScaleSpheres(); // if mousePressed and key 'm' is pressed

  // calculate the planets new Information
  for(int i = 0; i < pl.length; i++){
    for(int j = 0; j < gF.length; j++)              pl[i].setNewDirection(gF[j].x, gF[j].y, gF[j].radius, 1500*gF.length, .4);
    for(int j = 0; j < pl.length; j++){ if( j != i) pl[i].setNewDirection(pl[j].x, pl[j].y, pl[j].radius, 2000,           .6); } 
    pl[i].setNewPosition();
  } // end for i
  

  // calculate the grid deformation
  grid.REsetGridPointPositionZ();
  for(int i = 0; i < gF.length; i++) grid.setGridPointPositionZ( gF[i].x, gF[i].y, gF[i].radius );  
  for(int i = 0; i < pl.length; i++) grid.setGridPointPositionZ( pl[i].x, pl[i].y, pl[i].radius );  


  grid.drawGrid();                                                                 // draw grid
  for(int i = 0; i < gF.length; i++) gF[i].drawSphere(20, 30);                     // draw GravityFields
  for(int i = 0; i < pl.length; i++) pl[i].drawSphere(10, 20);                     // draw Planets
  if (showGravityFieldLabel) for(int i = 0; i < gF.length; i++) gF[i].drawLabel(); // draw GravityFieldsLabel
} // end void draw




void keyReleased(){
  if(key == 't'){
    if(showGravityFieldLabel) showGravityFieldLabel = false; else showGravityFieldLabel = true;
  }  
  if(key == 'r') {
    RESET = true;
    setup();
  }
} // end void keyReleased()








boolean mouseStillPressed = false;
int indexGF = 0; // index of gravityField
int indexGP = 0; // index of gridpoint

void moveAndScaleSpheres(){
  
  for(int i = 0; i < gF.length; i++) gF[i].setSelectionState(false);

  if (keyPressed ){
    cam.setMouseControlled(false); 
    if(key == 'm' || key == 'M'){
      float scrX, scrY, mouseDisShortest;
      if(!mouseStillPressed){
        // find nearest gravityField
        scrX = screenX( gF[indexGF].x, gF[indexGF].y, 0 );
        scrY = screenY( gF[indexGF].x, gF[indexGF].y, 0 );
        mouseDisShortest = sqrt( sq(mouseX - scrX) + sq(mouseY - scrY) );
  
        for(int i = 0; i < gF.length; i++){
          scrX = screenX( gF[i].x, gF[i].y, 0 );
          scrY = screenY( gF[i].x, gF[i].y, 0 );
          float mouseDis = sqrt( sq(mouseX - scrX) + sq(mouseY - scrY) );
          if( mouseDis <= mouseDisShortest){
            indexGF = i; mouseDisShortest = mouseDis;
          }
        } // end for i
        //scrX = screenX( gF[indexGF].x, gF[indexGF].y, 0 );
        //scrY = screenY( gF[indexGF].x, gF[indexGF].y, 0 );
        //cam.beginHUD(); stroke(0,255,255); strokeWeight(10); point(scrX, scrY); cam.endHUD();
      } // end if(!mouseStillPressed){
        
      gF[indexGF].setSelectionState(true); 
      
      // find nearest gridpoint
      scrX = screenX( grid.px[indexGP], grid.py[indexGP], 0 );
      scrY = screenY( grid.px[indexGP], grid.py[indexGP], 0  );
      mouseDisShortest = sqrt( sq(mouseX - scrX) + sq(mouseY - scrY) );
      for(int i = 0; i < grid.px.length; i++){
        scrX = screenX( grid.px[i], grid.py[i], 0 );
        scrY = screenY( grid.px[i], grid.py[i], 0  );
        float mouseDis = sqrt( sq(mouseX - scrX) + sq(mouseY - scrY) );
        if( mouseDis <= mouseDisShortest){
          indexGP = i; mouseDisShortest = mouseDis;
        }
      } // end for i
      //scrX = screenX( grid.px[indexGP], grid.py[indexGP], 0 );
      //scrY = screenY( grid.px[indexGP], grid.py[indexGP], 0 );
      //cam.beginHUD(); stroke(0,255,255); strokeWeight(20); point(scrX, scrY);cam.endHUD();
        
      if (mousePressed){
        mouseStillPressed = true;
        if (mouseButton == LEFT){
          float dx = grid.px[indexGP] - gF[indexGF].x;
          float dy = grid.py[indexGP] - gF[indexGF].y;
          gF[indexGF].x += dx/6;
          gF[indexGF].y += dy/6;
        } // end if
        if (mouseButton == RIGHT) {
          gF[indexGF].radius += 1.0*(pmouseY - mouseY)/10.0;
          if( gF[indexGF].radius < 10) gF[indexGF].radius  = 10;
          if( gF[indexGF].radius > 100) gF[indexGF].radius  = 100;
        } // end if
      } else {
        mouseStillPressed = false;
      } // end if else
    
    } // end if (key == 'm' || key == 'M'){
  } else {
    cam.setMouseControlled(true); 
  } // end if else
} // end void moveAndScaleSpheres()



