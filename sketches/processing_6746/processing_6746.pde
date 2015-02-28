
void setup(){
  size(700,700);
  smooth();
  x=-15;
  y=-5;
  frameRate(60);
  x=width/2;
  y=height/2;
  background(255);

}
float x,y;

float velocity_x;
float velocity_y;
float velo_x;
float velo_y;
float speed;
float rot;

boolean pause=false;

//// this is how fast it can travel
float max_speed=2;

int lastCheck=0; 

void draw(){

  if (!pause){
    // timing control.. MATH
    while ((millis()-lastCheck)>=10){ 
      lastCheck+=10; 


      ///// velocity controls
      if (w){
        velo_x = (cos(radians(rot)) * speed);
        velo_y = (sin(radians(rot)) * speed);
      }
      velocity_y+=velo_y;
      velocity_x+=velo_x;
      velocity_y=constrain(velocity_y,-1*max_speed,max_speed);
      velocity_x=constrain(velocity_x,-1*max_speed,max_speed);
      x=x+velocity_x;
      y=y+velocity_y;
      speed-=1;
      if (speed>=6){
        speed=5;
      } 
      if (speed<=0){
        speed=0;
      }
      //// key board interface
      if (key_a){
        rot-=2;
      }
      if (key_d){
        rot+=2;
      }
      if (key_w){
        speed+=.1; 
        w=true;
      }

println(velocity_x);
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


    }

    stroke(255);
    fill(0);
    // timing control .. Render
    translate(x,y);
    rotate(radians(rot));
    rect(-15,-5,30,10);
  }
}
boolean w=false;   //// is this the right way to do this?
/// this is saying that if the object is not curently acceling it can rotate
/// freely ..... still seems wrong
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
    w=true;
  }

  if ((key=='s')||(key=='S')){
    key_s=true;
    w=true;
  }


  //////////////////////////////////JERRY RIGGED FUNCTIONALITY


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
    w=false;
  }

  if ((key=='s')||(key=='S')){
    key_s=false;
    w=false;
  }
}
////////////////////////////////
















