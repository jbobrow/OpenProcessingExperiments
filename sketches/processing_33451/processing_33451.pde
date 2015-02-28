
int numberBalls=100;
float xpos[]=new float[numberBalls];
float ypos[]=new float[numberBalls];
float xspeed[]=new float[numberBalls];
float yspeed[]=new float[numberBalls];
int xdirection[]=new int [numberBalls];
int ydirection[]=new int[numberBalls];
float colorR[] = new float[numberBalls];
float colorG[] = new float[numberBalls];
float colorB[] = new float[numberBalls];


void setup() {
  size (800, 800);
  for (int i=0; i<numberBalls; i++) {

    xpos[i]= random (width/3);
    ypos[i]= random (height/2);
    xspeed[i]= random(5);
    yspeed[i]= random(5);
    xdirection[i]= 1;
    ydirection[i]= 1;
    colorR[i] = random(255);
    colorG[i] = random(255);
    colorB[i] = random(255);
    
    noStroke();
  }
}

void draw() {
  background(150);

  for (int i=0; i<numberBalls; i++) {
    /*xpos[i]= xspeed[i]+ xpos[i];
     ypos[i]= xspeed[i]+ ypos[i];
     */


    fill( colorR[i],colorG[i] ,colorB[i] );
    ellipse(xpos[i], ypos[i], 40, 40);
    xpos[i] += xspeed[i]*xdirection[i];
    //println(xpos[i] + ", "+ypos[i]);

    ypos[i]+=yspeed[i]*ydirection[i];

    if (xpos[i] >=width || xpos[i]<=0) {
      xdirection[i] *= -1;
    }



    if (ypos[i] >=height || ypos[i]<=0) {
      ydirection[i]*=-1;
     
    } // end if
  } //end for loop
} // end draw loop


