

String [] StrArray  ;

int [] stuff = new int [100];


void setup () {
  size (1200, 200);
  StrArray = loadStrings  ("travel_spending.txt");

  for (int i = 0; i<StrArray.length; i++) {
    println (StrArray [i]);
  }
}

void draw () {
  smooth();
  background (255);
  for (int i = 0; i<StrArray.length; i++) {
    int value = int (StrArray[i]);
    ellipseMode(CENTER);
    ellipse (50+ i*108, 100, value, value);
    noStroke ();
    //strokeWeight(value);
fill(60, 200, 60);
  }
}


