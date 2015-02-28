
// switch to turn grid on/off
boolean gridOn = false;   // start "off"

void setup(){
  
  size(800,800);
  smooth();
  //frameRate(2);
  
}

// for recoil
float recoilOffset = 0;  // modified position offset to add to sprite position
boolean bFiring = false;
int recoilThreshold;  //when recoilOffset gets below this number, firing = false
float recoilVelocityDefault = 12;      // veolcity; the speed at which the recoil adds
float recoilVelocity = recoilVelocityDefault;
float recoilAcceleration = -2;  // "gravity"?

void Draw_Creature(int x, int y, float drawSize){//, int counter){
  
  //set size of the head to draw
  //scale(drawSize);
  //counter scale()'s change in position by multiplying its location by the counter. Counter = i in the loop
  //translate(x*counter, y*counter);
  
  // headshape
  fill(66,116,65);

  triangle(x-200,y+100,x+200,y-75,x+175,y+75);
  
  //cheeks
  fill(79,116,140);
  rect(x+100, y+0, 150, 50);
  rect(x+50, y+50, 150, 50);  
  
  //eye
  fill(x, y, 255);
  ellipse(x+75, y+25, 40,40);
  //pupil
  fill(0);
  ellipse(x+67, y+25, 20,30);
  
  //Whisker 1
  line(x -112,y  +74,x  -125,y  +110);
  //whisker 2
  line(x -130,y  +80,x  -157,y  +99);
  
  
  fill(110,45,45);
  //top plate
  quad(x-175, y+80,x+75,y-75,x+140,y-25, x-175, y+90);
  //back plate (counter-clockwise)
  quad(x+100, y-75, x+160, y-10, x+260, y-10, x+200, y-90);
  
}

  int localX = 200;
  int localY = 200;
  float drawSize;
void draw(){

  background(155); // clear background
  

  
  //localX = mouseX;
  //localY = mouseY;
  
  // to drag the critter around!  
  if(mousePressed && mouseButton == LEFT){
    localX = mouseX;
    localY = mouseY;
  }
  
  // to fire a projectile!
  if(mousePressed && mouseButton == RIGHT){
    bFiring = true;
    // set the threshold
    recoilThreshold = localX;
    
  }
  
  // for debug
  fill(255);
  println("Mouse X:" + mouseX + " Mouse Y:" +mouseY + " recoilOffset: " + recoilOffset + " bFiring: " + bFiring + " recoilVelocity: " + recoilVelocity + " localX: " + localX);
  
  
    //calculate recoil to add to the position, if firing.

    if(bFiring == true){
      //add speed
      recoilOffset = recoilOffset + recoilVelocity;
      //add acceleration
      recoilVelocity = recoilVelocity + recoilAcceleration;
      
    }
    

    //recoil reset
    if(bFiring == true && recoilOffset + localX <= recoilThreshold){
      recoilOffset = 0;
      bFiring = false;
      recoilVelocity = recoilVelocityDefault;
      
    }
  
  
  
  int i;
  drawSize = 1;
  for(i=-1; i<2; i++){
    
    

    
    // draw it and its friends
    Draw_Creature(localX + (i*200) + int(recoilOffset), localY, drawSize);
    drawSize = drawSize/2;
  
    //Draw_Creature(localX, localY); 
    
  }

  // draw the grid
  if ( gridOn ) {
    draw_grid();
  }


  //graph
  int gridX, gridY;
  gridY = 0;
  //for(gridX=0; gridX *10 < width; gridX++){
  //  line(gridX*10, gridY, width, gridY);
  //  gridY = gridY + 10;
  //line(0,400, width, 400);  
  //line(400,0, height, 0);  
    
  //}

}

//
// keyTyped() is called once every time a key is pressed
//     ignoring CTRL, SHIFT, ALT
void keyTyped() {
  if ( key == 'g' ) {
    gridOn = !gridOn;
  } 
  //if ( key == ' '){
  //  bFiring = true;
  //}
}

//
// draw_grid() is used to overlay a grid
//
void draw_grid() {
  // grid parameters
  color g_red   = color( 255,   0,   0 );
  color g_blue  = color(   0,   0, 255 );
  float g_w1    = 1;      // stroke weight for thin line
  float g_w2    = 2.5;    // stroke weight for thicker line
  int span      = 800;    // how far each way from the local origin
  int increment = 25;     // how close the lines are
                          // note: should be a factor of 100
  // draw main grid
  strokeWeight( g_w1 );
  for ( int i=-span; i<=span; i+=increment ) {
    if ( (i%100) == 0 ) {
      stroke( g_red, 192 );
    } else {
      stroke( g_red, 64 );
    }
    line( localX-i, localY-span, localX-i, localY+span );

    if ( (i%100) == 0 ) {
      stroke( g_blue, 192 );
    } else {
      stroke( g_blue, 64 );
    }
    line( localX-span, localY-i, localX+span, localY-i );
  }
  
  // draw axes
  strokeWeight( g_w2 );
  stroke( g_red );
  line( 0, localY, width, localY );  
  stroke( g_blue );
  line( localX, 0, localX, height );
}


