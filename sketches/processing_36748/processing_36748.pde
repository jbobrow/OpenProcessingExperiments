

void setup() {
  size(200, 400);
  background(30);
}

int numOfrect = 500; // it takes a lot of circles to make this look OK
float rndWidth;
float count = 60;
float rndColor;
float num = 50;


void draw() { 
  rndWidth = random(height);
  noStroke();


  if (numOfrect > 20) {
    rect(random(height), rndWidth, rndWidth/4, rndWidth/4);
    numOfrect--;
  }
  if (count>0) {
    rndColor = random(100);

    //determine the color
    if (rndWidth >= 50)
      fill (0, 200, 0, 30);
  }
  if (rndWidth < 150)
    fill (0, 0, 200, 30);

  if (count % 10 == 0) { 
    rect(width, count*width/num, random(-width), width/num);
  }
}


