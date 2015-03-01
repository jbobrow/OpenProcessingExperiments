
float rWidth, rHeight, rSize, rFactor; 
float inc; 
final static int DIAMOND = 0; 
final static int RECTANGLE = 1; 
int quadMode; 

void setup() {
  size(490, 490); 
  background(255); 
  smooth(); 

  rSize = 70; 
  rWidth = rSize; 
  rHeight = rSize; 
  rFactor = 0.382;
  inc = 0;
  quadMode = DIAMOND;
}

void draw() {

  background(#2049B2);   

  float x, y; 
  int count1, count2; 

  float factor = map(cos(inc), -1, 1, 0, 1); 
  rWidth = lerp(rSize + rSize*rFactor, rSize - rSize*rFactor, factor);
  rHeight = lerp(rSize - rSize*rFactor, rSize + rSize*rFactor, factor);  

  count2 = 0; 
  for (y = 0; y <= height; y += rSize) {
    count1 = (count2%2 == 0) ? 0 : 1; 
    for (x = 0; x <= width; x += rSize) {    
      pushMatrix(); 
      translate(x, y); 
      if (count1%2 == 0) {
        fill(#FFB132);
        if (quadMode == RECTANGLE) {
          quad(-rWidth/2, -rHeight/2, rWidth/2, -rHeight/2, rWidth/2, rHeight/2, -rWidth/2, rHeight/2);
        } else { 
          quad(-rWidth/2, 0, 0, -rHeight/2, rWidth/2, 0, 0, rHeight/2);
        }
      } else {
        fill(#FF4A29);
        if (quadMode == RECTANGLE) {
          quad(-rHeight/2, -rWidth/2, rHeight/2, -rWidth/2, rHeight/2, rWidth/2, -rHeight/2, rWidth/2);
        } else {
          quad(-rHeight/2, 0, 0, -rWidth/2, rHeight/2, 0, 0, rWidth/2);
        }
      }
      popMatrix();
      count1++;
    }
    count2++;
  }

  inc += 0.02;
}

void keyReleased() {
  if (key == 'm' || key == 'M') {
    quadMode = (quadMode == DIAMOND) ? RECTANGLE : DIAMOND;
  }
}



