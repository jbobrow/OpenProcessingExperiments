
int numPos = 200;
float radius;
float speed;
color cor;
int [] x = new int [numPos];
int [] y = new int [numPos];
char letter = 'a'; 


void setup () {
  size (600, 600);
  background (0); 
  int n = 25;
  speed = 5;

  cor = (#E80C7A);
}

void draw () {
  noStroke();
  fill (cor);
  alpha (50);
  radius = random (5);
  // applied array to my previous sketch


  for (int i = 0; i<numPos-1; i++) { 
    x[i] = x [i+1];
    y[i] = y [i+1];
  }

  for (int i=0; i<numPos; i++) {

    ellipse (x[i], y[i], radius, radius);
    x [numPos - 1] = mouseX;
    y [numPos - 1] = mouseY;
  

    /*get's the ball running in a random movement*/

    x [i] = int( x[i] + (random (-speed, speed)));
    y [i] = int (y [i] + (random (-speed, speed)));


    /*this "if" prevents the ball to go out of the screen,
     making it to return in the middle of the screen*/

    if (x[i]> width || x[i]< 0) {
      x[i] = width/2;
    } else if ( y[i]>height || y[i]<0 ) {
      y [i]= height/2;
    }
  }

  if (mousePressed) {
    background (0);
  }
}

void keyPressed () {
  switch (letter) {
  case 'a': 
    radius *= 1.2;  
    cor = (#1AB2AC);
    speed+=2;
  case 's': 
    radius *= 0.5;
    cor = (#E89E0C);
  case 'd':
    cor = (#AC43E8); 
    speed*=0.5;
  }
}
/*keyPressed identfies which key is pressed and then gives
 new variable values for color, size and/or speed*/




