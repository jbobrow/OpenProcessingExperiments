
 //This is the central game file, by Corey Butler, NMD 102
 //IF IT DISPLAYS LARGER THAN YOUR RESOLUTION PLEASE USE THE APPLICATION VERSION INCLUDED IN THIS PACKAGE 
 //Global Game Variables
int remainingLives, points, laneAmount;
PImage world;
//Game Objects
Lane[] movingObjects; //This is an array of the various lanes in the game the highway and the logs
Frog frogger;
void setup(){
  size(919,1050);
  world= loadImage("http://img25.imageshack.us/img25/9233/editedfroggeryr9.jpg");//background image I made, hosted online
  textFont(loadFont("AppleCasual-48.vlw"), 26);
  remainingLives=3;
  points=0;
  frogger=new Frog(width/2,950);
  movingObjects= new Lane[7]; //there are 7 total lanes to pass to get to the grass
  //Highway Lanes Initialization
  movingObjects[0]= new Lane(2,true,true,45,1,850);//bottom
  movingObjects[1]= new Lane(4,true,false,25,1,750);//middle
  movingObjects[2]= new Lane(3,true,true,35,1,650);//top
  //Water Chunks Initialization
  movingObjects[3]= new Lane(4,false,false,15,1,487);//bottom
  movingObjects[4]= new Lane(2,false,true,5,1,413);//middle
  movingObjects[5]= new Lane(5,false,false,15,1,337);//top
  movingObjects[6]= new Lane(1,false,true,35,1,263);//tippy top
}//main draw loop
void draw(){
  background(world); //Show Background
  updateStats(); //Update points and lives
  frogger.displayMe(); //Show where the frog currently is
  for(int i=0;i<movingObjects.length;i++){
    movingObjects[i].operateLane();//have all lanes move appropriately based on their constructor
}}
//main methods
void updateStats(){
  text("Lives Remaining:"+remainingLives+" Current Score: "+points, 15,50); //display current points and lives at the top of the screen
  if(remainingLives<0){//check for game over
    text("GAME OVER!!1!",15,80);//display game over
    noLoop();//hault the game
  }else{
    text("Use the arrow keys to safely cross the road and river",15,80); //the instructions
}}
  //frogger control, has the frogger object move himself
void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){
    frogger.moveUp(); }
    else if(keyCode==DOWN){
    frogger.moveDown();}
    else if(keyCode==LEFT){
    frogger.moveLeft();}
    else if(keyCode==RIGHT){
    frogger.moveRight();}
  }}

