
String info ="A long,\n long time ago\nin a galaxy far, far away...";
PFont f ;
float y = 0;
float x = 0;
PImage img;
float theta = 0.0;//sphere
float size = 400;//size of sphere
color c;
float rx, rxp, ry, ryp, z = 0;//UFO
int numOfShapes = 150;//amount of stars
Star myStar;
Star[] arrayStars = new Star[numOfShapes];// array of stars
Planets[] drawPlanets;
int[] planetColorRed = {
  123, 40, 200, 200, 204, 25, 95}; 
int[] planetColorGreen = {
  100, 31, 172, 200, 0, 0, 64};  
int[] planetColorBlue = {
  34, 216, 5, 200, 0, 0, 0};      
int[] planetSize = {
  15, 8, 12, 13, 18, 25}; //Planet size
int[] planetAxisX = {
  300, 300, 300, 300, 300, 300, 300};//Planets x-axis around center
int[] planetAxisY = {
  300, 300, 300, 300, 300, 300, 300};//Planets y-axis around center
int[] planetMoveX = {
  150, 100, 200, 250, 325, 600};     //Distance 
int[] planetMoveY = {
  0, 0, 0, 0, 0, 0, 0};              //Distance in y direction
int[] xRotate = {
  0, 0, 0, 0, 0, 0, 0}; //Rotation of planets on their own axis...used for later individual planet rotation
float[] planetSpeed = {
  2, 8, 3, 1, .32, .21};//Planet speed
float n;                //Rotation variable for planets
int counterX = 30;      //Rotation around x-axis variable
int counterY = 10;      //Rotation around y-axis variable
int counterZ = -7;      //Rotation around z-axis variable
int counterL = 0;       //Translation left and right
int counterU = 0;       //Translation up and down


void setup(){
  size(700, 600, P3D); 
  tint(255, 127);//opasity of the image
 // img=loadImage("spaceImg.jpg"); 
  sphereDetail(10);
  f = createFont("Arial", 20 * 4, true);
  for(int arrayPos = 0; arrayPos < numOfShapes; arrayPos++){

    // Initialize stars
    arrayStars[arrayPos] = new Star();
    arrayStars[arrayPos].x = random(width);
    arrayStars[arrayPos].y = random(height);  // give it a position 


    drawPlanets = new Planets[6];
    forLoopsSetup();

  }

  f = createFont("Arial", 18 * 4, true);
}

void draw(){
  background(0);
  //image(img, 0, 0); 

  for(int arrayPos=0; arrayPos<numOfShapes; arrayPos++){ //background  stars
    arrayStars[arrayPos].display();
  }

  theta += 0.01;

  fill(00, 0, 00, 130);//sphere fill
  drawSphere(100); 
  pushMatrix();
  galaxyMovement();//planets////////
  translate(0, 0, counterZ);
  rotateX(radians(counterX));
  rotateY(radians(counterY));
  translate(counterL, 0, 0);
  translate(0, counterU, 0);
  pointLightFunction();
  forLoopsDraw();///////////////////

  ////UFO 
  translate(width/2, height/1.5, z);// UF0 position on the stage
  float rxp = ((mouseX)* 0.005);
  float ryp = ((mouseY)* 0.005);
  rx = (rx * 0.95)-(rxp * 0.1);   //x rotation speed
  ry = (ry * 0.95)-(ryp * 0.01); // y rotation speed
  rotateY(rx++);
  rotateX(ry);
  
  if (mouseButton == RIGHT){
    z+= 300;//gets 3 times larger in size
  }
  else{
    z-= 100;//normal size
  }
  z = constrain(z, 10, 300);



  //UFO body dimentions and colors
  if (keyPressed){
    fill(227, 55, 46);
    noStroke();
    sphere(50);//red ball inside the UFO
  }
  for (int j = 0; j < 25; j++){ 
    rotateY(80);
    for (int i = 0; i < 460; i++){
      pushMatrix();
      stroke(252, 246, 78);
      point(random(5),random(5), 90);// lights arround UFO ellipse
      stroke(255,255, 99, 200);
      line(0, sin(i) * 52.5, cos(i) * 42,0, sin(i) * 52.5, cos(i) * 42);
      stroke(99, 255, 255, 100);
      line( sin(i) * 52.5,0, cos(i) * 87.5,0, sin(i) * 35, cos(i) * 59.5);
      stroke(255, 253, 237);
      point(random(20),random(500), 80);//UFO tail of light 
      popMatrix();
    }
  }
  popMatrix(); ////text begins
  fill(255, 255, 00, 180);
  pushMatrix();
  translate(width/2, height/2);
  rotateX (PI/3);
  textFont(f);
  textAlign(CENTER);
  text(info, x , y);
  y -= 10;
  popMatrix();////////////////

}

void drawSphere(int t) {
  pushMatrix();
  translate(100,100,0);
  rotateX(theta);
  rotateY(theta);
  stroke(random(0,150), random(0,255), random(0,255));
  sphere(260);
  popMatrix();
  endShape();

}






