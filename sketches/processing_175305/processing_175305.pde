
//Global Var

int numofstars = 50;
float accunit = .1;
Star[] star_field = new Star[numofstars];
StarShip Ship1;


// Set up
void setup(){
  size(800,800);
  Ship1 = new StarShip();
  fill_star_field();
  draw_background();
  
}

// **********************************************************************************************
// Draw function
void draw(){
  draw_background();

  Ship1.Update();
  Ship1.Draw_Ship();
    
}

          
// ****************************************************************************************
// Fills and set Star array, star_field.
void fill_star_field(){
 for(int i=0; i < star_field.length; i++){
  star_field[i] = new Star(); 
 }
 
}

// Draw a stary background  
void draw_background(){
  int starsize = 2;
  
  background(15);
  
  for(int i=0; i<star_field.length; i++){
    fill(star_field[i].starcolor);
    rect(star_field[i].location.x, star_field[i].location.y, starsize, starsize);
    star_field[i].starcolor = color(random(150,255));
  }  

}  

// **********************************************************************************************
// Draws the spaceship.  Input is the cordinates of the ship.
void draw_space_ship(int xpos,int ypos){
  color craftcolor = color(255,10,0);
  int craftsize = 8;
  fill(craftcolor);
  
  rect(xpos,ypos,craftsize,craftsize);
}

// ***********************************************************************************************
// Returns the new ships x postion, inputs the currnet x speed and postion.
int caculate_xpos_ship(int x, int vx){
  return(vx+x);
}

// ***********************************************************************************************
//Returns the new ships y postion, inputs the current y speed and postion.
int caculate_ypos_ship(int y, int vy){
  return(vy+y);
}



// ***********************************************************************************************
//Key Press Code
void keyPressed(){
   if (key == CODED) {
   // Up & Down arrow.
     if (keyCode == UP) {
      Ship1.acceleration.y -= accunit;
      Ship1.Draw_Thrust(0,1);
    } else if (keyCode == DOWN) {
      Ship1.acceleration.y += accunit;
      Ship1.Draw_Thrust(0,-1);
    } 
   // Left & Right arrow.
     if (keyCode == RIGHT) {
      Ship1.acceleration.x += accunit;
      Ship1.Draw_Thrust(-1,0);
     } else if (keyCode == LEFT) {
      Ship1.acceleration.x -= accunit;
      Ship1.Draw_Thrust(1,0);
     } 
   }
   if(key=='n'){
     Ship1.Reset_Ship();
   }
}

void keyReleased(){
  Ship1.Zero_Acc();
}
  
  
// ***********************************************************************************************  
//Classes

class Star{
  
  color starcolor;
  PVector location;
  
  Star(){
    location = new PVector(random(width),random(height));
    starcolor = color(random(200,250));
  }
  
}

class StarShip{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  color shipcolor = color(255,10,0);
  int shipsize = 8;
  
  StarShip(){
    Reset_Ship();
  }
  
  void Draw_Ship(){
    fill(shipcolor);
    rect(location.x,location.y,shipsize,shipsize);
    
  }
  
  void Update(){
    //Motion Update
    velocity.add(acceleration);
    location.add(velocity);
  }
 
 
 // Resets the Ship to Starting Condtions. 
  void Reset_Ship(){
    location = new PVector(width/2,height/2);
    velocity = new PVector(random(-2,2),random(-2,2));
    acceleration = new PVector(0,0);
  }
  
  
  // Zeros out the accleration.
  void Zero_Acc(){  
    acceleration.x = 0;
    acceleration.y = 0;
  }
  
  void Draw_Thrust(int x,int y){
      fill(250,250,0);  //Yellow
      ellipse(location.x+shipsize/2+x*shipsize, location.y+shipsize/2+y*shipsize,4,4);
  }
}


