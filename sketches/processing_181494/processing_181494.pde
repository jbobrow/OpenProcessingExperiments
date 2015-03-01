
int counter, counter2, counter3;
float s, C, dif;

float v = 0.983192; //velocity of 10,000 km/s

void setup() {
  size(600, 400);
  frameRate(30);
}

void draw() {
  background(0);

  // EARTH

  counter++;

  if ( counter < 30 ) {
    fill(255);
  }  

  if ( counter > 30 && counter < 60 ) {
    fill(0);
  }

  if ( counter == 60 ) {
    counter = 0;
  } 

  ellipse(150, 200, 150, 150);


  // PROBE

  counter2++;

  s = counter2/30; 

  C = v * s; 

  dif = s - C; 

 

  if (dif < 1) { 
    dif = 1;
  }

  // EARTH
  
  counter3++;

  if (counter3 >= 60 * dif) { 
    counter3 = 0;
  }
  if ( counter3 <= 30 * dif ) { 
    fill(255);
  } 
  if ( counter3 >= 30 * dif && counter3 <= 60 * dif ) {
    fill(0);
  }
  ellipse(450, 200, 150, 150);
}



