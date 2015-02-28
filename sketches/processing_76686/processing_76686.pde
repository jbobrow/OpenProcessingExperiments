
int count = 260;

float[] color1;
float[] color2;
float[] color3;

float[] xpos;
float[] ypos;

float[] speedX;
float[] speedY;

float[] rad;

void setup(){

  size(1000, 500);
  background(0);
  smooth();
  noCursor();

  xpos = new float[count];
  ypos = new float[count];
  speedX = new float[count];
  speedY = new float[count];
  color1 = new float[count];
  color2 = new float[count];
  color3 = new float[count];
  rad = new float[count];

  int n = 0;
  while(n < count){

    color1[n] = random(50, 100); //random(255);
    color2[n] = random(255); //random(255);
    color3[n] = random(255); //random(50, 100);
    xpos[n] = random(1000);
    ypos[n] = random(500);
    speedX[n] = random(-5, 5);
    speedY[n] = random(-5, 5);
    rad[n] = 5;

    n++;
  }
}

void draw(){

  background(0);
  noStroke();
  int i = 0;
  while(i < count){
    if(xpos[i] < rad[i]/2){
      speedX[i] = -speedX[i];
      xpos[i] = rad[i]/2;
    } else if(xpos[i] > width - rad[i]/2) {
      speedX[i] = -speedX[i];
      xpos[i] = width - rad[i]/2;
    }
    
    if(ypos[i] < rad[i]/2) {
      speedY[i] = -speedY[i];
      ypos[i] = rad[i]/2;
    }else if(ypos[i] > height - rad[i]/2){
      speedY[i] = -speedY[i];
      ypos[i] = height - rad[i]/2;
    }

    xpos[i] = xpos[i] + speedX[i];
    ypos[i] = ypos[i] + speedY[i];
    fill(color1[i], color2[i], color3[i], 100);
    ellipse(xpos[i], ypos[i], rad[i], rad[i]);

    if((mousePressed == true) && (dist(mouseX, mouseY, xpos[i] , ypos[i]) < 40)){
      if(rad[i] < 80){
         rad[i] += 4;
         speedX[i] = 0;
         speedY[i] = 0;
      }
    }
    i++; 
  }
  
  int j = 0;
  while(j < count){
    int k = 0;
    while(k < count){
      if(rad[j]>5){
        if(dist(xpos[j] , ypos[j], xpos[k] , ypos[k]) < rad[j]/2){
          if(rad[k] < 80){
            rad[k] += 4;
            speedX[k] = 0;
            speedY[k] = 0;
          }
          if(rad[k] > 79){
            rad[k] = 5;
            speedX[k] = random(-5, 5);
            speedY[k] = random(-5, 5);
            xpos[k] = random(10, 990);
            ypos[k] = random(10, 490);
          }
        }
      }
      k++;
    }
    j++;
  }

  if (mousePressed == true) {
    fill(255, 255, 255, 50);
    ellipse(mouseX, mouseY, 80, 80);
  }else{
    fill(255);
    ellipse(mouseX, mouseY, 5, 5);
  }
  
}

