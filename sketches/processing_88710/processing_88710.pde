
int newPoint = 0;

void setup () {
  size (500, 500);
  background(0);
  //frameRate(15);
}

void draw () {
  for (int i=0; i<3; i++) {

 
    
    for (int j=0; j<150; j++) {
      stroke(255);
      line(newPoint, random(500), newPoint, random(500));
      stroke(0);
      line(newPoint, random(500), newPoint, random(500));
      stroke(random(255));
      line(newPoint, random(500), newPoint, random(500));
      
      
    }


    newPoint+=3;

    if (newPoint > 500) newPoint = 0;
  }
}



