
void setup() 
{

size(800,800);
}
void draw()
{
  

  int count = 80; //play with this to see what you like
  
  float stretch = random(0,6);//mess around with numbers and throw in decimels for fun
  
  int redInt = mouseX; //the higher the number the more pastel you get
  int blueInt = mouseX; //
  int greenInt = mouseY; //
  
  
  
  
  
  background(redInt,blueInt,greenInt);
  
  int n = 30;
  while (n<count*2) {
    ellipseMode(RADIUS); 
    fill(redInt/4,blueInt-3*n,greenInt+n); 
    ellipse(50+stretch*n, 50+n, n, n); 
    n=n+1;
  }
  
  n = 30;
  while (n<count*2) {
    ellipseMode(RADIUS); 
    fill(redInt+n,blueInt,greenInt-n); 
    ellipse(750-stretch*n, 750-n, n, n); 
    n=n+1;
  }
  
  n = 30;
  while (n<count*2) {
    ellipseMode(RADIUS); 
    fill(redInt-5*n,blueInt+n,greenInt); 
    ellipse(750-n, 50+stretch*n, n, n); 
    n=n+1;
  }
  n = 30;
  while (n<count*2) {
    ellipseMode(RADIUS); 
    fill(redInt+n,blueInt+8*n,greenInt+18*n); 
    ellipse(50+n, 750-stretch*n, n, n); 
    n=n+1;
  }
  
  n = 70;
  while (n<count*2) {
    ellipseMode(RADIUS); 
    fill(redInt/4,blueInt-3*n,greenInt+n); 
    ellipse(100+n, 800-stretch*n, n, n); 
    n=n+2;
  }
  n = 70;
  while (n<count*2) {
    ellipseMode(RADIUS); 
    fill(redInt-5*n,blueInt+n,greenInt); 
    ellipse(50+stretch*n, 100+n,  n, n); 
    n=n+2;
  }
  n = 70;
  while (n<count*2) {
    ellipseMode(RADIUS); 
    fill(redInt+n,blueInt,greenInt-n); 
    ellipse( 700-n, 50+stretch*n, n, n); 
    n=n+2;
  }
  n = 70;
  while (n<count*2) {
    ellipseMode(RADIUS); 
     fill(redInt+n,blueInt+8*n,greenInt+18*n); 
    ellipse(800-stretch*n, 700-n, n, n); 
    n=n+2;
  }
}
