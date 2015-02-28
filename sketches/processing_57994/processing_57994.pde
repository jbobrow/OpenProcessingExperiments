
//copyright benjamin corwin 2012
//data visualizer of the amount of sleep I get on a nightly basis.
//the data is set up so it represents the amount of sleep I am functioning on for that day.
//press 1 to see all the data
//press 2 to see the amount of sleep while at school
//press 3 to see the amount of sleep while on break
//press q to see the actual data points (you will need to then select to 1,2 or 3 to re-graph the data)
//press w to see the data rounded to the closest hour

//sleep amounts from oldest to newest
//                    mon   tues  wed   thurs  fri  sat    sun
float[] hoursTotal =  {9.22, 5.32, 7.73, 7.25, 7.5,  9.26, 6.75, 
                      8.03, 7.48, 7.47, 6.58, 5.81, 7.2,  9.5,
                      8.66, 6.62, 6.88, 6.66, 7.58, 8.26, 8.03,
                      8.2,  5.64, 7.48, 6.87, 7.08, 7.62, 7.34, 
                      8.28, 6.43, 7.06, 5.86, 4.43, 7.63, 7.31, 
                      8.29, 6.96, 5.6,  8.48, 8.53, 7.61, 8,    
                      8,    7.66, 7.34, 6.01, 5.81, 6.95, 8.26, 
                      9.39, 7,    5.55, 6.03, 5.55, 7.3 , 8.91, 
                      7.51, 8.34, 7.13, 2.79, 8.85, 7.83, 8.22, 
                      7.56, 8.05, 5.31, 11.1, 9.65, 9.71, 7.78,
                      7.48, 8.37, 10.3, 7.09, 7.87, 8.48, 7.83, 
                      7.36, 7.24, 10.6, 8,    8.48, 8.6,  10.3,
                      8.71, 8.28, 7.85, 8.19, 8.77, 7.77, 9.32,
                      6.46, 8.97, 8.82, 8.49, 6.9,  8.01, 8.56,
                      8.85, 7.94, 7.04, 7.88, 6.16, 7.75, 9.61, 
                      5.81, 8.27, 6.19, 7.26, 7.03, 8.05, 7.56, 
                      6.4 , 5.56, 7.18, 8.03, 6.61, 7,    7.08, 
                      8.26, 7.6 , 7.05, 7.28, 7.03, 8.4,  8.58, 
                      7.5,  8.82, 6.85, 7.49, 7.05, 7.8,  9.2,  
                      7.88, 8.28, 7.07, 7.02, 7.2,  5.75, 6.11, 
                      7.98, 7.36, 8.8,  7.32, 7.26, 7.02, 8.38, 
                      8.66, 8.05, 9.39, 7.9,  8.22, 6.1,  9.62, 
                      8,    8.32, 7.3,  7.67, 7.61, 7.24};
                      
float [] hoursSchool={9.22, 5.32, 7.73, 7.25, 7.5,  9.26, 6.75, 
                      8.03, 7.48, 7.47, 6.58, 5.81, 7.2,  9.5,
                      8.66, 6.62, 6.88, 6.66, 7.58, 8.26, 8.03,
                      8.2,  5.64, 7.48, 6.87, 7.08, 7.62, 7.34, 
                      8.28, 6.43, 7.06, 5.86, 4.43, 7.63, 7.31, 
                      8.29, 6.96, 5.6,  8.48, 8.53, 7.61, 8,    
                      8,    7.66, 7.34, 6.01, 5.81, 6.95, 8.26, 
                      9.39, 7,    5.55, 6.03, 5.55, 7.3 , 8.91, 
                      7.51, 8.34, 7.13, 2.79, 8.85, 7.83, 8.22, 
                      7.56, 8.05, 5.31, 30,   30,   30,   30,//30's are time keepers
                      6.46, 8.97, 8.82, 8.49, 6.9,  8.01, 8.56,
                      8.85, 7.94, 7.04, 7.88, 6.16, 7.75, 9.61, 
                      5.81, 8.27, 6.19, 7.26, 7.03, 8.05, 7.56, 
                      6.4 , 5.56, 7.18, 8.03, 6.61, 7,    7.08,  
                      7.5,  8.82, 6.85, 7.49, 7.05, 7.8,  9.2,  
                      7.88, 8.28, 7.07, 7.02, 7.2,  5.75, 6.11, 
                      7.98, 7.36, 8.8,  7.32, 7.26, 7.02, 8.38, 
                      8.66, 8.05, 9.39, 7.9,  8.22, 6.1,  9.62, 
                      8,    8.32, 7.3,  7.67, 7.61, 7.24};
                      
float [] hoursBreak ={30,   30,   30,   11.1, 9.65, 9.71, 7.78,
                      7.48, 8.37, 10.3, 7.09, 7.87, 8.48, 7.83, 
                      7.36, 7.24, 10.6, 8,    8.48, 8.6,  10.3,
                      8.71, 8.28, 7.85, 8.19, 8.77, 7.77, 9.32,
                      8.26, 7.6 , 7.05, 7.28, 7.03, 8.4,  8.58};

                                              
PVector [] posTotal = new PVector[hoursTotal.length];
PVector [] posSchool = new PVector[hoursSchool.length];
PVector [] posBreak = new PVector[hoursBreak.length];
float [] hoursRoundTotal = new float[hoursTotal.length];
float [] hoursRoundSchool = new float[hoursSchool.length];
float [] hoursRoundBreak = new float[hoursBreak.length];
PVector [] posRoundTotal = new PVector[hoursTotal.length];
PVector [] posRoundSchool = new PVector[hoursSchool.length];
PVector [] posRoundBreak = new PVector[hoursBreak.length];
float[] Days = new float[7];
float[] average = new float[7];

int[] dia = new int [hoursTotal.length];
color col;
boolean a;

Datapoint d;
Graph g;

void setup(){
  textAlign(CENTER);
  smooth();
  background(255);
  strokeWeight(5);
  stroke(0);
  size(600,600);
  a = true;
  d = new Datapoint();
  d.setup();
  g = new Graph();
  g.graph1();
  g.days();
  g.hours();
  g.marks(8,12);
  prepWindow();
  PVectorSetup(hoursTotal,  posTotal);
  PVectorSetup(hoursSchool, posSchool);
  PVectorSetup(hoursBreak,  posBreak);
  PVectorSetupRound(hoursRoundTotal,  posRoundTotal);
  PVectorSetupRound(hoursRoundSchool, posRoundSchool);
  PVectorSetupRound(hoursRoundBreak,  posRoundBreak);
  diaSetup();
  fill(0);
  textSize(24);
  text("Press 1, 2 or 3",width/2,50);

  
}

void draw(){
  
  if(keyPressed){
    if(key == '1') {
      prepWindow();
      for(int i = 0; i<hoursTotal.length; i++) {
        d.draw(posTotal[i],dia[i],col,25);//PVector,diamiter,color,opacity
      }
      d.connections(posTotal);
      fill(0);
      textSize(24);
      text("All Data",width/2,50);
      if (a == true) {
        text("Exact Data", width/2,75);
      }
      if (a == false) {
        text("Rounded Data", width/2,75);
      }
    }
    if(key == '2') {
      prepWindow();
      for(int i = 0; i<hoursSchool.length; i++) {
        d.draw(posSchool[i],dia[i],col,25);//PVector,diamiter,color,opacity
      }
      d.connections(posSchool);
      fill(0);
      textSize(24);
      text("School",width/2,50);
      if (a == true) {
        text("Exact Data", width/2,75);
      }
      if (a == false) {
        text("Rounded Data", width/2,75);
      }
    }
    if(key == '3') {
      prepWindow();
      for(int i = 0; i<hoursBreak.length; i++) {
        d.draw(posBreak[i],dia[i],color(15,0,0),35);//PVector,diamiter,color,opacity
      }
      d.connections(posBreak);
      fill(0);
      textSize(24);
      text("Break",width/2,50);
      if (a == true) {
        text("Exact Data", width/2,75);
      }
      if (a == false) {
        text("Rounded Data", width/2,75);
      }
    }
    if(key == 'q' && a == false) {
      a = true;
      PVectorSetup(hoursTotal,  posTotal);
      PVectorSetup(hoursSchool, posSchool);
      PVectorSetup(hoursBreak,  posBreak);
      fill(200,0,0);
      textSize (30);
      text("Press 1, 2, or 3 to Regraph",width/2,125);
      
    }
    if(key == 'w' && a == true) {
      a = false;
      PVectorSetupRound(hoursTotal,  posTotal);
      PVectorSetupRound(hoursSchool, posSchool);
      PVectorSetupRound(hoursBreak,  posBreak); 
      fill(200,0,0);
      textSize (30);
      text("Press 1, 2, or 3 to Regraph",width/2,125);
    }
  }
}

void prepWindow(){  
  fill(255);
  noStroke();
  rect(30,0,width,height-30);  
}
void PVectorSetupRound(float[] hours,PVector [] pos) {
  for(int i = 0; i < pos.length; i++) {
    PVector v1;
    v1 = new PVector(i%7+1,round(hours[i]));//on the hour
    pos[i] = v1;
  }
}
  
void PVectorSetup(float[] hours,PVector [] pos) {
  for(int i = 0; i < pos.length; i++) {
    PVector v1;
    v1 = new PVector(i%7+1,hours[i]);//true data
    pos[i] = v1;
  }
}

void diaSetup() {
  float n = 1;
  for(int i = 0; i < hoursTotal.length; i++) {
    for(int j = 1; j <=8 ; j++) {
      if(posTotal[i].x == j ){
        Days[j-1] = posTotal[i].y + Days[j-1];
        average[j-1] = Days[j-1]/n;
        
        println(average[j-1] + ", "+ j + "  n: " + n);
      }
    }
  }
  
  for(int i = 0; i < hoursTotal.length; i++) {
    dia[i]= 75;
  }
}

