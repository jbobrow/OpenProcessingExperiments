
//audio variables
//Maxim maxim;
//AudioPlayer collideSound;
 
// the start point of the catapult 
PVector startPoint;
PVector gulliPos;

float gulli_distance = 0.0;
PImage gulliImage; //, dandaImage;
PImage WelcomeImage;
PImage img, dandaImage, instructImage;
boolean gulli_valid_click = false;
boolean first_click = false;
boolean second_click = false;
int choice = 0; 
int lives = 3;

//computational variables
float gulli_gravity=0.01;
PVector gulli_velocity;

float gulli_rotAngle=5;

//bounce variables
float bouncePoint;
float bounce_speed=2;
float dirY;

//ground collision variables
float mouse_click_x;
float mouse_click_y;

// in case of miss, or if it hits screen constraints or if all lives are exhausted, reset the values.
void resetGulliValues()
{
       bouncePoint = startPoint.y;
       gulliPos.x = startPoint.x;
       gulliPos.y = startPoint.y;
       bounce_speed = 2;
       dirY = 1;
       first_click = false;
       second_click = false;
       gulli_valid_click = false;
       gulli_velocity.x = random(3,6);
       gulli_velocity.y = random(-4,-5);  //trying to randomize velocity to demonstrate distance travelled by gulli on each hit
}

void setup()
{
  size(680, 480);
  frameRate(60);
  //img = loadImage("background.png");
  img = loadImage("park.png");
  WelcomeImage = loadImage("Welcome.png");
  gulliImage = loadImage("gulli.png");
  dandaImage = loadImage("danda_pos1.png");
  instructImage = loadImage("Instructions.png");
  //instructImage = loadImage("Welcome_Instructions_new.png");
  
  startPoint = new PVector(100, (height-50),0);
  gulliPos = new PVector(100, (height-50),0);
 

  gulli_velocity = new PVector(random(3,6), -5,0);  //trying to randomize velocity to demonstrate distance travelled by gulli on each hit
  
  mouse_click_x = startPoint.x;
  mouse_click_y = startPoint.y;
  
      
  imageMode(CENTER); 

  // bounce setup
  bouncePoint = startPoint.y;
  dirY = 1;
             
  // audio setup
  //maxim = new Maxim(this);
  //collideSound = maxim.loadFile("crate2.wav");

  //collideSound.setLooping(false);
  //collideSound.volume(1.0);
  
}

void draw()
{
  image(img, width/2, height/2, width, height);

   //if y co-ord is greater than height/3, then restrict it to height/3, similarly restrict to width*/4
   if ((gulliPos.x >= (width*5/6)) || ((gulliPos.y <= (height/3)) || (gulliPos.y >= height))) {
        //println("draw:if stmt, gulliPos.x:"+gulliPos.x+", gulliPos.y:"+gulliPos.y+", width: "+width*5/6+", width*3/4:"+(width*3/4)+", height/3:"+(height/3)+", height:"+height);
        resetGulliValues();
   }

  
  switch(choice) {
    case 0: //Welcome page
      
        //image(WelcomeImage, width/2, height/2, 300, 150);
        image(WelcomeImage, width/2, height/2, width/2, height/3);
        
        
        //if (mousePressed && ((mouseX <= 360 && mouseX >= 285) && (mouseY >= 345 && mouseY <= 365))) {
        if (mousePressed && (mouseX <= 327 && mouseX >= 230 && mouseY >= 270 && mouseY <= 295)) {
            choice = 2;
            
        }

       // if (mousePressed && ((mouseX <= 515 && mouseX >= 285) && (mouseY >= 378 && mouseY <= 400))) {
        if (mousePressed && (mouseX <= 365 && mouseX >= 135 && mouseY >= 295 && mouseY <= 320)) {
            choice = 1;
         }
        break;
     case 1: // Instructions page
     
            background(150);
            image(instructImage, width/2, height/2, height, width/2); //verify this size

            if (mousePressed && ((mouseX <= 148 && mouseX >= 95) && (mouseY >= 355  && mouseY <= 417)) ) {
              choice = 0;
            }
       break;
      case 2:
      
        //Game play
      // check if all lives are over, then reset to welcome screen
     if(lives <= 0) {
         gulli_distance = 0.0;
         choice = 0; //reset to new game

         lives = 3;
         resetGulliValues();  //verify this
         println("all lives exhausted");
       break;
      }
      
      //computing logic
       stroke(0);
       fill(0);
       text("Score: "+(int)gulli_distance+" meters", 20, 20);
       text("Lives: "+lives, 20, 40);

   
        PVector mouseVec = new PVector(mouseX, mouseY, 0);
        PVector cur_gulliPos = new PVector(gulliPos.x, bouncePoint, 0);
        float vec_dist = PVector.dist(mouseVec, cur_gulliPos);
       //play sound when gulli and danda are near each other
       //if(mousePressed && (dist(mouseX, mouseY, gulliPos.x, bouncePoint) < gulliImage.width/2)) {
         if(mousePressed && (vec_dist < (float)gulliImage.width/2)) {
         
           gulli_valid_click = true;
           // play the audio
           //  if (first_click || second_click) {
           //collideSound.cue(0);
           //collideSound.play();
           //}
        }
       
        //do the bounce
        //this is the first click, bounce the ball vertically up, until you get a second click
        if(first_click && (!second_click)) {
            if ((bouncePoint == (float)(startPoint.y - bounce_speed) ) && (dirY < 0)) {
                //limit the vertical bounce to single bounce. If the user has missed striking it, it is considered as a miss.
                dirY = 0;
                first_click = false;
                second_click = false;

                //decrease life by 1
                lives -=1;
                //let it bounce only once after first click
               

              } // single bounce on first click check

              image(gulliImage, startPoint.x, bouncePoint, gulliImage.width, gulliImage.height);

              bouncePoint += -dirY*bounce_speed;
              // bounce veritcally up only till you reach half the height of the screen, then descend down
              if((bouncePoint >= startPoint.y) || (bouncePoint <= (height/2))) {
                  dirY *= -1;
               } //descend to the initial gulli position check

           } else if(first_click && (second_click == true)) {

               // this is the time to strike the gulli to dispense it further to right of the screen

               // spin angle for gulli to rotate around itself
                gulli_rotAngle +=5;

                // computation to move gulli to the right side of the screen
                gulliPos.x += gulli_velocity.x;
                gulli_velocity.y += gulli_gravity;
                gulliPos.y += gulli_velocity.y;

                gulliPos.y = mouse_click_y;
                pushMatrix();
                translate(gulliPos.x, gulliPos.y);
                rotate(radians(gulli_rotAngle)); //sin(gulliAngle-90)));
                image(gulliImage, 0, 0, gulliImage.width, gulliImage.height);
                popMatrix();

                //since this is a hit, increment distance
                float dist_current_game = (gulliPos.x - startPoint.x)/1000;
                gulli_distance += dist_current_game;
                //text("Distance : "+dist_current_game, 20, 60);

                //reset first_click and second_click to false
                //first_click = false;
                //second_click = false;
                //dirY = 1;
              } else {
                  // this is neither first click nor second click. Gulli should be in its default position on ground
                  image(gulliImage, gulliPos.x, gulliPos.y, gulliImage.width, gulliImage.height);
                  bouncePoint = startPoint.y;
                  dirY = 1;
                  //first_click = false;
                  //second_click = false;
                  gulli_velocity.x = random(1,3);
                  gulli_velocity.y = random(-4,-5);  //trying to randomize velocity to demonstrate distance travelled by gulli on each hit

            } // done with drawing gulli in first click, second click, no click

            image(dandaImage, mouseX, mouseY, dandaImage.width, dandaImage.height);
        break;
        
  }
  
}

void mouseClicked()
{
      // check if danda position is at initial gulli position. i.e. check if there is collision between danda and gulli.

    //if(choice == 2 && (dist(mouseX, mouseY, startPoint.x, bouncePoint) < gulliImage.width/2)) {
     
     PVector mouse_vec = new PVector(mouseX, mouseY);
     PVector beginPt = new PVector(startPoint.x, bouncePoint);
     float vec_dist = PVector.dist(mouse_vec, beginPt);
      if(choice == 2 && (vec_dist < (float)gulliImage.width/2)) {

        //check if this is the second click near gulli, so set second_click to true
        if (first_click && (!second_click)) {
            mouse_click_x = mouseX;
            mouse_click_y = mouseY;
            second_click = !second_click;
        }  else {
              //both first click and second click are true or either one of them is true
              first_click = !first_click;
        } //second click check

        gulli_valid_click = true;
  } else {
    //not a valid click to start the game
    //do not start the game yet
    gulli_valid_click = false;

  } //check for starting the game and to check if second click is true so as to sweet the gulli
}


