
ArrayList plots;
int timesteps = 100;
float probA = 0.1;
float probB = 0.05;
float probC = 0.025;
int state = 0;
int lastDrawnAt = 0;
int totalTransition1 = 0;
int totalTransition2 = 0;
int totalTransition3 = 0;
int countTransition1 = 0;
int countTransition2 = 0;
int countTransition3 = 0;
float meanTransition1 = 0;
float meanTransition2 = 0;
float meanTransition3 = 0;


void setup() {
  background(255);
  size(640, 400);
  plots = new ArrayList();
}

void draw() {
  background(255);

  int Transition1 = -1;
  int Transition2 = -1;
  int Transition3 = -1;



  if (millis() - lastDrawnAt > map(mouseY, 0, height, 1, 1000)) {
    state = 0;
    for (int i=0; i<= timesteps * 10; i++) { //Loop through timesteps
      switch(state) {
      case 0:
        if (random(0, 1) <= probA) {
          Transition1 = i;
          state = 1;
          totalTransition1 = totalTransition1 + Transition1;
          countTransition1 ++;
          meanTransition1 = totalTransition1/countTransition1;
        }
        break;
      case 1:
        if (random(0, 1) <= probB) {
          Transition2 = i;
          state = 2;
          totalTransition2 = totalTransition2 + Transition2;
          countTransition2 ++;
          meanTransition2 = totalTransition2/countTransition2;
        }
        break;
      case 2:
        if (random(0, 1) <= probC) {
          Transition3 = i;
          state = 3;
          totalTransition3 = totalTransition3 + Transition3;
          countTransition3 ++;
          meanTransition3 = totalTransition3/countTransition3;
        }
        break;
      case 3:
        state = 3;
        break;
      }
    }




    plots.add(new Plot(Transition1, Transition2, Transition3));
    lastDrawnAt = millis()+1;
  }
  for (int i=plots.size()-1; i >= 0; i--) {
    Plot thisPlot = (Plot) plots.get(i);
    thisPlot.updateMe();
    if (thisPlot.a == 0) {
      plots.remove(i);
    }
  }
  plotMean(meanTransition1, meanTransition2, meanTransition3);
  //println(plots.size()); // Debug successful removal of old plots from arraylist
}

void plotMean(float meanT1, float meanT2, float meanT3) {

  int vertX = 0;
  float vertY = height;
  float finalY = 0;
  smooth();
  noFill();
  strokeWeight(width/timesteps);
  stroke(#080101, 255);

  beginShape();
  vertex(vertX, vertY);
  if (meanT1 >= 0) {
    vertex((width/timesteps)*(meanT1 - 1), height);
    vertex((width/timesteps)*(meanT1), height*0.75);
    finalY = height*0.75;
  }
  if (meanT2 >= 0) {
    vertex((width/timesteps)*(meanT2 - 1), height*0.75);
    vertex((width/timesteps)*(meanT2), height*0.5);
    finalY = height*0.5;
  }
  if (meanT3 >= 0) {
    vertex((width/timesteps)*(meanT3 - 1), height*0.5);
    vertex((width/timesteps)*(meanT3), height*0.25);
    finalY = height*0.25;
  }
  vertex(width, finalY);
  endShape();
}

class Plot {

  int Transition1;
  int Transition2;
  int Transition3;
  float vertX;
  float vertY;
  float a = 255; //Transparency
  float finalY = height;

  Plot (int T1, int T2, int T3) {
    Transition1 = T1;
    Transition2 = T2;
    Transition3 = T3;
  }

  void drawMe() {
    vertX = 0;
    vertY = height;
    smooth();
    noFill();
    strokeWeight(max(1, width/timesteps));
    stroke(#5CD6E3, a);

    beginShape();
    vertex(vertX, vertY);
    if (Transition1 >= 0) {
      vertex((width/timesteps)*(Transition1 - 1), height);
      vertex((width/timesteps)*(Transition1), height*0.75);
      finalY = height*0.75;
    }
    if (Transition2 >= 0) {
      vertex((width/timesteps)*(Transition2 - 1), height*0.75);
      vertex((width/timesteps)*(Transition2), height*0.5);
      finalY = height*0.5;
    }
    if (Transition3 >= 0) {
      vertex((width/timesteps)*(Transition3 - 1), height*0.5);
      vertex((width/timesteps)*(Transition3), height*0.25);
      finalY = height*0.25;
    }
    vertex(width, finalY);
    endShape();
  }

  void updateMe() {
    if (a - map(mouseX, 0, width, 0.5, 10) < 0) {
      a = 0;
    }
    else {
      a = a-map(mouseX, 0, width, 0.5, 10);
    }
    drawMe();
  }
}

