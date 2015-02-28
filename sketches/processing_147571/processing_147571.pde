
/* @pjs crips=true; font="SF_Slapstick_Comic-webfont.ttf"; */

/* I tried to fiddle around with the sound, but one day it was working, and then
it stopped. I left it in here for now, without the boolean for multiple browsers
so I can go back to it in the future*/

//sound
Maxim maxim;
AudioPlayer player;
Boolean played=false;
//end sound

int numSprites=8; //int for number of critters (use to start at highest amount) 
Squasher squasher; //squaher class
Sprite[] sprites= new Sprite[numSprites]; //object name[] name of array
PImage img; // declaring the image ( this is the picnic blanket)
PImage swatter;
PImage blueCritter;
PImage purpleCritter;
PImage orange;
PImage cookie;
PImage bronze;
PImage silver;
PImage gold;
PImage crown;
PImage start;
PImage restart;
PFont f; // declare font
int score=0; //variable to start the score at 0
int time=0; //variable to start time at 0

void setup(){
  frameRate(60);
  size(900,650);
  ellipseMode(CENTER);
  strokeWeight(2);
  colorMode(HSB,360,100,100);
  noCursor(); // it is replaced by the fly sawtter, but does reapear on the home and lose screens
  f= createFont("SF_Slapstick_Comic-webfont.ttf"); 
 
    
  squasher= new Squasher(25); //make a new Squasher and give it a radius of 25
  
  //sets the new sprites random location between 45 and 850 on the x-axis and 
  //580 and 1000 on the y (so some start off the page) 
  for(int i=0; i<sprites.length; i++){
    sprites[i]=new Sprite(random(45,850),random(680,1000)); }
    
  //load image file
  img= loadImage("blanket.jpg");
  
  //load swatter
  swatter= loadImage("swatter.png");
  
  //load blue critter
  blueCritter= loadImage("blueCritter.png");
  
  //load purple critter
  purpleCritter= loadImage("purpleCritter.png");
  
  //load orange
  orange= loadImage("orange.png");
  
  //load cookie
  cookie= loadImage("cookie.png");
  
  //load bronze
  bronze= loadImage("bronze.png");
  
  //load silver
  silver= loadImage("silver.png");
  
  //load gold
  gold= loadImage("gold.png");
  
  //load crown
  crown= loadImage("crown.png");
  
  //load start button
  start= loadImage("start.png");
  
  //load restart button
  restart= loadImage("restart.png");
  
  //load sounds
  maxim= new Maxim(this);
  player=maxim.loadFile("boing.mp3");
  player.setLooping(false);
}

void draw() {
  
  if (time>0){ // if time is greater than 0, then time (the game) has started
    
  if (allAtPicnic()){ // if all the sprites are at the picnic... do this (this is the lose screen)
    cursor();
    //draw background again
    background(86,95,61);
    image(img,0,0); //blanket image
    //background lines
    for (int i=0; i<width; i+=20) {
    line(i,0,i,800);
    stroke(0,0,99,45);
    }
    
    textFont(f,30); // text for game over screen
    textAlign(CENTER);
    fill(0,0,99);
    text("Oh no! all the critters got to your picnic!", width/2 , height/2-125); // the + signs are because you are adding multiple pieces of information
    
    if(score<=0){
    text("Do you even enjoy picnics? you didn't swat any critters.", width/2 , height/2-75);
    text("... destroyer of picnics!", width/2 , height/2-25);
    }
  
    else if (score>0 && score<=24){ // you haven't gotten a trophy yet
    text("You did manage to swat away " + score + " critters", width/2 , height/2-75);
    text("before they invaded, but I know you want some trophies.", width/2 , height/2-25);
    }
    
    else if (score>=25 && score<=49){
    text("You did manage to swat away " + score + " critters", width/2 , height/2-75);
    text("before they invaded, but you can do better than that.", width/2 , height/2-25);
    image(bronze,400,325);
    }
   
    else if (score>=50 && score<=74){
    text("You did manage to swat away " + score + " critters", width/2 , height/2-75);
    text("before they invaded, but I know you want to go for gold.", width/2 , height/2-25);
    image(silver,400,325);
    }
    
    else if (score>=75 && score<=79){
    text("... but Holy moly! you swatted away " + score + " critters", width/2 , height/2-75);
    text("before they invaded. Go you! and you've got the gold trophy!", width/2 , height/2-25); 
    image(gold,400,325);
    }
    
    else if (score>=80){
    text("... but wowzers! you swatted away " + score + " critters", width/2 , height/2-75);
    text("before they invaded. All hail the master of picnics!", width/2 , height/2-25);
    image(crown,400,325);
    }
    
    image(orange,200,500);// critters with the food
    
    image(cookie,450,500);
    
    image(restart,width/2-130,height/2+90); // restart button
   
  }
  
  else{ // if not, then run the game
  //draw background
  noCursor();
  background(86,95,61);
  image(img,0,0); //blanket image
  //background lines
  for (int i=0; i<width; i+=20) {
  line(i,0,i,800);
  stroke(0,0,99,45);
  }
  
  for(int i=0; i<sprites.length; i++){
  sprites[i].display(); //display the sprites
  sprites[i].flap(); //make the sprites flap
  } 
  squasher.setLocation(mouseX,mouseY); //set the location of the squasher to the mouse location
  squasher.display(); // display the squahser
 
  textFont(f,20); //score 
  fill(0,0,99);
  text("Critters swatted away: " + score,125,125);
  
  if(score>=25){ // if statements for the trophies
    image(bronze,25,155);
  }
  if(score>=50){
    image(silver,100,155);
  }
  if(score>=75){
    image(gold,175,155);
  }
  if (score>=80){
    image(crown,250,155);
  }
  
  textFont(f,20); //sprites invaded
  fill(0,0,99);
  text("Critters that have invaded",130,300);
  
  //holders for the "sprites invaded" circles
    noFill();
    strokeWeight(1);
    stroke(167,90,40);
    ellipse(25,350,20,20);
    
    noFill();
    strokeWeight(1);
    stroke(167,90,40);
    ellipse(50,350,20,20);
    
    noFill();
    strokeWeight(1);
    stroke(167,90,40);
    ellipse(75,350,20,20);
    
    noFill();
    strokeWeight(1);
    stroke(167,90,40);
    ellipse(75,350,20,20);
    
    noFill();
    strokeWeight(1);
    stroke(167,90,40);
    ellipse(100,350,20,20);
    
    noFill();
    strokeWeight(1);
    stroke(167,90,40);
    ellipse(125,350,20,20);
    
    noFill();
    strokeWeight(1);
    stroke(167,90,40);
    ellipse(150,350,20,20);
    
    noFill();
    strokeWeight(1);
    stroke(167,90,40);
    ellipse(175,350,20,20);
  
  //fills in the circles when that sprite in the array is let through (was the only way I could figure out how to count that wit my boolean function)  
  if(sprites[0].atPicnic){ 
    noStroke();
    fill(167,90,40);
    ellipse(25,350,20,20);
  }
  if(sprites[1].atPicnic){ 
    noStroke();
    fill(167,90,40);
    ellipse(50,350,20,20);
  }
  if(sprites[2].atPicnic){ 
    noStroke();
    fill(167,90,40);
    ellipse(75,350,20,20);
  }
  if(sprites[3].atPicnic){
   noStroke(); 
    fill(167,90,40);
    ellipse(75,350,20,20);
  }
  if(sprites[4].atPicnic){ 
    noStroke();
    fill(167,90,40);
    ellipse(100,350,20,20);
  }
  if(sprites[5].atPicnic){
    noStroke();
    fill(167,90,40);
    ellipse(125,350,20,20);
  }
  if(sprites[6].atPicnic){
    noStroke();
    fill(167,90,40);
    ellipse(150,350,20,20);
  }
  if(sprites[7].atPicnic){
    noStroke();
    fill(167,90,40);
    ellipse(175,350,20,20);
  }
 
  
  }
  } // end of if statement
  
  if(time<=0){ // if time is less than 0 then the game has not started (this is the opening screen)
    cursor();
    //draw background again
    background(86,95,61);
    image(img,0,0); //blanket image
    //background lines
    for (int i=0; i<width; i+=20) {
    line(i,0,i,800);
    stroke(0,0,99,45);
    }
    
    textFont(f,40); // text for home screen
    textAlign(CENTER);
    fill(0,0,99);
    text("Use the fly swatter to swat the critters ", width/2 , height/2-100);
    text("away from your picnic! ", width/2 , height/2-65);
    
    textFont(f,30);
    text("better be quick, those pesky critters come back faster!", width/2 , height/2+5);
    
    image(start,width/2-130,height/2+90);
    
    image(blueCritter,550,350);
    
    image(purpleCritter,40,350);
   
  if (mousePressed){ // when the mouse is pressed, time will begin to increase (the game will start)
    time = time +1;
 }
 
  }
  
} /////////////////////////////////////////// end of draw


 Boolean allAtPicnic(){ // returning a boolean (like void, but it's giving you a value)
  for(int i=0; i<sprites.length; i++){ // going through each spot in the array
    if(sprites[i].atPicnic){
    }
    else{
     return false; // if false exits out of function (and will continue the game)
    }
    }
  return true; // actually outside of the for loop (waits for all of them to get the Picnic)
}

void mouseClicked(){
  for(int i=0; i<sprites.length; i++){
  if (squasher.intersect(sprites[i])){ 
    sprites[i].caught();
  } 
  }
 
    // on mouse click, the game restarts to the home page
    if(allAtPicnic() && mouseY>height/2+90){
    time=0;
    score=0;
    frameRate(60);
    size(900,650);
    ellipseMode(CENTER);
    strokeWeight(2);
    colorMode(HSB,360,100,100);
    noCursor();
    f= createFont("SF_Slapstick_Comic-webfont.ttf"); 
 
    
    squasher= new Squasher(25); //make a new Squasher and give it a radius of 25
    //sets the new sprites random location between 45 and 850 on the x-axis and 
    //580 and 1000 on the y (so some start off the page)
  
    for(int i=0; i<sprites.length; i++){
    sprites[i]=new Sprite(random(45,850),random(680,1000)); }
    
    //load image file
    img= loadImage("blanket.jpg");
   
    //load swatter
    swatter= loadImage("swatter.png");
  
    //load blue critter
    blueCritter= loadImage("blueCritter.png");
  
    //load purple critter
    purpleCritter= loadImage("purpleCritter.png");
  
    //load orange
    orange= loadImage("orange.png");
  
    //load cookie
    cookie= loadImage("cookie.png");
    
    //load bronze
    bronze= loadImage("bronze.png");
  
    //load silver
    silver= loadImage("silver.png");
  
    //load gold
    gold= loadImage("gold.png");
    
    //load crown
    crown= loadImage("crown.png");
    
    //load start button
    start= loadImage("start.png");
    
    //load restart button
    restart= loadImage("restart.png");
    
    //load sounds
    maxim= new Maxim(this);
    player=maxim.loadFile("boing.mp3");
    player.setLooping(false);
    }
}
 
  class Squasher { 
    int r; // the radius
    int x;
    int y;
    
    Squasher(int tempR) { // constructor for temporary radius
    //set variables
    r= tempR;
    x=0;
    y=0;
    }
  
  void setLocation(int tempX, int tempY) {
    x= tempX;
    y= tempY;
  }
  
  void display(){
    image(swatter,mouseX-50,mouseY-50);
  }
  
  // test to see if the radius of the squasher intersects the radius of Sprite
  boolean intersect(Sprite s) {
    int distance= dist(x,y,s.cx,s.cy); //s.cx and s.cy are the variables used to define Sprite
    if (distance < r + s.r) { // if the radius of the squasher plus the radius of the Sprite is less than the distance set intersect to true
      return true;
    }else{ // otherwise it is false
      return false;
    }
  }
  } // end of Squasher class
  
  
  
  class Sprite { // somewhere in here, need boolean that starts at false to test if at picnic

  //variables
  int cx;
  int cy;
  int diameter;
  int r;
  int eyeSize;
  int pupil;
  int speed;
  //color
  int h;
  int s;
  int b;
  //
  int strokeColor;
  int x;
  int y;
  int angle;
  boolean armUp=true;
  boolean atPicnic=false;
  
  //constructor--> define above variables
  Sprite(int centerX,int centerY) { //defines center point x to use the mouseX location and y that is stated above in mouse clicked
     cx= centerX;
     cy= centerY;
     diameter= 75;
     r= 30;
     eyeSize= diameter/2;
     pupil= eyeSize/3;
     speed=25;
     angle= -45;
     h=276;
     s=38;
     b=89;
     strokeColor= color(167,90,40);
     
     h=random(167,250);
     speed= constrain(random(10,25));
  }
  
  void display() { 
  //body
  fill(h,s,b);
  stroke(strokeColor);
  strokeWeight(2);
  ellipse(cx,cy,diameter,diameter);
  
  //eyes
  for(int i=0; i<2; i++){ //I want 2 eyes
    fill(0,0,99); //fill it with white
    noStroke();
    ellipse(cx-20+i*40,cy-20,eyeSize,eyeSize); //draw an ellipse 40 pixels subtracted from x and 20 subtracted from y at 60 by 60. Then tell it to add 80 pixels inbetween both eyes (i*80 is the space inbetween each eyes center point)
  }
  
  //pupil
  for(int i=0; i<2; i++){
    fill(0);
    ellipse(cx-20+i*40,cy-20,pupil,pupil);
  }

  //evebrows
  //for(int i=0; i<2; i++){
    stroke(strokeColor);
    strokeWeight(5);
    //line(cx-65+i*60,cy-40,cx-15+i*60,cy-40);
    line(cx-45,cy-30,cx-10,cy-45);
    line(cx+10,cy-45,cx+45,cy-30);
    
  
    // arms
    
    // makes the arms rotate
    x= cos(radians(angle))*r;
    y= sin(radians(angle))*r;
     
    stroke(strokeColor);
    strokeWeight(7);
    line(cx-10-r,cy,cx-r-x,cy+y); 
    line(cx+10+r,cy,cx+r+x,cy+y); 
  
   if(armUp){ 
     angle=angle-5;
   }
   else{
     angle=angle+speed;
   }
   
   if(angle>= 50){
     armUp=true;
   }
   else if (angle<= -30){
     armUp=false;
   }
  
  if(cy<=50){ // when cy of the sprites is less than or equal to 50 then at picnic is true
    atPicnic=true;
  }
  else{atPicnic=false;} // otherwise it is false
  }
  
  void flap(){
  if(!armUp){ // if armUp is false (the arm is down) move the y center point 4 pixels down the screen
    cy=cy+speed/10;
  }
  else{
  cy=cy-speed/7;
  }  // otherwise (if arm is up) move the y center point 5 spaces up the screen  

  } // if cy <0 statement

void caught() {
  cy= random(800,1000); // when the sprite is caught, move the sprite somewhere off the screen to a random y loctation between 800 and 1000
  cx= random(45,850); // when the sprite is caught, move the sprite somewhere off the screen to a random x loctation between 45 and 850
  speed= speed+3; // when they are caught and then reappear increase the speed by 3 each time
  score++; // if the Sprite is caught, add one to the score
  if(played){
    player.stop();
  }
  player.play();
  played=true;
}

} //end of Sprite class



