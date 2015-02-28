
class breath {
  float rad, rad2, rad3;
  float oscillation, oscillation2, oscillation3;
  float xPos, yPos;
//  float ySpeed;

  breath(float tempX, float tempY){
    xPos = tempX;
    yPos = tempY;

  }

  void display() {
    rad = frameCount * 0.1;
    oscillation = sin(rad); //sin of anything -1 and 1 
    float oscMapped = map(oscillation, -1, 1, 0, 0.6);
    background(255);
    noStroke();
    fill(207, 255, 15,60);
    ellipse(xPos, yPos, 60*oscMapped, 60*oscMapped);

    rad2 = frameCount * 0.05;
    oscillation2 = sin(rad2);
    float oscMapped2 = map(oscillation2, -1, 1, 0, 0.8);
    noStroke();
    fill(255, 100, 23,60);
    ellipse(xPos, yPos, 60*oscMapped2, 60*oscMapped2);

    rad3 = frameCount * 0.05;
    oscillation3 = sin(rad3);
    float oscMapped3 = map(oscillation3, -1, 1, 0, 1);
    noStroke();
    fill(255, 15, 111, 60);
    ellipse(xPos, yPos, 100*oscMapped2, 100*oscMapped2);

    //solid circle   
    fill(random(0,256), random(0,256), random(0,256),80);
    ellipse(xPos, yPos, 15, 15);
  }
  
  }


