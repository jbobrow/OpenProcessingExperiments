
int number = 12;
int spacing = 25;

float[] circleY = new float[number];
float[] vels = new float[number];
float[] accs = new float[number];

color[] racers = {color(240, 33, 33), color(245,162,54), color(245,234,54), color(42,162,4), color(38,186,149), color(36,160,200), color(27,87,154), color(125,95,253), color(205,40,253), color(234,15,149), color(255,183,183), color(183,224,255)};
String[] names = {"Joe","Jonas","Siri","Huy","Tiam","Jackie","Aero","Salome","WenWen","Kristen","Shahrouz","Yang"};
String[] message = {"I rule.","Danish Power","oh my god","Kiss my Bootycamp","In your face!","Jackie muthafuckin' Neon","...","Dag.","Pigs feet","Wiggle Wiggle","I like bootcamp.","Woo la!"};

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

void setup() {
  size(300, 800);
  frameRate(12);
  smooth();
  noStroke();
  for (int i = 0; i<number; i++) { // setting all the balls' initial values to 0
    circleY[i] = 0;
    vels[i] = random(5, 10);
    accs[i] = random(-3, 3);
  }
  startingTime = millis();
  background(50);
  f = loadFont("Futura-Condensed-Thin-48.vlw");
  textFont(f, 48);
}

void draw() {
  if (state == "before") {
    background(50);
    for (int i = 0; i < number; i++) {
      fill(racers[i]);
      ellipse(((i+1)*spacing-15), circleY[i], 10, 30);
      if (on3==true&&on2==false&&on1==false&&millis()-startingTime<interval) {
        tres();
      }
      else {
        on3=false;
        if(on3==false && on2==false && on1 == false){
          startingTime = millis();
          on2=true;
        }
        if (on2==true&&on3==false&&on1==false&&millis()-startingTime<interval) {
          dois();
        }
        else {
          on2=false;
          if(on3==false&&on2==false&&on1==false){
            startingTime = millis();
            on1=true;
          }
          if (on1==true&&on2==false&&on3==false&&millis()-startingTime<interval) {
            um();
          } else {
            state = "race";
          }
        }
      }
    }
  }
  if (state == "race") {
    background(50);
    for (int i = 0; i < number; i++) {
      fill(racers[i]);
      stroke(racers[i]);
      line(((i+1)*spacing-15), circleY[i], ((i+1)*spacing-15), 0);
      ellipse(((i+1)*spacing-15), circleY[i], 10, 30);
      accs[i] = random(-3, 3);
      vels[i] = vels[i] + accs[i];
      if (vels[i]<0) {
        vels[i] = 0;
      }
      circleY[i] = circleY[i] + vels[i];
      if(circleY[i]>=height){
        state = "winner";
        winnerIndex = i;
      }
      if(circleY[i] > winning){
          leader = i;
          winning = circleY[i];
      }
    }
    fill(racers[leader]);
    text(names[leader] + " is winning...",20,100);
  }
  if(state == "winner"){
    background(racers[winnerIndex]);
    stroke(205);
    line(((winnerIndex+1)*spacing-15), circleY[winnerIndex], ((winnerIndex+1)*spacing-15), 0);
    fill(0);
    text(names[winnerIndex], 20,50);
    text("is the",20,100);
    text("WINNER!",20,150);
    textFont(f, 24);
    text("(" + message[winnerIndex] + ")", 20, height-100);
    state = "game-over";
  }
  
  if(state == "game-over"){
    return;
  }
}

void tres() {
  for (int i=lightRadius; i>0; i--) {
    fill(25*(lightRadius-i), 255, 100*(lightRadius-i));
    for (int j=0; j<3; j++) {
      for (int k=0; k<6; k++) {
        ellipse(75+(k*30), 210+(j*150), i, i);
        ellipse(75+(k*30), 200+(j*150), i, i);
      }
    }
    for (int m=0; m<9; m++) {
      if (m!=4) {
        ellipse(225, 240+(m*30), i, i);
        ellipse(225, 230+(m*30), i, i);
      }
    }
  }
}

void dois() {
  for (int i=lightRadius; i>0; i--) {
    fill(25*(lightRadius-i), 255, 100*(lightRadius-i));
    for (int j=0; j<3; j++) {
      for (int k=0; k<6; k++) {
        ellipse(75+(k*30), 210+(j*150), i, i);
        ellipse(75+(k*30), 200+(j*150), i, i);
      }
    }
    for (int m=0; m<9; m++) {
      if (m<4) {
        ellipse(225, 240+(m*30), i, i);
        ellipse(225, 230+(m*30), i, i);
      } else if (m>4){
        ellipse(75, 240+(m*30), i, i);
        ellipse(75, 230+(m*30), i, i);      }
    }
  }
}

void um() {
  for (int i=lightRadius; i>0; i--) {
    fill(25*(lightRadius-i), 255, 100*(lightRadius-i));
    for (int m=0; m<9; m++) {
      ellipse(225, 240+(m*30), i, i);
      ellipse(225, 230+(m*30), i, i);
    }
  }
}


