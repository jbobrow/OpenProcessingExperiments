
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/32178*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
Catcher catcher;
FallingObject ball;
Score scoreBoard;
Timer timer;
RectGame fall;


void setup(){
 fall = new RectGame(500, 500, 8, color(0));
fall.reset();
  
 
  
}

void draw(){

     noCursor();
  background(0);
    timer.display();
    fall.start();
    catcher.display();
    
    if(keyPressed == true){
      fall.reset();
  
  }   }
    

// The catcher will follow your mouse and attempt to wither catch or dodge the falling objects
class Catcher{
  float x;// x position of the cathcer
  float y;// y position of the cathcer
  int w;// width of the cathcer
  int h;// height of the cathcer
  String catcherName;// stringName of the catcher
  PImage catchImage;
  
  Catcher( int wid, int hei, String catc){// constructor
  catcherName = catc;
  catchImage = loadImage(catc);
    w = wid;
    h = hei;
   
    catchImage.resize(100,194);
  }
  
  
  void display(){ // This method needs 4 if statements to be added
    
   image(catchImage, mouseX,mouseY);
    
    if(mouseX < 0){ // if the catcher is at the left edge of the screen, don't let it go out of the screen
      image(catchImage,0,mouseY);
    }
    if(mouseX > width-w){ // if the catcher is at the right edge of the screen, don't let it go out of the screen
      image(catchImage,width-w,mouseY);
    }
    if(mouseY < 0){ // if the catcher is at the top edge of the screen, don't let it go out of the screen
     image(catchImage,mouseX,0);
    }
    if(mouseY > height-h){ // if the catcher is at the bottom edge of the screen, don't let it go out of the screen
       image(catchImage,mouseX,height-h );
    }
    if(mouseX < 0&& mouseY < 0){ // if the cathcer is in the top left corner of the screen, don't let it go out of the screen
      image(catchImage,0,0);
    }
    if(mouseX < 0 && mouseY > height - h){ // if the catcher is at the bottom left corner of the screen, don't let it go out of the screen
      image(catchImage,0,height-h);
    }
    if(mouseX > width - w && mouseY < 0){ // if the catcher is at the top left corner of the screen, don't let it go out of the screen
        image(catchImage,width - w,0);
    }
    if(mouseX > width - w && mouseY > height - h){ // if the catcher is at the bottom left corner of the screen, don't let it go out of the screen
       image(catchImage,width - w,height - h);
    }
  }    
  


  
    
}
class FallingObject{
  float x; //x position of the falling object
  float y; //y position of the falling object
  int w; //width of the falling object
  int h; //height of the falling object
  float sp; //speed of the falling object
  
  String ball;  //the string name of an image being used as the falling object
  PImage faller;  //the actual image being used as the falling pbject
  
    FallingObject(float xPos, float yPos, int wid, int hei, float speed, String ballImage){
    x = xPos;
    y = yPos;
    w = wid;
    h = hei;
    sp = speed;

    ball = ballImage;
    faller = loadImage(ball); // load the image stringname to make it an actual PImage
    faller.resize(w,h); // make the image as big/small as you want it
  }
  
  void display(){
   
    rectMode(CENTER);

    image(faller,x,y);
  }
  
  void drive(){
    y = y + sp;
    if (y > height){
      y = 0;
      x = random(width - w);
    }
  }
}
class RectGame{
  int score = 0; //variable for keeping score
  int w;// width of the game screen
  int h;//height of the game screen
  color c;//color of the background
  int numfall;//number of objects falling at one time
  ArrayList fallers;// the list that will hold the fallers and keep refilling itself 
  Score scoreBoard = new Score(20,20);
   String[] pics = {"thumb.png","person.png"};
    int index = int(random(pics.length));
  boolean finished = false;
  
  RectGame( int wid, int hei, int numfallers, color col){ // constructor
    fallers = new ArrayList(numfallers);
    w = wid;
    h = hei;
    numfall = numfallers;
    c = col;
   
  }
  
  void gameSetup(){ // this method sets the size and background color of the game
    size(w,h); 
    background(c);
  }
  
  void refill(){
       scoreBoard.display();
    if(fallers.size()<numfall){ // if the amount of falling objects in the list is less than the amount we want
        for(int i = 5; i< numfall-fallers.size();i++){ // add the difference
      fallers.add(new FallingObject(random(width), 0, 30, 30, 8, pics[int(random(pics.length))]));
        }
 
    }
  }
  
 void start(){
   this.refill(); // see above
     for(int i=0; i < fallers.size()-1; i++){ // make all the fallers in the list be shown and move.
    ((FallingObject)fallers.get(i)).display();
    ((FallingObject)fallers.get(i)).drive();
     
    if (2*dist(mouseX, mouseY, ((FallingObject)fallers.get(i)).x, ((FallingObject)fallers.get(i)).y) < 20 + max(catcher.w,catcher.h) ){
     ((FallingObject)fallers.get(i)).sp = -((FallingObject)fallers.get(i)).sp;
      //fallers.remove(i); // if the catcher catches the object, remove it.
    
    }
    if(((FallingObject)fallers.get(i)).y < 0){
      fallers.remove(i);
      scoreBoard.score++;
    }
  }
 }
  void reset(){
  size(500,500);
  textSize(15);
  catcher = new Catcher(50,50, "C30_roof.png");
  scoreBoard = new Score(20,20);
  timer = new Timer();
  fall.gameSetup();
  timer.start();  
 }

 
 
}
class Score{
  int x;
  int y;
  int score;
  
  Score(int xPos, int yPos){
    
    x = xPos;
    y = yPos;  
}

void display(){
  text("Score: "+ score, x, y);
}
}
class Timer {
 final String prefix = "This timer has been running for ";
  int startingTime; // When Timer started

  

  
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
     startingTime = millis();
  }
  
 
   
   void display(){
 
  int seconds = (millis() - startingTime) / 1000;
  int minutes = seconds / 60;
  int hours = minutes / 60;
  int days = hours / 24;
  seconds -= minutes * 60;
  minutes -= hours * 60;
  hours -= days * 24;

  String message = prefix + GetPlural(seconds, "second");


  text(message, 20, 100);
//  println(message);

if(seconds == 20){
 
  fall.finished = true;
  delay(2000);
  fall.reset();

}
   }

String GetPlural(int value, String word)
{
  if (value == 1)
    return value + " " + word;
  // Ad hoc for current sketch,
  // I have something more elaborate for irregular plurals
  return value + " " + word + "s";
}
  }


