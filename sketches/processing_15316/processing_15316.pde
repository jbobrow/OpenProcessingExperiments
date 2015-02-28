
//Tiffany Dittus
//Altered Code

float bcolor;  

float x, y;  

float speedX, speedY, gravity, damping, friction;  

float radius;  

float fillCol;  

int rectCount = 200;  

float[] xs = new float[rectCount];  

float[] ys = new float[rectCount];  

float[] speedXS = new float[rectCount];  

float[] speedYS = new float[rectCount];  

float[] gravityS = new float[rectCount];  

float[] dampingS = new float[rectCount];  

float[] frictionS = new float[rectCount];  

float[] radiusS = new float[rectCount];  

   

   

void setup(){  

  size(600, 400);  

  speedX = 2;  

  speedY = 10;  
  
  

  damping = 0;  

   friction=75; 

  radius = 50;  

  rectMode(CENTER);  

     

  for (int i=0; i<rectCount; i++) {   

    speedXS[i] = random(-1, 1);  

    gravityS[i] = random(-.25, .25);  

    dampingS[i] = random(0);  

    frictionS[i] = random(0);  

    radiusS[i] = random(6, 60);  

  }  

}  

   

void draw(){  

  colorMode(HSB, 359, 99, 99);  

  background(bcolor, 20, 90);  

  bcolor ();  

  move();  

  collide();  

}  

   

   

void bcolor() {  

  if (bcolor > 359) {  

    bcolor = 40;  

  }   

  if (bcolor >= 0) {  

    bcolor += 5;  

  }  

}  

   

void move() {  

  for (int i=0; i<rectCount; i++) {  

    xs[i] += speedXS[i];  

    speedYS[i] += gravityS[i];  

    ys[i] += speedYS[i];  

   

    pushMatrix();  

    translate(xs[i], ys[i]);  

    rotate(radians(frameCount));  

    smooth();  

    fill(10, 20, 150, 90);  

    ellipse (0, 0, radiusS[i]*2, radiusS[i]*2);  

    popMatrix ();  

  }  

}  

   

void collide() {  

  for (int i=0; i<rectCount; i++) {  

    if (xs[i] > width-radiusS[i]*2) {  

      xs[i] = width-radiusS[i]*2;  

      speedXS[i] *= -1;  

    }   

    else if (xs[i] < radiusS[i]*2) {  

      xs[i] = radiusS[i]*2;  

      speedXS[i] *= -10;  

    }  

   

    if (ys[i] > height-radiusS[i]*2) {  

      ys[i] = height-radiusS[i]*1;  

      speedYS[i] *= 2;  

    }   

    else if (ys[i] < radiusS[i]*2) {  

      ys[i] = radiusS[i]*2;  

      speedYS[i] *= 5;  

    }  

  }  

}
                
                
