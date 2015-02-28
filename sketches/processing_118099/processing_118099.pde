
//mickey&minnie images
PImage mickeyImage;
PImage minnie;
 
 
Mouse mickey;
 
 
//image positions
float minnieXpos = 100;
float minnieYpos = 75;
 
//array of strings - global
//String [] words = new String[3];
 
 
 
 
void setup() {
  size(500, 500);
  background(200);
 
    //create Mouse
  mickey = new Mouse();
   
   //elements of the array
//  words[0] = "Mickey";
//  words[1] = "MINNIE!";
//  words[2] = "YAY!";
   
  //load images into composition
  mickeyImage = loadImage("mickey.jpg");
  minnie = loadImage("minnie.jpg");
  
}
 
 
//create Mouse object
class Mouse {
  float xPos;
  float yPos;
  float xspeed;
  //score/time intially set to 0
  int score = 0;
  int time = 0;
   
  Mouse(){
     xPos = width/2; //positions of images
     yPos = height/2;
     xspeed = 15;
  }
 
void display(){
   background(255);
   // Loading the text file "minnie" as a string array
  String[] data = loadStrings("minnie.txt");
   
    //loop through array to print string array
  for(int i =0; i < data.length; i++){
    float x= random(500);   //random positions of strings
    float r= random(500);  //random position of string
    float red = random(255);
    float blue = random(255);  //rand colors of string
    float green = random(255);
    float size = random(80);
    textSize(size);
    fill(red, blue, green);
    text(data[i], x,r);
    frameRate(5);
  }
    
 
  
  fill(0);
  textSize(20);
  time = millis()/1000;  //setting up timer
  text("Score: "+ score, 10,20);  //keeping track of "score"
  text("Time: "+ time, 10,40);   //keeping track of time
   
  //speed up mickey when "n" is pressed
  if( key == 'n'){
     mickey.xspeed = 20;
   }
    
  image(mickeyImage, xPos, yPos, 133,119);
  image(minnie, minnieXpos, minnieYpos, 80, 65);
}
 
void walk(){
  // xPos += xspeed;
  float distanceY = dist(xPos, yPos, xPos, 0);
  float distanceX = dist(xPos, yPos, 0, yPos);
  float distance = dist(xPos, yPos, minnieXpos, minnieYpos);
   
 //conditonal to have minnie appear randomly after colliding with mickey
  if (keyPressed && key == CODED){
     if( distance < 85){
       minnieXpos = random(475);
       minnieYpos = random(475);
       score++;
     }
    if (keyCode == UP) {
      if( distanceY < 1){
        yPos =1;
        score = 0;
      }
      yPos-=xspeed;
    } 
    if (keyCode == DOWN){
      if(distanceY > 382){
      yPos = 382;
        score = 0;
      }
     yPos+=xspeed;
    }
    if (keyCode == RIGHT) {
      if(distanceX > 382){
      xPos = 382;
        score = 0;
      }
      xPos+=xspeed;
    }
    if (keyCode == LEFT) {
      if(distanceX < 4){
      xPos = 4;
      score = 0;
      }
      xPos-=xspeed; 
    }
    }
}
   
}
void draw() {   
    
   mickey.walk();
   mickey.display();
    
}


