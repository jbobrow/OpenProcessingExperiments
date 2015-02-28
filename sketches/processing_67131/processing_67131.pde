
int number = 12;
int spacing = 25;

float[] circleX = new float[number];
float[] circleY = new float[number];
float[] vels = new float[number];
float[] velsX = new float[number];
float[] accs = new float[number];

color[] racers = {
  color(240, 33, 33), color(245, 162, 54), color(245, 234, 54), color(42, 162, 4), color(38, 186, 149), color(36, 160, 200), color(27, 87, 154), color(125, 95, 253), color(205, 40, 253), color(234, 15, 149), color(255, 183, 183), color(183, 224, 255)
};
String[] names = {
  "Joe", "Jonas", "Siri", "Huy", "Tiam", "Jackie", "Aero", "Salome", "WenWen", "Kristen", "Shahrouz", "Yang"
};
String[] message = {
  "I rule.", "Danish Power", "oh my god", "Kiss my Bootycamp", "In your face!", "Jackie muthafuckin' Neon", "...", "Dag.", "Pigs feet", "Wiggle Wiggle", "I like bootcamp.", "Woo la!"
};

String state = "before";
int lightRadius = 15;

float startingTime = millis(); //this variable will indicate the starting time of whatever phenomenon you want to have for an interval of time
float interval = 1000; //this variable indicates the interval (in milliseconds), so this is 3 seconds
boolean on3 = true;  //boolean indicate that the timed phenomenon is on or off
boolean on2 = false;  //boolean indicate that the timed phenomenon is on or off
boolean on1 = false;  //boolean indicate that the timed phenomenon is on or off

int winnerIndex;
PFont f;
float winning = 0;
int leader = 0;
int totalObstacles = 10;

float[] obX = new float[totalObstacles];
float[] obY = new float[totalObstacles];

int randomOb = (int)random(totalObstacles);

// true = horizontal, false = vertical
boolean[] horiz = new boolean[totalObstacles];

float decc = .2;

void setup() {
  size(300, 800);
  frameRate(12);
  smooth();
  noStroke();
  for (int i = 0; i<number; i++) { // setting all the balls' initial values to 0
    circleY[i] = 0;
    circleX[i] = ((i+1)*spacing-15);
    vels[i] = random(2, 5);
    velsX[i] = 0;
    accs[i] = random(-3, 3);
  }
  startingTime = millis();
  background(50);
  f = loadFont("Futura-Condensed-Thin-48.vlw");
  textFont(f, 48);
  for (int i = 0; i<totalObstacles; i++) {
    obY[i] = (i+2)*(height/number);
    obX[i] = random(-300, 0);
  }
}

void draw() {
  if (state == "before") {
    background(50);
    timer();
    for (int i = 0; i < number; i++) {
      fill(racers[i]);
      ellipse(circleX[i], circleY[i], 10, 30);
    }
  }
  if (state == "race") {
    background(50);
    for (int i = 0; i<totalObstacles; i++) {
      if (obX[i] >= width) {
        obX[i] = random(-300, 0);
      }
      ellipse(obX[i], obY[i], 10, 10);
      obX[i] += 20;
      for (int j = 0; j<number; j++) {
        if (circleX[j] < obX[i] && obY[i] > circleY[j] && obY[i] < (circleY[j]+10)) {
          //          println(velsX[j] + " " + circleX[j]);
          velsX[j] = velsX[i] + 10-(decc*decc);
        }
      }
    }

    for (int i = 0; i < number; i++) {
      fill(racers[i]);
      stroke(racers[i]);
      line(((i+1)*spacing-15), circleY[i], ((i+1)*spacing-15), 0);
      ellipse(((i+1)*spacing-15)+circleX[i], circleY[i], 10, 30);
      accs[i] = random(-3, 3);
      vels[i] = vels[i] + accs[i];
      if (vels[i]<0) {
        vels[i] = 0;
      }
      //      if (velsX[i]<0) {
      //        velsX[i] = 0;
      //      }
      circleY[i] = circleY[i] + vels[i];
      circleX[i] = circleX[i] + velsX[i];
      if (circleY[i]>=height) {
        state = "winner";
        winnerIndex = i;
      }
      if (circleY[i] > winning) {
        leader = i;
        winning = circleY[i];
      }
      if (circleX[i] >= width) {
        velsX[i] = -velsX[i];
      }
    }
    fill(racers[leader]);
    text(names[leader] + " is winning...", 20, 100);
        println(circleX);

  }
  if (state == "winner") {
    background(racers[winnerIndex]);
    stroke(205);
    line(((winnerIndex+1)*spacing-15), circleY[winnerIndex], ((winnerIndex+1)*spacing-15), 0);
    fill(0);
    text(names[winnerIndex], 20, 50);
    text("is the", 20, 100);
    text("WINNER!", 20, 150);
    textFont(f, 24);
    text("(" + message[winnerIndex] + ")", 20, height-100);
    state = "game-over";
  }

  if (state == "game-over") {
    return;
  }

}

void timer() {
  if (millis()-startingTime<1000) {
    for (int j=0; j<3; j++) {
      for (int k=0; k<6; k++) {
        radial(lightRadius, 75+(k*30), 210+(j*150), 25, -255, 100);
        radial(lightRadius, 75+(k*30), 200+(j*150), 25, -255, 100);
      }
    }
    for (int m=0; m<9; m++) {
      if (m!=4) {
        radial(lightRadius, 225, (int)240+(m*30), 25, -255, 100);
        radial(lightRadius, 225, (int)230+(m*30), 25, -255, 100);
      }
    }
  }
  if (millis()-startingTime<2000 && millis()-startingTime>1010) {
    for (int j=0; j<3; j++) {
      for (int k=0; k<6; k++) {
        radial(lightRadius, 75+(k*30), 210+(j*150), 25, -255, 100);
        radial(lightRadius, 75+(k*30), 200+(j*150), 25, -255, 100);
      }
    }
    for (int m=0; m<9; m++) {
      if (m<4) {
        radial(lightRadius, 225, (int)240+(m*30), 25, -255, 100);
        radial(lightRadius, 225, (int)230+(m*30), 25, -255, 100);
      } 
      else if (m>4) {
        radial(lightRadius, 75, (int)240+(m*30), 25, -255, 100);
        radial(lightRadius, 75, (int)230+(m*30), 25, -255, 100);
      }
    }
  }

  if (millis()-startingTime<3000 && millis()-startingTime>2010) {

    for (int m=0; m<9; m++) {
      radial(lightRadius, 225, (int)240+(m*30), 25, -255, 100);
      radial(lightRadius, 225, (int)230+(m*30), 25, -255, 100);
    }
  }
  if (millis()-startingTime>4000) {
    state = "race";
  }
}
// dim = diameter of the radial gradient
// x = x coordinate of the ellipse
// y = y coordinate of the ellipse
// r g b are the rgb values for the gradient -> white
// insert negative values to prevent that color scale from becoming white
void radial(int dim, float x, float y, int R, int G, int B) {
  int r;
  int g;
  int b;

  for (int i=dim; i>0; i--) {
    if (R>=0) {
      r = ((dim-i)*R);
    } 
    else {
      r = R;
    }
    if (G>=0) {
      g = ((dim-i)*G);
    } 
    else {
      g = G;
    }
    if (R>=0) {
      b = ((dim-i)*B);
    } 
    else {
      b = B;
    }
    fill(abs(r), abs(g), abs(b));
    ellipse(x, y, i, i);
  }
}


