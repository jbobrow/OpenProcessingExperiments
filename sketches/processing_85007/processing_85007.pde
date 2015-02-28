
float y =0; // set position of y
float x= 0; // set position of x
float speed = 4; //set speed
float gravity = 0;



void setup () {
size (600,500); // set the size of the window
smooth (); // draw wth smooth edges
frameRate (30); // set framrate

}

    void draw (){
      if (mousePressed ) { // if the mouse is pressed the back ground will change colour
        background (203,33,33);
      } else {
   background(6,134,211);
    } 
   
     y = y +speed; // make the ball move vertically
     speed = speed + gravity;
        if ((y > height) || (y<0)){ // when the ball reched the bottom of the screen it will go move back to the top.
        speed =speed *-1;
  }
      
    stroke (0);
    fill (162,255,77); // fill colour of the ball
    ellipse (300,y,32,32); // set te size and position of the ball
    
    y = y + speed; // make the ball move vertically
    speed = speed + gravity ;
    if (( y >height) || (y <0)) { // when the ball reched the bottom of the screen it will go move back to the top.
      speed = speed * -1 ;
    }
    stroke (0);
    fill (242,18,255);// fill colour of the ball
    ellipse (200,y,70,70);// set the size and position of the ball
    
   y=y + speed; // make the ball move vertically
   speed= speed + gravity;
   if ((y> height) || (y<0)) {// when the ball reched the bottom of the screen it will go move back to the top.
     speed=speed * -1;
   }
    stroke(0);
   fill (15,240,208);// fill colour of the ball
   ellipse (400,y,70,70);// set the size and position of the ball
    
     x= x + speed; //make the ball move horizontally
    speed = speed + gravity;
    if (( x > width) || (x <0)){ // when the ball reaches the edge of the screen it will move back to the other side.
    speed = speed *-1;
    }
    
    stroke (0);
  fill( 140,26,216);// fill colour of the ball
  ellipse (x,200,50,50);// set the size and position of the ball
  
  x = x+ speed;// make the ball move horizontally
  speed = speed - gravity ;
  if (( x > width) || (x <0)) { // when the ball reaches the edge of the screen it will move back to the other side
    speed = speed * -1;
  }

stroke (0);
fill (248,255,64);// fill colour of the ball
ellipse (x,400, 80,80);// set the size and position of the ball

x = x + speed; // make the ball move horizontally
speed = speed - gravity;
if (( x>width) || (x <0)) { // when the ball reaches the edge of the screen it will move back to the other side
  speed = speed * -1;
  
}
 stroke (0);
 fill (240,139,15);// fill colour of the ball
 ellipse (x,100,70,70);// set the size and position of the ball

noStroke ();
    fill (173,24,24);// fill colour of the ball
    ellipse (mouseX,mouseY, 100,100);// make the ball follow the mouse and set the size of the ball.
    
}
