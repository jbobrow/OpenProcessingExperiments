
import fullscreen.*;
import japplemenubar.*;

FullScreen fs;
PFont f;
PImage tree;

String lastInput = new String();
String currentInput = new String();

// The WeatherGrabber object does the work for us!
WeatherGrabber wg;

//scenery changes
int w = 10;//sun glow
int s = 1; //sun glow increase

color c = color(40,90,140,200);
color snowC = color(250,250,250,250);
color mixedSnow = color(250,250,250,210);

Fair fairWeather = new Fair();

Cloud cloudy = new Cloud(400);
Cloud cloudy2 = new Cloud(200);
Cloud[] cloudArray = new Cloud[4];
Cloud[] cloudArrayBig = new Cloud [5];

Drop[] raindrops = new Drop[120];
Drop[] snowing = new Drop[60];
Drop lightning = new Drop();

int lightningTimer = 0;

Tornado tornado = new Tornado();


boolean fairButton;
boolean rainButton;
boolean cloudButton;
boolean snowButton;
boolean mixedButton;
boolean tornadoButton;
boolean unavailButton;

/////////////////////////////


void setup() {
  size(800,500);
  smooth();
  fs = new FullScreen(this);
  // Make a WeatherGrabber object
  wg = new WeatherGrabber("85225");
  // Tell it to request the weather
  wg.requestWeather();
  
  f = createFont( "Georgia" ,16,true);
  tree = loadImage("vector tree.png");
  int cloudX = 0;
  for (int i =0; i < cloudArray.length; i++) {
    cloudArray[i] = new Cloud(cloudX);
    cloudArrayBig[i] = new Cloud(cloudX-150);
    cloudX = cloudX + 278;
  }
  
  for (int i =0; i < raindrops.length; i++) {
    raindrops[i] = new Drop();
  }
  for (int i =0; i < snowing.length; i++) {
    snowing[i] = new Drop();
  }
}

void draw() {
  
  //basic scenery
  background(130,210,250); //sky
  noStroke();
  fill(50,150,20);
  ellipse(width,height,900,400);//right hill
  fill(50,163,20);
  ellipse(width/4,height,800,400); //left hill
  fill(50,175,20);
  ellipse(width*2/3,height+100,900,450);//center hill
  fill(250,250,100);
  ellipse(width/4,0,100,100);//sun
  image(tree,width/2+50,height/3); //tree
  
  textFont(f);
  fill(0);
  
  // Get the values to display
  String weather = wg.getWeather();
  int temp = wg.getTemp();
  int code = wg.getCode();
  
  //if Fair Weather
  if (code == 25 || code == 31 || code == 32 || code == 33 || code == 34 || code == 36 || fairButton){
    fairWeather.display();
    
  }
  if (mouseX>460 && mouseX <480 && mouseY>460 &&mouseY<480 && mousePressed){
    fairButton = !fairButton;
    rainButton = false;
    cloudButton= false;
    snowButton= false;
    mixedButton= false;
    tornadoButton= false;
    unavailButton= false;
  }
  
  //if Cloudy/windy
  if (code == 19 || code == 20 || code == 21 || code == 22 || code == 23 || code == 24 || code == 26 || code == 27 || code == 28 || code == 29 || code == 30 || code == 44 || cloudButton){
  cloudy2.display(250,1);
  cloudy.windyTree();
  for (int i =0; i < cloudArray.length; i++) {
    cloudArray[i].display(250,1);
    cloudArrayBig[i].display(250,1.3);
  }
    cloudy.darken(color(0,0,0,20));
  }
  if(mouseX>490 && mouseX <510 && mouseY>460 &&mouseY<480 && mousePressed){
    cloudButton = !cloudButton;
    fairButton = false;
    rainButton= false;
    snowButton= false;
    mixedButton= false;
    tornadoButton= false;
    unavailButton= false;
  }
  
  //if Rainstorm
  if (code == 3 || code == 4 || code == 9 || code == 11 || code == 12 || code == 17 || code == 37 || code == 38 || code == 39 || code == 40 || code == 45 || code == 47 || rainButton) {
  cloudy.windyTree();
  cloudy2.display(100,1);
  for (int i =0; i < cloudArray.length; i++) {
    cloudArray[i].display(120,1);
    cloudArrayBig[i].display(100,1.3);
  }
  for (int i =0; i < raindrops.length; i++) {
    raindrops[i].display(c);
    raindrops[i].move();
  }
  cloudy.darken(color(0,0,0,50));
  lightningTimer++;
  if (lightningTimer >300){
    lightningTimer =0;
  }
  if(lightningTimer>290){
    lightning.lightning();
    cloudy.darken(color(250,250,150,50));
  }
  }
  if (mouseX>520 && mouseX < 540 && mouseY>460 &&mouseY<480 && mousePressed) {
    rainButton = !rainButton;
    fairButton = false;
    cloudButton= false;
    snowButton= false;
    mixedButton= false;
    tornadoButton= false;
    unavailButton= false;
  }
  
  //if Snow
  if (code == 13 || code == 14 || code == 15 || code == 16 || code == 18 || code == 41 || code == 42 || code == 43 || code == 46 || snowButton) {
  cloudy2.display(130,1);
  for (int i =0; i < cloudArray.length; i++) {
    cloudArray[i].display(180,1);
    cloudArrayBig[i].display(150,1.3);
  }
  for (int i =0; i < raindrops.length; i++) {
    raindrops[i].display(snowC);
    raindrops[i].moveSnow();
  }
  cloudy.darken(color(0,0,0,40));
  }
  if (mouseX>550 && mouseX < 570 && mouseY>460 &&mouseY<480 && mousePressed){
    snowButton = !snowButton;
    fairButton = false;
    cloudButton= false;
    rainButton= false;
    mixedButton= false;
    tornadoButton= false;
    unavailButton= false;
  }
  
  //if Mixed Snow And Rain
  if (code == 5 || code == 6 || code == 7 || code == 8 || code == 10 || mixedButton) {
   cloudy2.display(130,1);
   for (int i =0; i < cloudArray.length; i++) {
    cloudArray[i].display(120,1);
    cloudArrayBig[i].display(100,1.3);
  }
   for (int i =0; i < raindrops.length; i++) {
    raindrops[i].moveSnow();
    raindrops[i].display(c);
  }
  
  for (int i =0; i < snowing.length; i++) {
    raindrops[i].moveSnow();
    raindrops[i].display(mixedSnow);
  }
  cloudy.darken(color(0,0,0,40));
  }
  if (mouseX>580 && mouseX < 600 && mouseY>460 &&mouseY<480 && mousePressed){
    mixedButton=!mixedButton;
    fairButton = false;
    cloudButton= false;
    rainButton= false;
    snowButton= false;
    tornadoButton= false;
    unavailButton= false;
  }
    
  
  //if Tornado
  if (code == 1 || code == 2 || tornadoButton) {
  tornado.display();
  tornado.move();
  cloudy2.display(130,1);
   for (int i =0; i < cloudArray.length; i++) {
    cloudArray[i].display(120,1);
    cloudArrayBig[i].display(100,1.5);
  }
  tornado.windyTree();
  cloudy.darken(color(0,0,0,40));
  }
  if (mouseX>610 && mouseX < 630 && mouseY>460 &&mouseY<480 && mousePressed){
    tornadoButton =!tornadoButton;
    fairButton = false;
    cloudButton= false;
    rainButton= false;
    snowButton= false;
    mixedButton= false;
    unavailButton= false;
  }
    
  
  //if Unavailable
  if(code == 3200 || unavailButton){
    background(130); //sky
  noStroke();
  fill(180);
  ellipse(width,height,900,400);//right hill
  fill(200);
  ellipse(width/4,height,800,400); //left hill
  fill(220);
  ellipse(width*2/3,height+100,900,450);//center hill
  fill(240);
  ellipse(width/4,0,100,100);//sun
  }
  if (mouseX>640 && mouseX < 660 && mouseY>460 &&mouseY<480 && mousePressed){
    unavailButton = !unavailButton;
    fairButton = false;
    cloudButton= false;
    rainButton= false;
    snowButton= false;
    mixedButton= false;
    tornadoButton= false;
  }
    
  
  //display box
   fill(255,255,255,80);
  noStroke();
  rect(5,380,230,70);
  
   // Draw a little thermometer based on the temperature
  noStroke();
  fill(250,40,50,190);
  rect(9,425,temp*2,20);
    wg.requestWeather(); 
  
  // Display all the stuff we want to display
  fill(0,0,0,180);
  text(lastInput,10,400);
  text(weather,10,420);
  text(temp + "° F",11,440); 
  fill(0,0,0,150);
  text("Type zip code and press enter: " ,10,480);
  stroke(0,0,0,100);
  line(width/2-172,480,width/2-117,480);
  

  //current typing text display
  fill(250,250,250,180);  
  text(currentInput, width/2-170, 480);
  fill(0);
  
  //squares
  noStroke();
  fill(0,0,0,50);
  rect(460,460,20,20);//fair
  rect(490,460,20,20);//
  rect(520,460,20,20);
  rect(550,460,20,20);
  rect(580,460,20,20);
  rect(610,460,20,20);
  rect(640,460,20,20);
  
  if (keyPressed){
    if (key == CODED){
      if(keyCode == UP){
        fs.enter();
      } else if (keyCode == DOWN){
        fs.leave();
      }
    }
  }
}
//currentInput 
void keyPressed() {
  if(key == ENTER) {
    lastInput = currentInput = currentInput + key;
    currentInput = "";
    wg.requestWeather();
  } else if(key == BACKSPACE && currentInput.length() > 0) {
    currentInput = currentInput.substring(0, currentInput.length() - 1);
  } else if(key == CODED) {
    currentInput = currentInput;
  } else {
    currentInput = currentInput + key;
  }
}



