
float x1;
float yEnd;
float yStart;
float dataMin, dataMax;
float plotX1,plotX2;
float plotY1,plotY2;
float labelX;
float labelY;
float value;
int yearMax,yearMin;
int waarde;

int mouseWaarde;
boolean mouseover;

class Particle {
  float x;
  float yE;
  float yS;
  float xspeed;
  float yspeed;
  float velocityX;
  float velocityY;
  int row;
  float value;
  float z;

  Particle(float x1, float yEnd, float yStart, int waarde) {
    x = x1;
    yE = yEnd;
    yS = yStart;
    row = waarde;
    yspeed = -((yS - yE) / 300);
  }

  void update() {
    yS = yS + (yspeed);
  }


  void display() {
    stroke(0);
    fill(0,75);
    ellipse(x,yS,10,10);
  }

  void drawParticle(){
    if (timer.isFinished()) {
      if (q != rowCount){
        int col;
        for(int row = q; row == q; row++){
          int waarde = row;
          float value = aTable.getFloat(row,0);
          float x1 = map (years[row], yearMin,yearMax,plotX1,plotX2);
          float yEnd = map(value,dataMin,dataMax,plotY2,plotY1);
          float yStart = plotY2;
          balletjes.add(new Particle(x1,yEnd,yStart,waarde));
        }
        q++;
        timer.start();
      }
    }
  }

  void mouseOver(int a){
    fill(0);
    textSize(10);
    textLeading(18);
    rectMode(CORNER);
    int jaar = round(aTable.getFloat(a,0));
    text(jaar + " (" + years[a] + ") " , mouseX, mouseY-15);
  }

  void drawYearLabels(){
    fill(0);
    textSize(10);
    textAlign(CENTER,TOP);

    stroke(224);
    strokeWeight(1);
    for ( int a = 0; a < rowCount; a++){
      float x = map(years[a],yearMin,yearMax,plotX1,plotX2);
      text(years[a],x,plotY2 + 10);
      line(x,plotY1,x,plotY2);     
    }
  }

  void drawVolumeLabels(){
    fill(0);
    textSize(10);
    textAlign(RIGHT,CENTER);

    for ( float v =dataMin; v <= dataMax; v+= volumeInterval){
      float y = map(v,dataMin,dataMax,plotY2,plotY1);
      text(floor(v),plotX1 - 10, y);     
    }
  }
  
  void drawLabels(){
    fill(0);
    textSize(14);
    textLeading(18);
    
    textAlign(CENTER);
    text("Aantal\n behaalde\n HBO\n Bachelors", labelX, (plotY1+plotY2)/2);
    textAlign(CENTER);
    text("Jaar", (plotX1+plotX2)/2, labelY);
    
    textSize(18);
    textLeading(20);
    text("Aantal behaalde HBO Bachelors per jaar.", (plotX1+plotX2)/2, plotY1-30);
  }

}


