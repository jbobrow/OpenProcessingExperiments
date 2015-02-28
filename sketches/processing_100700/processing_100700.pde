
PShape usa;
PShape state;
int min;

String stateabbreviations[] = {
  "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY", "DC"
};

float popDen[] = {
  94.65, 1.264, 57.05, 56.43, 244.2, 49.33, 741.4, 470.7, 360.2, 172.5, 216.8, 19.15, 231.9, 182.5, 54.81, 35.09, 110.0, 105.0, 43.04, 606.2, 852.1, 174.8, 67.14, 63.5, 87.26, 6.858, 23.97, 24.8, 147.0, 1205, 17.16, 415.3, 200.6, 9.916, 282.5, 55.22, 40.33, 285.3, 1016, 157.1, 10.86, 156.6, 98.07, 34.3, 67.73, 207.3, 102.6, 77.06, 105.2, 5.851, 10357.0
};

public void setup() {
  size(950, 600);
  usa = loadShape("http://upload.wikimedia.org/wikipedia/commons/3/32/Blank_US_Map.svg");
  
}

public void draw() {
  background(255);
  shape(usa, 0, 0);
  colorStates();
  textSize(20);
  textAlign(CENTER);
  text("State Population Density", width / 2, 18);
  textSize(15);
  if (min <= 0) {
    text("Currently displaying states with any density", width / 2 + 90, 45);
  } 
  else {
    text("Currently displaying states with density greater than " + min + " psm", width / 2 + 90, 45);
  }

  if(mousePressed) {
    if(min < 1250) {
      min += 3;
    } 
    else {
      min = -20;
    }
  }
}

void colorStates() {
  for (int i = 0; i < stateabbreviations.length; i++) {
    PShape state = usa.getChild(stateabbreviations[i].toString());
    if ((int) popDen[i] > min) {
      state.disableStyle();
      fill(0, (int) popDen[i] * 400 / 2400 + 50, 0);
      noStroke();
      shape(state, 0, 0);
    }
    else if((int) popDen[i] < min) {
      state.disableStyle();
      fill(0, 0, 0);
      noStroke();
      shape(state, 0, 0);
    }
  }
}
