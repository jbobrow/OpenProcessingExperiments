
//It's just a bouncing ball that draws random backgrounds,
//since the background function is absent it won't be redrawn thus leaving a "trace" behind.
float x = 0;
float y = 0;
float xspeed = random(2,5);
float yspeed = 6;

void setup (){
  size (400,400);
}

void draw () {
  smooth ();
  fill (0);
  ellipse (x,y,20,20);
  //The moving logic I'll apply many other times.
  x += xspeed;
  y += yspeed;
  //The bounduaries logic I'll also use for the pong.
  if ( y > height || y < 0 ){
    yspeed= yspeed*-1; }
    
    if ( x > width || x < 0 ){
    xspeed= xspeed*-1; }
}


