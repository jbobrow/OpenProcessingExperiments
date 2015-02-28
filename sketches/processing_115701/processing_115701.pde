
Cloud myCloud1;
Cloud myCloud2;
Cloud [] myCloud = new Cloud[500];


void setup() {
  size(600, 600);
  // Filled up our array with Cloud objects
  for (int f = 0; f<myCloud.length; f++) {
    myCloud[f] = new Cloud(color(random(255), random(255), random(255)), random(width), random(height), random(-5, -1));
}
}

void draw() {
  background (100, 200, 255);
  // Go through each Cloud
  for (int f = 0; f< myCloud.length; f++) {
    // For this Cloud, compare me to all the other Cloud
    for (int g = 0; g < myCloud.length; g++) {
      // If the Cloud I'm comparing dist for does not equal the Cloud, I'm comparing dist to
      if (f!=g) {
        if (myCloud[f].isNear(myCloud[g]))  {
          myCloud[f].c = myCloud[g].c;
          myCloud[f].y = myCloud[g].y;
        }
      }
    }
    // Display this Cloud
    myCloud[f].display();

    // Move this Cloud
    myCloud[f].shimmy();
  }
  fill(40, 60, 180, 30);
  ellipse(mouseX, mouseY, 20, 20);
}




class Cloud {
  color c;
  float x;
  float y;
  float SpeedY;

  //Cloud constructor
  Cloud(color tempC, float tempX, float tempY, float tempSpeedY) {
    //the Cloud
    c=tempC;
    x=tempX;
    y=tempY;
  SpeedY=tempSpeedY;
  }

  void display() {
    noStroke();
    fill(c);
    ellipse(x,y, 40, 40);
    if (mouseX> x && mouseX< x+40 && mouseY> y && mouseY< y+40){
      fill(255, 0, 0);
    rect(0, 0, 700, 700);
    fill(255, 255, 0);
    }
  }

  // Move the Cloud!
  void shimmy() {
    y+=SpeedY;
    if (y<-200) {
      y=height+100;
    }
    if (keyPressed==true){
      y+=-SpeedY;
    }
  }
    
  
  
  // Check to see if this Cloud is near some other Cloud
  boolean isNear(Cloud otherCloud) {
    float distance = dist(x, y, otherCloud.x, otherCloud.y);
    if (distance < 50) {
      return true;
    }
    else {
      return false;
    }
  }
}



