
import processing.opengl.*;

PVector v1 = new PVector(250,250);
PVector v2 = new PVector(250,250);

float slope;

int move = 20;
boolean running1 = false;
boolean running2 = false;


//== Player and Device Variables==/
float playerX, playerY, playerWidth, playerHeight;
float speed;
float deviceOrbit, deviceRadius, deviceAngle, deviceX, deviceY;


void setup(){
  size( 750, 750, OPENGL );    // use opengl
  frameRate(60);
  playerX      = width/2;
  playerY      = height/2;
  playerWidth  = 50;
  playerHeight = 100;
  speed        = 5;
  deviceOrbit  = 150;
  deviceRadius = 35;
  deviceAngle  = 0;
  deviceX      = deviceOrbit;
  deviceY      = 0;

}

void draw(){
  background(200);
  ellipseMode(CENTER);
  rectMode(CENTER);
  stroke(0);
  
  v1.x = deviceX;
  v1.y = deviceY;
  
  
  //ellipse(v1.x,v1.y ,50,50);
  noFill();
  ellipse(v1.x,v1.y ,200,200);
  fill(255);
  ellipse(v2.x,v2.y,50,50);
  
  slope = (v2.x - v1.x)/(v2.y - v1.y); 
  
// PLAYER CALCULATIONS AND TRANSFORM--------------------------------------------//  
    // figure out the angle  
  deviceAngle = atan2( mouseY-playerY, mouseX-playerX );

  // now back out the calculations to figure out world position
  deviceX = playerX  +  deviceOrbit * cos(deviceAngle);
  deviceY = playerY  +  deviceOrbit * sin(deviceAngle);

  pushMatrix();
    // draw the player
    translate( playerX, playerY, 0 );
    rect( 0, 0, playerWidth, playerHeight );
    
    // now draw the device
    pushMatrix();
      rotateZ( deviceAngle );
      translate( deviceOrbit, 0, 0 );
      ellipse( 0, 0, deviceRadius, deviceRadius );
    popMatrix();
  popMatrix();
  
 //Start checking for points of Contact 
  
  if(mousePressed == true && dist(v1.x,v1.y,v2.x,v2.y) < 100 ){
    if(v2.y -v1.y > 0){ //if above the enemy
      running1 = true;
    }else{  //if below the enemy
      running2 = true;
      }  
   }

  if (running1){
    for(int i = 0; i < move ; i++){
      v2.x += slope;
      v2.y ++;
      i=i;
    }
    running1 = false;
    println("running1");
  }
  if (running2){
   for(int i = 0; i<move ; i++){
      v2.x -= slope/10;
      v2.y --;
      i=i;
    }
    running2 = false;
    println("running2");
  }
  
  noFill();
  ellipse(v1.x,v1.y ,200,200);
  fill(255);
  ellipse(v2.x,v2.y,50,50);
   

}

void keyPressed() {
  if ( key == 'a' ) {
    playerX -= speed;
  } else if ( key == 'd' ) {
    playerX += speed;
  } else if ( key == 'w' ) {
    playerY -= speed;
  } else if ( key == 's' ) {
    playerY += speed;
  } else if( key == 'p'){
    v2.x = 250;
    v2.y = 250;
  }
}
