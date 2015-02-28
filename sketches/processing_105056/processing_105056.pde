
//declare variables, position of x and y, the size of the ball, and a speed

float xPos;
float yPos;
float radius;
float speedx;
float speedy;
float gravity;
float gravity2;

//setup- declare size and background, and starting positions

void setup() {
  size(500, 500);
  background(255);

  xPos = int(random(10, 490));
  yPos = int(random(50, 50));
  radius = width/10;
  speedx = 4;
  speedy = 4;
  gravity = int(0.1);
  gravity2 = int(0.95);
}
//add the circle and background to stop repeating circles
void draw() {
  background(255);
  speedy++;
  fill(179, 66, 255);
  ellipse(xPos, yPos, radius, radius);

  //if (yPos > height+radius/2) { speedy = speedy * gravity2;}

  //we need ypos to move 7 pixles and 7 pixles etc and keep going, so it needs to equal yPos+speed
  yPos=yPos+speedy;

  speedy = speedy + gravity;


  //need to change the speed to change the ball direction
  if (yPos >= height-radius/2) {
    speedy = -speedy;
    yPos = height-radius/2;
    speedx*=0.9;
  }
  //need to make the ball bounce at the top
  
   if (xPos >= width-radius/2) {
    speedx = -speedx;
    xPos = width-radius/2;
   }
  
  xPos= xPos+speedx;


  if (xPos <= 0+radius/2) {
    speedx = -speedx;
  }
println(speedx);



//  if (yPos >= height-radius/2 && speedy == 0) { 
//    yPos = height - radius/2; 
//    xPos = xPos; 
//    xPos= xPos - speedx; }
//    
//      if (xPos >= width-radius/2 && yPos <= 0 + radius/2) {
//    speedy = -speedy+ gravity;
//    speedy = -speedy; 
//    xPos = -1 +radius/2;
//   }

}


