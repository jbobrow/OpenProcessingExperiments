
// Fairly Impossible Maze
//By Zach Ruddell 2012
// Notes for playing game*
//You have 250 seconds to solve it.
//Restart it, if you get gameover!
//Cant win? Disable myImg = null, and than try! 

PImage myImg;
PImage myImg2;
PImage myImg3;
PImage myImg4;
PImage myImg5;
PImage myImg6;
PImage myImg7;
PImage myImg8;
PImage myImg9;
PImage myImg10;
PImage myImg11;
// All my images

int a = 0;
int kurtz = 0;
int speed = 15;
void setup(){
size(800,800);
 
  textSize(50);
  
   
  
  myImg = loadImage("maze.jpg");
  // Orginal Maze image taken from http://www.uefap.com/speaking/exercise/mazes/mazes.htm
  myImg2 = loadImage("gameover.jpg");
  myImg3 = loadImage("red.jpg");
  myImg4 = loadImage("blue.jpg");
  myImg5 = loadImage("purple.jpg");
  myImg6 = loadImage("pink.jpg");
  myImg7 = loadImage("green.jpg");
  myImg8 = loadImage("orange.jpg");
  myImg9 = loadImage("arrow.jpg");
  myImg10 = loadImage("end.jpg");
  myImg11 = loadImage("win.jpg");
  //Graphics for all buttons and images

}
void draw(){
 
   image(myImg,0,0);
   //Maze
   
  image(myImg9,2,140);
  //Start Image
  
  image(myImg10,470,4);
  //End Image
  
      int sec = millis()/1000;
println(-sec+250);
//Count Down 
 
  if ((-sec+250)<0){
    image(myImg2,0,0);
 myImg = null;
}
//END of Countdown
 
 if(mouseX > 0 && mouseX < 40 && mouseY >130 && mouseY < 200){
 for(int X=0; X < 1000; X++){
    fill(255,0,0);
  text("GIVE UP NOW!",300,X*50);
  //Warning at begining of game! 
   }
 }

  
  strokeWeight(5);
  smooth();
 
 line(455,20,455,0);
 line(455,0,558,0);
 line(558,0,558,20);
 //Lines to make box around END Goal
     
   color cp = get(mouseX,mouseY);
    float b = brightness(cp);
     
    if(b<=0){
      noCursor();
      image(myImg2,0,0);
      myImg = null;
    }else{
      
      cursor(ARROW);
    }
    //Code you helped me with, to make mouse disapear when touching line. 
    
   if(mouseX > 478 && mouseX < 510 && mouseY >0 && mouseY < 25){
      image(myImg11,0,0);
     myImg = null;
     //You won image/end of the game
   }
      
     
    //This is where ghost/distractions come. 
    //Its from an old bit of code I used in my midterm accept modified.
     kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
  
   image(myImg8,kurtz,8);
  //24
  
kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);

  image(myImg3,kurtz,33);
  //1
  
   kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  image(myImg4,kurtz,66);
  //2

kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  image(myImg5,kurtz,99);
  //3
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
  
  image(myImg6,kurtz,132);
  //4
  
kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
  
  image(myImg7,kurtz,165);
  //5
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  image(myImg8,kurtz,198);
  //6
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  image(myImg3,kurtz,231);
  //7
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  image(myImg4,kurtz,264);
  //8
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
  
  image(myImg5,kurtz,297);
  //9
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);

  image(myImg6,kurtz,330);
  //10
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  image(myImg7,kurtz,363);
  //11
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  image(myImg8,kurtz,396);
  //12
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
  
  image(myImg3,kurtz,429);
  //13
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  image(myImg4,kurtz,462);
  //14
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  image(myImg5,kurtz,495);
  //15
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
  
  image(myImg6,kurtz,528);
  //16
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);

   image(myImg7,kurtz,561);
  //17
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  image(myImg8,kurtz,594);
  //18
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  image(myImg3,kurtz,627);
  //19
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);

  image(myImg4,kurtz,660);
  //20
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
  
  image(myImg5,kurtz,693);
  //21
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);

  image(myImg6,kurtz,726);
  //22
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
  
  image(myImg7,kurtz,759);
  //23
  

  
  //End of Ghosts
}


