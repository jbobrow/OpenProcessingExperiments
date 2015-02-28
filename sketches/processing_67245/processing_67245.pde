
class Conductor {
  color conductorColor;
  int counter = 0;
  int commitInterval = 1;
  int monthsInterval = 1;
  float [] commits = new float [7];
  float [] lines = new float [7];
  float [] totalLines = new float[7];

  
  float [] totalCommits = new float[7];

  
  int [] months = new int[7];
  
  
  float [] percentLines = new float [7];
  float [] percentCommits = new float [7];
  
  float esy, exy, epx, epy;
  
  String name; 
  
  
  
  int plotX1 = 50;
  int plotX2;
  int plotY1= 60;
  int plotY2;
  
  //float radius;
  float oldRadius;
  int radOne;
  int radTwo;
  int radThree;
  boolean incReset = false;
  //float inc = 0;
  
  int ppaxisO;
  //float pradius;



  Conductor() {};
  
  Conductor init() {
    
    totalLines [0] = 274000;
    totalLines [1] = 828000;
    totalLines [2] = 43000;
    totalLines [3] = 101000;
    totalLines [4] = 538000;
    totalLines [5] = 280000;
    totalLines [6] = 6040;
    totalCommits [0] = 45;
    totalCommits [1] = 83;
    totalCommits [2] = 28;
    totalCommits [3] = 70;
    totalCommits [4] = 129;
    totalCommits [5] = 284;
    totalCommits [6] = 46;
    months[0] = 1;
    months[1] = 2;
    months[2] = 3;
    months[3] = 4;
    months[4] = 5;
    months[5] = 6;
    months[6] = 7;

    return(this);
  }
  
  Conductor duran() {
    name = "Duran";
    commits [0] = 21;
    commits [1] = 30;
    commits [2] = 9;
    commits [3] = 15;
    commits [4] = 40;
    commits [5] = 56;
    commits [6] = 1;
    lines [0] = 270000;
    lines [1] = 560000;
    lines [2] = 20000;
    lines [3] = 30000;
    lines [4] = 500000;
    lines [5] = 90000;
    lines [6] = 5000;
    conductorColor = c01;

    return(this);
  }
  
  Conductor valderra() {
    name = "Valderra";
    commits [0] = 1;
    commits [1] = 1;
    commits [2] = 1;
    commits [3] = 12;
    commits [4] = 20;
    commits [5] = 130;
    commits [6] = 15;
    lines [0] = 0;
    lines [1] = 0;
    lines [2] = 0;
    lines [3] = 5000;
    lines [4] = 1000;
    lines [5] = 80000;
    lines [6] = 1000;
    conductorColor = c02;

    return(this);
  }
  
  Conductor menzies() {
    name = "Menzies";
    commits [0] = 20;
    commits [1] = 25;
    commits [2] = 15;
    commits [3] = 12;
    commits [4] = 12;
    commits [5] = 22;
    commits [6] = 10;
    lines [0] = 1000;
    lines [1] = 35000;
    lines [2] = 20000;
    lines [3] = 40000;
    lines [4] = 1000;
    lines [5] = 40000;
    lines [6] = 10;
    conductorColor = c03;
    
    return(this);
  }
    
  Conductor goetz() {
    name = "Goetz";
    commits [0] = 1;
    commits [1] = 1;
    commits [2] = 1;
    commits [3] = 10;
    commits [4] = 32;
    commits [5] = 40;
    commits [6] = 18;
    lines [0] = 1000;
    lines [1] = 1000;
    lines [2] = 1000;
    lines [3] = 10000;
    lines [4] = 25000;
    lines [5] = 10000;
    lines [6] = 10;
    conductorColor = c04;
    
    return(this);
  }
  
  Conductor kieu() {
    name = "Kieu";
    commits [0] = 1;
    commits [1] = 1;
    commits [2] = 1;
    commits [3] = 1;
    commits [4] = 24;
    commits [5] = 35;
    commits [6] = 1;
    lines [0] = 1000;
    lines [1] = 2000;
    lines [2] = 1000;
    lines [3] = 1000;
    lines [4] = 10000;
    lines [5] = 30000;
    lines [6] = 10;
    conductorColor = c05;
    
    return(this);
  }
  
  Conductor ilkin() {
    name = "Ilkin";
    commits [0] = 1;
    commits [1] = 25;
    commits [2] = 1;
    commits [3] = 20;
    commits [4] = 1;
    commits [5] = 1;
    commits [6] = 1;
    lines [0] = 1000;
    lines [1] = 230000;
    lines [2] = 1000;
    lines [3] = 15000;
    lines [4] = 1000;
    lines [5] = 30000;
    lines [6] = 10;
    conductorColor = c06;
    
    return(this);
  }
  
  
  void drawLines() {
    plotY2 = height - plotY1;
    plotX2 = width - plotX1;
    counter = count;
    pushStyle();
    stroke(bone);
    strokeWeight(1);
    for (int row = 0; row < 7; row++) {
     if (months[row] % commitInterval == 0) {
       float x = map(months[row], 1, 7, plotX1, plotX2);
       line(x, plotY1, x, plotY2);
     }
   }
    popStyle();
    
  }
  
  void drawBackground() {
    plotY2 = height - plotY1;
    plotX2 = width - plotX1;
    counter = count;
    pushStyle();
    noStroke();
    fill(237, 235, 230);
    pushMatrix();
    translate(0, plotY2/2, -plotY2/2);
    rotateX(PI/2);
    drawLines();
    //rect(plotX1, plotY1, plotX2, plotY2);
    popMatrix();
    popStyle();
    
  }
  
  void render(int count, int mode) {
    pushStyle();
    noStroke();
    fill(conductorColor);
    plotY2 = height - plotY1;
    plotX2 = width - plotX1;
    counter = count;
    percentLines[counter] = lines[counter]/totalLines[counter];
    percentCommits[counter] = commits[counter]/totalCommits[counter];
    //println (commits[counter] + " " + totalCommits[counter] + " " + percentCommits[counter]); 
    float xpos = map(commits[count], 1, 130, plotX1, plotX2);
    float ypos = map(lines[count], 0, 900000, plotY1, plotY2);
    pushMatrix();
    translate(xpos, ypos);
    radOne = constrain(int((percentCommits[counter]/percentLines[counter]) * 0.1 + 20), 0, 80);
    radTwo = int(percentLines[counter] * 60 + 10);
    radThree = int(percentCommits[counter] * 60 + 10);
    radius = 25;
    if (paxisO == 0) {   
      //radius = tw.Incrementor(radius, radOne, 500);
      radius = 25;
    }
    else if (paxisO == 1) {

      //radius = tw.Incrementor(radius, radTwo, 500);
      radius = radTwo;
    }
    else if (paxisO == 2) {

      //radius = tw.Incrementor(radius, radThree, 500);
      radius = radThree;
    }
    pradius = radius;  
    
    ppaxisO = paxisO;
    //println(radius);
    //println(pradius);
    sphere(radius);
    //oldRadius = radius;
    //radius = radius *50 + 10;
    //Ani.to(this, 1.5, "radius", 60);
    //sphere(percentCommits[counter]*50 + 10);
    //sphere(radius);
    popMatrix();
    //ellipse(xpos, ypos, percentCommits[counter] * 100, percentCommits[counter] * 100);
    popStyle();
    
  }
  
  float getXpos() {
    float xpos = map(commits[count], 1, 130, plotX1, plotX2);
    return xpos;
    
  }
  
  float getYpos() {
    float ypos = map(lines[count], 0, 900000, plotY1, plotY2);
    return ypos;
  }
  



}

