
String[] data_in;
float[][] temps;
float[] averages;
float[] year_averages;
float timeseries_average;
int numyears = 68;
float tempscale = 10.0;
float yearscale = 15.0;
float yearGraphY = 560;
int selYear = 0;
int firstYear;
PFont font;
String[] monthnames = {"jan","feb","mar","apr","may","jun","jul","aug","sept","oct","nov","dec"};

void setup(){
  size(800,650);
  data_in = loadStrings("SYD.csv");//"CBR1939_2009.csv");
  numyears = data_in.length;
  temps = new float[numyears][12];
  averages = new float[12];
  year_averages = new float[numyears];
  parseData();
  font = createFont("Arial",36);
  smooth();
}

void draw(){
  background(0);
  textFont(font,14);
  fill(255,255);
  textAlign(CENTER);
  float yearX = 50+((700.0*selYear)/numyears);
  text(selYear+firstYear,yearX,yearGraphY+50);
  text(nf(year_averages[selYear],1,1)+"°",yearX,yearGraphY-50);
  
  stroke(255,100);
  line(yearX,yearGraphY-40,yearX,yearGraphY+30);
  drawYears(yearGraphY);
  translate(400,250);
  stroke(200);
  fill(100);
  monthLabels();
  noFill();

  for (int y=0; y<numyears; y++){
    stroke(255,10);
    drawMonths(temps[y]);
  }

  strokeWeight(2);
  stroke(255,0,0,100);
  drawMonths(averages);

  strokeWeight(1);
  stroke(255,255);
  drawMonths(temps[selYear]);
}


void drawMonths(float[] months){
  beginShape();
  for (int m=0; m<12; m++){
    float theta = (TWO_PI/12.0)*m - HALF_PI;
    float temp = (months[m]*tempscale);
    float diff = 150 + (10.0*(months[m] - averages[m]));
    vertex(cos(theta)*diff,sin(theta)*diff);
  }
  endShape(CLOSE);
}

void monthLabels(){
  textFont(font,12);
  for (int m=0; m<12; m++){
    float theta = (TWO_PI/12.0)*m - HALF_PI;
    text(monthnames[m],cos(theta)*200,sin(theta)*200);
  }
  
}


void drawYears(float ybase){
  stroke(255);
  noFill();
  beginShape();
  for (int y=0; y<numyears; y++){
    vertex(50+(y*(700.0/numyears)),ybase-((year_averages[y]-timeseries_average)*yearscale));
  }
  endShape();
  stroke(255,0,0,100);
  line(50,ybase,750,ybase);
}


void parseData(){
  println(data_in.length);
  for (int i=0; i<data_in.length; i++){
    String[] row = split(data_in[i],',');
    if (i == 0) firstYear = int(row[0]);
    float[] flrow = float(row);
    float[] trimrow = subset(flrow,1);
    temps[i] = trimrow;
    for (int j=0; j<12; j++){
      if (i>(1961-firstYear) && i<(1990-firstYear)) averages[j] += temps[i][j]; // make the average 1961-1990
    } 
    year_averages[i] = aveArray(temps[i]);
  } 
  for (int j=0; j<12; j++){
    averages[j]  = averages[j]/29;//(data_in.length-1);
  }
 // float[] twentyyear = subset(year_averages,1961-firstYear,1990-firstYear);
  timeseries_average = aveArray(averages);//year_averages);
} 


void keyPressed(){
  if (keyCode == RIGHT){
    selYear = min (numyears-1, selYear+1);
  } 
  else if (keyCode == LEFT){
    selYear = max (0, selYear-1);
  } 
}


float aveArray(float[] A){
  float ave = 0;
  for (int i=0; i<A.length; i++){
    ave += A[i]; 
  }
  ave = ave/A.length;
  return ave;
}



