
float pMouseX;
float pMouseY; 
float gravity; 
float distance;

int numObj = 40; 
float[] posX = new float[numObj];
float[] posY = new float[numObj];
float[] speedX = new float[numObj];
float[] speedY = new float[numObj];
char[] c = new char[numObj];
float[] size = new float[numObj]; 
float[] hues = new float[numObj]; 
boolean[] isTouched = new boolean[numObj];

void setup() {
  size(600, 600); 
  colorMode(HSB);
  distance = 0; 
  gravity = 0.1;
  
  //assign values for every variable array index
  for ( int i = 0 ; i < numObj; i++ ) { 
    posX[i] = random(width); 
    posY[i] = random(height); 
    size[i] = random(30,80); 
    speedX[i] = 0; 
    speedY[i] = 0; 
    hues[i] = random(255);
    c[i] = char(int(random(65,90)));
    isTouched[i] = false; 
  } 
}

void draw() {
  background(250);
  textAlign(CENTER, CENTER);
  
  //primary for loop to draw/update all the letters
  for ( int i = 0; i < numObj; i++ ) { 
    distance = dist(mouseX, mouseY, posX[i], posY[i]);
    float totalSpeed = abs(speedX[i]) + abs(speedY[i]);
    float newHue = map(totalSpeed, 0, 50, 0, 255);
    fill(hues[i] ,newHue, 200);
    if ( distance < size[i]/2) { 
      //fill(hues[i], 255, 200);  
      if (isTouched[i] == false) {
        speedX[i] = mouseX-pMouseX;
        speedY[i] = mouseY-pMouseY; 
        isTouched[i] = true; 
      }
    } else {
      //fill(hues[i], 0, 200); 
      isTouched[i] = false; 
    } 
    
    //bounce effect check positions and speeds against edges of screen 
    //plus some hacks for cleanup
    if ( posX[i] < 0 + size[i]/2 || posX[i] > width - size[i]/2 ) {
      if (posX[i] < 0 + size[i]/2) {
        posX[i] = 0 + size[i]/2; 
      } else if (posX[i] > width - size[i]/2) {
        posX[i] = width - size[i]/2;
      }
      speedX[i] = -speedX[i]; 
    }
    if (posY[i] < 0 + size[i]/2 || posY[i] > height - size[i]/2 ) {
      if (posY[i] < 0 + size[i]/2) {
        posY[i] = 0 + size[i]/2; 
      } else if (posY[i] > height - size[i]/2) {
        posY[i] = height - size[i]/2;
      }
      speedY[i] = -speedY[i];
    }
    
    if ( speedX[i] > 0) {
      speedX[i] -= 0.1;
    } else if ( speedX[i] < 0 ) {
      speedX[i] += 0.1; 
    }  
    if ( speedX[i] < 0.1 && speedX[i] > -0.1) {
      speedX[i] = 0; 
    } 
    
    if ( speedY[i] > 0 ) {
      speedY[i] -= 0.1;
    } else if ( speedY[i] < 0 ) {
      speedY[i] += 0.1;
    }  
    if ( speedY[i] < 0.1 && speedY[i] > -0.1) {
      speedY[i] = 0; 
    } 
    
    //nested loop for letter to letter comparisons/collisions!
    for ( int j = 0; j < numObj; j++ ) { 
      if ( j != i ) {
        float letterDist = dist(posX[i],posY[i],posX[j],posY[j]);
        float compareSize = (size[i] + size[j])/2;
        if ( letterDist < compareSize ) { 
          posX[i] = posX[i] - speedX[i]*2;
          posY[i] = posY[i] - speedY[i]*2; 
          speedX[i] = speedX[i] * -0.7;
          speedY[i] = speedY[i] * -0.7;
         
          posX[j] = posX[j] - speedX[j]*2; 
          posY[j] = posY[j] - speedY[j]*2;
          speedX[j] = speedX[j] * -0.7;
          speedY[j] = speedY[j] * -0.7; 
        } 
      }
    }
    
    // add gravity to position ( or other acceleration if you want it ) 
    //speedY[i] += gravity;
    
    // add speed to position ( to move the character ) 
    posX[i] += speedX[i];
    posY[i] += speedY[i];
  
    //draw the text at the specified size and position
    textSize(size[i]); 
    text( c[i], posX[i], posY[i]);
  } 

  pMouseX = mouseX;
  pMouseY = mouseY;
}



