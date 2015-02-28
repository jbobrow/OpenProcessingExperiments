
void setup() 
{frameRate(7);
  size(500,500);
  background(0);
}

void draw() {

  stroke(0,random(191),random(250));
  strokeWeight(10);
  point(random(500),random(500));

  stroke(random(255),random(165), 0);
  strokeWeight(2);
  line(0, 0, random(500), random(500));
  
}



