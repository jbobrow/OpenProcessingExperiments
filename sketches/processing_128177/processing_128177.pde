

Ball[] balls = new Ball[20];
float distanceMargin= 30;
PImage cloud;
int counter =20;
PFont boldFontA;

void setup(){
  size(1000,700);
  smooth();
  frameRate(100);
  
  //clouds
  cloud = loadImage("cloud.jpg"); 
 
  //text
  boldFontA = loadFont("Candara-BoldItalic-48.vlw");
  
  //balloons
  for(int i=0;i<balls.length;i++){
    balls[i] = new Ball(random(50, width-50), random(height-50, height+50));
  }
  
}

void draw(){
  
  //Set screen
  background(#B3DDE0);
  clouds(); 
  
  for(int i=0;i<balls.length;i++){
    balls[i].setIndex(i);
    balls[i].draw();
  }
  
  //Text
  fill(#FC7D7F);
  textFont(boldFontA,30);
  text("Balloons Left: "+counter, 750, 50);
  textFont(boldFontA,16);
  text("Press Space Bar to refresh",750,70);
 
  //Cursor
  noFill();
  stroke(#FFFFFF);
  strokeWeight(1);
  ellipse(mouseX,mouseY, 20,20);
  ellipse(mouseX,mouseY, 30,30);
  line(mouseX-20,mouseY,mouseX+20, mouseY);
  line(mouseX, mouseY-20, mouseX, mouseY+20);
  
  if(counter ==0)
  {
    fill(#FC7D7F);
    textFont(boldFontA,100);
    textAlign(CENTER,CENTER);
    text("GOOD JOB!", width/2, height/2);
  }
}

void keyPressed(){
  
  //If space bar is pressed, reset all balloons
  if(key == ' '){

   for(int i=0;i<balls.length;i++){   
     balls[i] = new Ball(random(50, width-50), random(height-200, height));
     counter=20;
   } 
  }
}

void mousePressed(){ 
  
  
  PVector mousePosition = new PVector(mouseX,mouseY);
  
  for (int i=0; i<balls.length;i++){
   
    //Check if mouse cursor is at the same location as each ball
    if(mousePosition.dist(balls[i].getBallLocation()) < distanceMargin){
       balls[i].erase();
       counter--;
    }
  }

}

//Displays cloud background
void clouds(){
  
  image(cloud,80,30,140,100);
  image(cloud,300,260,270,220);
  image(cloud,860,130,230,180);
  image(cloud,700,500,200,160);
  image(cloud,100,580,230,180);
 
}


class Ball {
  float x;
  float y;
  float speedX;
  float speedY;
  private int index;
  
  //Constructor
  Ball(float _x, float _y) {
    x = _x;
    y = _y;
    speedY = random(-3,-0.3);
    speedX = random(-0.5,0.5);
  }
  
  //Assign each ball to an index number
  void setIndex(int _index){
    index = _index;
    }
  
  //Draw balls  
  void draw() {
    
    //Determines speed of balloon
    y = y + speedY;
    x = x + speedX;
    
    //String
    strokeWeight(1);
    stroke(#FFFFFF);
    line(x,y,x,y+100);
    
    //Balloon
    stroke(#FFFFFF);
    strokeWeight(4);
    quad(x-2, y+47, x+2, y+47, x-4, y+50, x+4, y+50);
    fill(#FC7D7F);
    ellipse(x,y,87,90);
    
  }
  
  //Returns the X,Y coordinates of each ball
  PVector getBallLocation(){
    PVector ballLocation = new PVector(x,y);
    return ballLocation;  
  }
  
  //"Erases" the balloon by offsetting it to an offgrid location
  void erase(){
    x = 1500;
    y = 1000; 
  } 
}

 


