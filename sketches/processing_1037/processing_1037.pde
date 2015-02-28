
//Programmed by Joshua McGrath
//NMD 102 Scott

//This is my Frogger game, it uses color detection as well as prerendered graphics.
//Use UP,DOWN,LEFT, and RIGHT to move
//Don't get hit by cars and don't touch the water for some reason...
//Try to get on the lilly pads.

//variable to hold the score
int score = 0;

//initializing a font
 PFont font;
  PFont font2;

frogger frog= new frogger(256,576,score);

//the car objects, specs: x,y,x width, velocity, type choice(0 for car, 1 for log)
car redc= new car(544,512,64, -2, 0);
car redc_2= new car(800,512,64, -2, 0);
car redc2 = new car(-64,480,64, 3, 0);
car redc3 = new car(544,448,64, -4, 0);
car redc3_2 = new car(800,448,64, -4, 0);
car redc4 = new car(-64,416,64, 5, 0);
car redc5 = new car(544,384,64, -6, 0);
car redc5_2 = new car(800,384,64, -6, 0);

//the log objects
car log1 = new car (544, 288,128, -2, 1);
car log1_2 = new car (800, 288,128, -2, 1);
car log2 = new car (-128, 256,128, 1, 1);
car log3 = new car (-128, 224,128, 3, 1);
car log3_2 = new car (-384, 224,128, 3, 1);
car log4 = new car (544, 192,128, -2, 1);
car log5 = new car (-128, 160,128, 2, 1);
car log6 = new car (544, 128,128, -3, 1);
car log6_2 = new car (800, 128,128, -3, 1);

//create a place to save the background picture data to
//saves a lot of processing power
PGraphics game_screen;
PGraphics lives_graphics;



//position of life icons
int xl = 5;

//debug function used during development
void debug()
//prints frame rate to screen
{
  if(keyCode == DOWN)
  {
    fill(255);
    textFont(font); 
    text("Frame Rate:  " + frameRate, 30, 30);
  }
  
}


void setup(){
  size(544,640);        

  background(70,130,180);
  noStroke();


//Set live graphics
//P2D is the type of image being created
lives_graphics = createGraphics(124, 32, P2D);


//Set Game Screen
//Basically this is what I would usually do in draw, except now it only does it once
  game_screen = createGraphics(544, 640, P2D);

   game_screen.beginDraw();

  game_screen.background(70,130,180);
  game_screen.noStroke();
  
  //Scenery
   game_screen.fill(58);
   game_screen.rect(0,352, 544, 224); 
   game_screen.fill(0);
  game_screen.rect(0, 608, 544, 32);
   game_screen.rect(0,0, 544, 64);
   game_screen.fill(80, 168,59);
   game_screen.rect(0, 576, 544, 32);
   game_screen.rect(0, 320, 544, 32);
   game_screen.rect(0, 64, 544, 32);

  //upper green reception areas
   game_screen.rect(0, 96, 64, 32);
   game_screen.rect(96, 96, 64, 32);
   game_screen.rect(192, 96, 64, 32);
   game_screen.rect(288, 96, 64, 32);
   game_screen.rect(384, 96, 64, 32);
   game_screen.rect(480, 96, 64, 32);  
  
 //lilly pads
  game_screen.fill(80, 190,59);
  game_screen.ellipse(80,112,32,32); 
  game_screen.ellipse(176,112,32,32); 
  game_screen.ellipse(272,112,32,32);
  game_screen.ellipse(368,112,32,32);
  game_screen.ellipse(464,112,32,32);
   
   game_screen.fill(80, 160,59);
  game_screen.ellipse(80,112,25,25); 
  game_screen.ellipse(176,112,25,25);
  game_screen.ellipse(272,112,25,25);
  game_screen.ellipse(368,112,25,25);
  game_screen.ellipse(464,112,25,25);
  //end drawing 
 game_screen.endDraw();   
 
 //loading fonts into the fonts vairables I initialized earlier
  font = loadFont("Bauhaus93-18.vlw"); 
   font2 = loadFont("Bauhaus93-48.vlw"); 
  

  textAlign(CENTER);


  smooth();
  
  //call function that controls the life icons
frog.lives();

}


void draw(){
  frameRate(30);

//positioning my background graphics
image(game_screen, 0, 0);
image(lives_graphics,0,608);
//frog.lives();
//debug();

//drive makes all car objects be drawn and moved
  log1.drive();
  log1_2.drive();
  log2.drive();
  log3.drive();
  log3_2.drive();
  log4.drive();
  log5.drive();
  log6.drive();
  log6_2.drive();

//creating my frog and moving it
  frog.make();
  frog.move();

//score is also run through frogger's move function
score = frog.scr;

  redc.drive();
  redc_2.drive();
  redc2.drive();
  redc3.drive();
  redc3_2.drive();
  redc4.drive();
  redc5.drive();
  redc5_2.drive();

//I use color collisioning
  frog.collision();



  score(font);
 
}

//displays the score
void score(PFont fontr){
  fill(255);
  textFont(fontr); 
  text("Score:  " + score, 480, 627);


}


class frogger {
  //x position of frog
  int xf;
  //y position of frog
  int yf;
  
 //score
  int scr;
  //number of frogs on lily pads
  int lily_count=0;
  
  //controls rate of movement
  boolean locked= false;
  //number of lives left
  int lives= 4;
  //construtor function
  frogger(int xpos, int ypos, int score){

    xf = xpos;
    yf= ypos;
scr = score;
  }
//make draws the frog at it's x and y pos

  void make(){
    fill(54,112,40);
    rect(xf, yf, 8 ,8);
    stroke(255);
    point(xf,yf);
    point(xf+7,yf);

  }

//move uses the arrow keys 
  void move(){



    if (keyPressed == true){
      if (locked == false){


        if (key == CODED) {
          if (keyCode == UP && yf > 64) {
            yf = yf -8;
            scr+= 100;
            
          }
          if (keyCode == DOWN && yf < 576) {
            yf = yf +8;
             scr-= 100;
            
          }
          if (keyCode == LEFT && xf > 0) {
            xf = xf -8;
          }
          if (keyCode == RIGHT && xf < (512)) {
            xf = xf + 8;
          }

        }


      }
      locked = true;

    }
    else {
      locked = false;
    }
    //    println(xf);
    //    println(yf);

  }

//collision chcks to see if there is a certain color moving into frogger's space
//if so, something occurs

  void collision()
  {
    //upper green
    if (yf <= 128){
    if (get(xf-1,yf)==color(80, 168,59) || get(xf+7,yf+7)==color(80, 168,59) ){
      //sends you to the starting position
     xf = 256;
      yf = 576;
      //decrements lives
      lives-=1;
      frog.lives(); 
      
    }}
    //lilypads
    if (get(xf-1,yf)==color(80, 160,59) || get(xf+7,yf+7)==color(80, 160,59) ){
    
     xf = 256;
      yf = 576;
      //increases your score
      score+= 1000;
      //increments the number of successful frogs
      
    
    }
      //logs
      //if you are touching a log, that logs velocity is added to your frog, making
      //it move along with the log
    if (get(xf-1,yf)==color(121,92,48) || get(xf+7,yf+7)==color(121,92,48) ){
      if (yf >= 288){
        xf = xf + log1.v;
      }
      if(yf < 288 && yf >=256){
        xf+= log2.v;
      }
      if(yf < 256 && yf >=224){
        xf+=log3.v;
      }
      if(yf < 224 && yf >=192){
        xf+=log4.v;
      }
      if(yf < 192 && yf >=160){
        xf+=log5.v;
      }
      if(yf < 160 && yf >=128){
        xf+=log6.v;
      }


    }
    //cars
    if(red(get(xf,yf))==209 || red(get(xf+7,yf+7))==209)
    {

      xf = 256;
      yf = 576;
      lives-=1;
      //call the lives funtion to redraw lives
      frog.lives();      
    }
    //water
    if (yf >= 128){
    if(blue(get(xf,yf))==180 || blue(get(xf+7,yf+7))==180)
    {
     xf = 256;
      yf = 576;
      lives-=1;
      frog.lives();      
    }


  }
}
  
  //lives displays life icons, and displays a gameover screen when you have 0 lives
void lives(){
  if (lives<=0){
     
    textFont(font2); 
    fill(255); 
    text("GAME OVER", 272, 320);
//    delay(1000);
   
    noLoop();
    if (keyPressed){if (key==' '){
    
//    loop(); 
  println("yo mama");}}

  }
  xl = 5;
  //lives is also pre rendered, like my background graphics
  //begin draw
  lives_graphics.beginDraw();
  lives_graphics.fill(0);
    lives_graphics.noStroke();
  lives_graphics.rect(0,0,124,32);

//this for loop displays life icons based on the current ammount of lives
  for (int i=0; i < lives; i++)
  {
  
   lives_graphics.fill(54,112,40);
    lives_graphics.noStroke();
   lives_graphics.rect(xl, 12, 8, 8);
    lives_graphics.stroke(255);
    lives_graphics.point(xl,12);
    lives_graphics.point(xl + 7,12);
    xl+= 11;
  }
    
   //end set_up and draw image
   lives_graphics.endDraw();



   
}//end of lives


}//

//one class for cars and logs
class car {
  //x position
  int xc;
  //y position
  int yc;
  // x width
  int xw;
  //velocity
  int v;
  //starting x position
  int start;
  //color/type choice
  int ch;
  car(int xpos, int ypos, int xwidth, int velocity, int choice){
    xc= xpos;
    start = xpos;
    yc = ypos;
    xw = xwidth;
    v = velocity;
    ch = choice;
  }

  //width-64,576
  void drive(){
    noStroke();
    if (ch==0){
      fill(209,32,53);
    }
    else {
      fill(121,92,48);

    }
    rect(xc,yc, xw,32);

//controls which way the cars drives and where they go after they go off screen
    if (start == 544){
      if (xc <= (-xw)){ 
        xc = start; 
      } 
      else {
        xc = xc + v;
      }

    }

    else { 
      if (start < 0){
        if (xc >= width - start){ 
          xc = start; 
        } 
        else {
          xc = xc + v;
        }
      }
    }


    if(start > 544) {
      if (xc <= (-start-width)){ 
        xc = start; 
      } 
      else {
        xc = xc + v;
      }
    }


  }
}//

//another debug function for killing the frog
void keyPressed(){
if (key=='k'){frog.lives-=1; println("wut");}

}












