
void setup(){
  size(700,700);
  smooth();
  frameRate(60);
  x=width/2;
  y=height/2;
  background(255);

}
float x,y;  //position

boolean pause=false;

float acceleration=.1;

float velocity_x;        //travling speed
float velocity_y;       //
float power;           // thruster power
float rot;            // direction
float momentum_x;    //left over speed? :0
float momentum_y;   //

boolean thrust=false;    //is objects thruster on


//// this is how fast it can travel
float maximum_momentum=3;
float max_power=.1;

int lastCheck=0; 

void draw(){
   background(255);
  if (!pause){
    // timing control.. MATH
    // :(  this dosnt really work with a drawing program skipping frames
    // is worse then the whole thing lagging this isnt right at all
    while ((millis()-lastCheck)>=10){ 
      lastCheck+=10; 


      ///////////////////// Movement Physics
      ///  works like it should but Im not sure this is the best way to
      ///  write this (everything is definetly miss labled)

      if (thrust){
        momentum_x = (cos(radians(rot)) * power);
        momentum_y = (sin(radians(rot)) * power);
        velocity_y+=momentum_y;
        velocity_x+=momentum_x; 
      }

      velocity_y=constrain(velocity_y,-1*maximum_momentum,maximum_momentum);
      velocity_x=constrain(velocity_x,-1*maximum_momentum,maximum_momentum);

      if(velocity_x>0){
        velocity_x-=.01;
      }

      if(velocity_x<0){
        velocity_x+=.01;
      }

      if(velocity_y>0){
        velocity_y-=.01;
      }

      if(velocity_y<0){
        velocity_y+=.01;
      }
      /*  dosnt work right was supposed to lock numbers in so there wasnt any drift
       //  when object was supposed to be stopped
       if ((velocity_x<.1)&&(velocity_x>-.1)){
       velocity_x=0;
       }
       
       if ((velocity_y<.1)&&(velocity_y>-.1)){
       velocity_y=0;
       }
       */


      x=x+velocity_x;
      y=y+velocity_y;


      power=constrain(power,max_power*-1  ,max_power);
      //////////////////////////////////////////////////





      ///////////////////// key board input
      if (key_a){
        rot-=2;
      }
      if (key_d){
        rot+=2;
      }
      if (key_w){
        power+=acceleration; 
        thrust=true;
      }

      if (key_s){
        power-=acceleration; 
        thrust=true;
      }
      /////////////////////////////////////////////////////////
      /// this stops object from going off screen
      if (x<=0){
        x=x+width ;
      }
      if (x>=width){
        x=x-width ;
      }

      if (y<=0){
        y=y+height ;
      }
      if (y>=height ){
        y=y-height ;
      }
      ////////////////////////////////////////////////////////

    }

    stroke(255);
    fill(0);


    translate(x,y);
    rotate(radians(rot));
    rect(-15,-5,30,10);


  }
}




///////////////////////////just the controls
boolean key_a=false;
boolean key_d=false;
boolean key_w=false;
boolean key_s=false;
void keyPressed(){
  if((key=='a')||(key=='A')) 
  {
    key_a=true;
  }
  if((key=='d')||(key=='D')) 
  {
    key_d=true;
  }
  if ((key=='w')||(key=='W')){
    key_w=true;
    thrust=true;
  }

  if ((key=='s')||(key=='S')){
    key_s=true;
    thrust=true;
  }


  //////////////////////////////////JERRY RIGGED FUNCTIONALITY


/*
  if ((key=='p')||(key=='P')){ 
    if (pause==false){ 
      pause=true; 
      noLoop(); 
    } 
    else 
    { 
      pause=false; 
      loop(); 
      lastCheck=millis(); 
    } 
  }  

  //// THERE HAS TO BE A REASON THIS IS A BAD WAY TO DO THIS

  if ((key =='r')||(key =='R')){ 
    setup(); 
    loop();  
    lastCheck=millis();      
  }     

  //////////SAVE IMAGE
  if ((key =='x')||(key =='X')){
    saveFrame();
  }




  //// blur the current image
  if ((key =='b')||(key =='B')){
    loop();
    filter(BLUR,1);
  }
*/
}



void keyReleased(){
  if(key=='a') 
  {
    key_a=false;
  }
  if(key=='d') 
  {
    key_d=false;
  }
  if (key=='w'){
    key_w=false;
    thrust=false;
  }

  if ((key=='s')||(key=='S')){
    key_s=false;
    thrust=false;
  }
}
////////////////////////////////




































