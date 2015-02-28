
float x = 75;           
float y = 75; 
float prevX = x;
float prevY = y;
float theta = random (2*PI);
float AngleChangeInterval = 0;
float step = .1;
float foodx = -10;
float foody = -10;


void setup() {
  size(500, 500,P2D);
  noSmooth();
  strokeWeight(2);
}

void draw() {
 background(255);
 //nofill();
 rect(0,0,width-1,height-1);
 point(foodx,foody);
 
 if (foodx > 0 && foody > 0) {
   if (x < foodx) {
     x = x + 1.5;
   }
   else {
     x = x - 1.5;
   }
   if (y < foody) {
     y = y + 1.5;
   }
   else {
     y = y - 1.5;
   }
 }
 
 if (x > foodx - .5 && x < foodx + .5 && y > foody - .5 && y < foody + .5 ) {
   foodx=-10;
   foody=-10;
 }
 
  theta += random(-AngleChangeInterval,AngleChangeInterval);
  AngleChangeInterval += random(+.1,-.1);
  if (abs(AngleChangeInterval) > 1) {
    AngleChangeInterval = 0;
  }
  
  
  x += step*sin(theta);
  y += step*cos(theta);
  
  if (x > width -1 ) {
    theta = PI;
    x = width-2;
  }
  
  if (x < 1) {
    theta = PI;
    x = 1;
  }
  if (y > height-1) {
    theta = PI/2;
    y = height-2;
    
  }
  if (y < 1) {
    theta = PI/2;
    y = 1;
  }
   
  step += random(-1,1);
  if (step > 4) {
    step = step - 1;
  }
  if (step < -4) {
    step = step + 1;
  } 
  
  
  
  line(x,y,prevX,prevY);  

prevX=x;
prevY=y;

}

void mousePressed() {
  foodx=mouseX;
  foody=mouseY;
}
