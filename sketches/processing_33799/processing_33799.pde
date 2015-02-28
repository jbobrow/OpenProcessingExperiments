

int numCirc = 100; // Define what the array is called and the value

float [] circX = new float[numCirc];
float [] circY = new float[numCirc];

float [] velX = new float[numCirc];
float [] velY = new float[numCirc];


void setup() {
  size(400, 400);
  background(229,93,93);
  smooth();
  
  for(int i=0; i<numCirc; i++) {
    circX[i] = random(0,500);
    circY[i] = random(0,500);
    velX[i] = random(1,5);
    velY[i] = random(1,5);
  }
}

void draw() {
  background(113, 0, 0);

  for(int i=0; i<numCirc; i++) {
    fill(255, 0, 0);
    stroke(193, 0, 0);
    strokeWeight(2);
    ellipse(circX[i], circY[i], 30, 25);
//    stroke(245, 50, 50);
    strokeWeight(1);
    ellipse(circX[i], circY[i], 17, 12);
    
    circX[i] = circX[i] + velX[i];
    
    circY[i] = circY[i] + velY[i];

      if((circX[i]>width) || (circX[i]<0)) {
      velX[i] = velX[i] * -1;
      }
      
      if((circY[i]>height) || (circY[i]<0)) {
      velY[i] = velY[i] * -1;
      }
    }
    
// a little friend, white blood cell
  fill(230);
  noStroke();  
  ellipse(mouseX, mouseY, 35, 25);
  fill(200);
  ellipse(mouseX, mouseY, 20, 5);
  noCursor();
}


