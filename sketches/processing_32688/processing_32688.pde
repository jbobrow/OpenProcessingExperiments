
class RectGame{
  int score = 0; //variable for keeping score
  int w;// width of the game screen
  int h;//height of the game screen
  color c;//color of the background
  int numfall;//number of objects falling at one time
  ArrayList fallers;// the list that will hold the fallers and keep refilling itself
  Score scoreBoard = new Score(20,20);
   String[] pics = {"acorn.jpg","acorn.jpg","acorn.jpg","acorn.jpg","dog.jpg" };
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
    size(500,500);
    background(c);
  }
   
  void refill(){
       scoreBoard.display();
    if(fallers.size()<numfall){ // if the amount of falling objects in the list is less than the amount we want
        for(int i = 0; i< numfall-fallers.size();i++){ // add the difference
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
         if(((FallingObject)fallers.get(i)).ball==pics[4]){
           scoreBoard.score = 0;
         }
     ((FallingObject)fallers.get(i)).sp = -((FallingObject)fallers.get(i)).sp;
      //fallers.remove(i); // if the catcher catches the object, remove it.
    }
    if(((FallingObject)fallers.get(i)).y>height){
       fallers.remove(i);
 
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
  catcher = new Catcher(50,50, "squirrel.jpg");
  scoreBoard = new Score(55,20);
  timer = new Timer();
  fall.gameSetup();
  timer.start(); 
 }
 
  
  


 void end(){
background(0);
 //Load font for words on Game Over screen.
 
 fill(255);
 //Align loseDisplay font.
 textAlign(CENTER);
 
 //Write 'Game Over'.
 text("Game Over", width/2,height/4);
 //Write 'Score: currentScore'.
 text("Score: " + scoreBoard.score, width/2, height/2);
 text("Press any key to play again\n Press mouse to quit", width/2, 300);
   if(mousePressed == true){
    System.exit(0);
   }
   if(keyPressed == true){
     gameOver = false;
     this.reset();
      
   }
 }
}


