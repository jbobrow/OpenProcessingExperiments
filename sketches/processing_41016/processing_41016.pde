
int amountstrings = 10;
int stringsize = 12;

float xp[][] = new float[amountstrings][stringsize];
float yp[][] = new float[amountstrings][stringsize];

float xdisplace[][] = new float[amountstrings][stringsize];
float mySize = 0;

void setup()
{
  background(255);
  size(700,400);
  fill(0);
  smooth();


  for(int i = 0; i < amountstrings; i=i+1) {
    for(int j = 0; j < stringsize; j=j+1) {
      xp[i][j] = 100+50*i;
      yp[i][j] = j*30+20;
      xdisplace[i][j] = 0;
    }
  }
}

void draw()
{
  background(255);

  for(int i = 0; i < amountstrings; i=i+1) {
    for(int j = 0; j < stringsize; j=j+1) {
      
      if(mousePressed == false){
      if(j > 0) {
        if(dist(mouseX,mouseY,xp[i][j],yp[i][j]) < 60) {
          float xdist = (xp[i][j] - mouseX)/20;
          xp[i][j] = xp[i][j] + xdist;
          xdisplace[i][j] = xdisplace[i][j] + xdist;
        }

        xp[i][j] = xp[i][j] - (xdisplace[i][j]/20);  
        xdisplace[i][j] = xdisplace[i][j] - (xdisplace[i][j]/20);
      }
      }
      
      if(j > 0) {
        if(mousePressed) {
          if(dist(mouseX,mouseY,xp[i][j],yp[i][j]) < 2.5 ) {
            //println("Hi X: " + xp[i][j] + " Y: " + yp[i][j]);
            xp[i][j] = mouseX;
          }
        }
        
        line(xp[i][j], yp[i][j], xp[i][j-1], yp[i][j-1]);
      }
      
      ellipse(xp[i][j],yp[i][j],mySize,mySize);
    }
  }
}

