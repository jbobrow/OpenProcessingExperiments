
PImage myImage01;
PImage myImage02;
PImage myImage03;
float x=100;
float y=1;
float speed=1;


void setup(){
  size(170,800);
  smooth();
  //nocursor();
}


void draw(){
  background(0);
  stroke(0);
   
  myImage01=loadImage("04.png"); //load the pan
  myImage02=loadImage("02.png");//;oad the angry bird
  myImage03=loadImage("05.png");//;oad the angry bird
  image(myImage03,-10,40,205,22);//red circle
  image(myImage01,mouseX-10,mouseY-10,141,61);//red circle
  image(myImage02,x,y,30,30);//the angry bird
  //speed += gravity;
  y+= speed; 
 
if(y>600){
    y=mouseY+speed;
    }//make the bird move on and on
    
    
if(y>mouseY-15 && y<mouseY){
  y = mouseY-85;
  }else{
  y+= speed;
   }
 
}


