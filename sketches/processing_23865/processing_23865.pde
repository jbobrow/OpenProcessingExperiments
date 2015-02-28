
// original code sourced from Sam Wood

int ballCount = 5000;
PImage bg;
PFont font;
float[] x = new float[ballCount];
float[] y = new float[ballCount];
float[] speedX1 = new float[ballCount];
float[] speedX2 = new float[ballCount];
float[] speedY = new float[ballCount];
float[] gravity = new float[ballCount];
float[] damping = new float[ballCount];
float[] friction = new float[ballCount];
float[] radius = new float[ballCount];

void setup() {
  size(733, 478);
  bg = loadImage("017.jpg");
     font = loadFont("HelveticaNeue-Bold-48.vlw"); 
     smooth();
  
  // input variables
  for (int i=0; i<ballCount; i++) { 
    speedX1[i] = random(.1, 2.5);
    speedX2[i] = random(-2.5, -.1);
    speedY[i] = random(-2.0);
    gravity[i] = random(.001, .005);
    radius[i] = random(1, 1.5);
  }
}

// drawing the snowflakes
void draw() {
  background(55);
  image (bg,0,0);
  noStroke();
  smooth();
  
  textFont(font);
  fill(255); //colour
  text("WINTER IS NATURE'S", 125, 230);
  text(" WAY OF SAYING,", 170, 275);
  text("'UP YOURS'.", 230, 320);
  
 
  stroke(135, 190, 230);//(0, 105, 185);
  strokeWeight(1);
  noSmooth();
  fill(195, 220, 240);//(0, 140, 255); 
  move();
  collide();

}

// making the snowflakes fall
void move() {
  for (int i=0; i<ballCount; i++) {
    x[i] += speedX1[i];
    speedY[i] += gravity[i];
    y[i] += speedY[i];

    pushMatrix();
    translate(x[i], y[i]);
    ellipse(0, 0, radius[i]*2, radius[i]*2);
    popMatrix();
  }
  
  for (int j=0; j<ballCount; j++) {
    x[j] += speedX2[j];
    speedY[j] += gravity[j];
    y[j] += speedY[j];

    pushMatrix();
    translate(x[j], y[j]);
    ellipse(733, 0, radius[j]*2, radius[j]*2);
    popMatrix();
  }
  
}

// making snowflakes come to rest on type
// (x[i] > horizontal start && x[i] < horizontal end && y[i] > veritcal && y[i] < vertical) 

void collide() {
  for(int i=0; i<ballCount; i++) {
  //WINTER
    if (x[i] > 140 && x[i] < 300 && y[i] > 195 && y[i] < 200) {
      speedY[i] *= 0;
      gravity[i] *= 0;
      speedX1[i] *= 0;
      speedX2[i] *= 0;
    }
    
    //IS
        if (x[i] > 330 && x[i] < 340 && y[i] > 195 && y[i] < 200) {
      speedY[i] *= 0;
      gravity[i] *= 0;
      speedX1[i] *= 0;
      speedX2[i] *= 0;
    }  
      if (x[i] > 345 && x[i] < 360 && y[i] > 195 && y[i] < 200) {
      speedY[i] *= 0;
      gravity[i] *= 0;
      speedX1[i] *= 0;
      speedX2[i] *= 0;
    }
    
    //NATURE'S
          if (x[i] > 380 && x[i] < 625 && y[i] > 195 && y[i] < 200) {
      speedY[i] *= 0;
      gravity[i] *= 0;
      speedX1[i] *= 0;
      speedX2[i] *= 0;
    }
    

  }
}

void keyReleased() {
if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
}

// timestamp
String timestamp() {
Calendar now = Calendar.getInstance();
return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

