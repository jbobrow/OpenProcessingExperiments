
//Sarah Anderson, seanders
//hw 12
//copywrite Sarah Anderson @ CMU 2012

//--------data----------
//Average Scores for girls in Critical Reading
int [] girlCR = {545,543,543,538,534,529,521,520,509,508,505,503,501,
  498,496,499,498,498,503,504,502,499,498,496,495,496,497,497,502,503,503,
  502,502,504,502,502,503,504,505,502,500,499,497,498,495,493};
//Average Scores for boys in Critical Reading  
int [] boyCR = {540,541,536,536,531,531,523,524,515,511,509,511,509,
  506,508,509,508,511,514,515,512,512,510,505,503,504,504,501,505,
  507,507,509,509,507,509,507,512,512,513,505,503,502,502,502,500,498};
//Average Girls Math Scores  
int [] girlM = {495,497,498,493,494,489,489,488,479,475,474,474,473,473,473,473,
  474,478,480,479,481,483,482,483,482,484,484,487,490,492,494,496,495,498,498,
  500,503,501,504,502,499,499,498,499,500,499};
//Average Boys Math Scores  
int [] boyM = {535,533,534,531,529,527,525,524,518,520,520,517,516,
  515,516,516,516,518,522,523,523,521,523,521,520,521,524,523,525,527,
  530,531,531,533,533,534,537,537,538,536,532,532,533,533,531,532};
//Total Average Critical Reading Scores
int [] totalCR = {543,543,540,537,532,530,523,521,512,509,507,507,505,
  502,502,504,503,504,509,509,507,505,504,500,499,500,500,499,504,505,505,505,505,
  505,506,504,507,508,508,503,501,500,499,500,497,496};
//Total Average Math Scores  
int [] totalM = {516,516,517,512,513,509,506,505,498,497,496,494,493,
  492,492,493,494,497,500,500,501,501,502,501,500,501,503,504,506,508,
  511,512,511,514,514,516,519,518,520,518,514,514,514,515,514,514};

//---------------------
//Global Variables
float leftEdge, rightEdge, topEdge, botEdge;
color colB, colG, colCR, colM, col1, col2;
final int firstYr = 1967;
final int lastYr = 2012;
float mean,median,deltaX, deltaY;
int phase, minValue, maxValue;
boolean flag;


void setup(){
//Basic Setup  
  size(1200,600);
  background(50);
  smooth();
  textSize(12);
  textAlign(CENTER,CENTER);
  rectMode(CORNER);
//Graph Demensions
  leftEdge=80;
  rightEdge=width-20;
  topEdge=50;
  botEdge=height-80;
  minValue = 470;
  maxValue = 550;
//Graph Changing  
  phase=0; 
//Colors  
  colB = color(80,80,255);
  colG = color(255,0,150);
  colCR = color(255,100,0);
  colM = color(0,100,200);
  col1 = color(255,0,0);
  col2 = color(0,0,255);

  flag=false;
}

void draw(){
//Switches between the different Graphs/Pages  
  if(phase==0){
    titlePage();//Starts out on the Title Page  
  }
  if(phase==1){
    graphCR(); //Critical Reading Graph
    drawTrendLine(boyCR,col2);
    //drawTrendLine(girlCR,col1);
  }
  else if(phase==2){
    graphM(); //Mathematics Graph
  }
  else if(phase==3){
    graphTotal(); //Both CR & Math Total Average Graphs
  }
  else if(phase==4){
    fastFacts(); //Some Quick fun Facts
  }
}


//Changes the grahps/pages as indicated in draw
void keyPressed(){
  if(key=='1'){
    phase=1;
    flag=true;  
  }
  else if(key=='2'){
    phase=2;
  } 
  else if(key=='3'){
    phase=3;
  }
  else if(key=='4'){
    phase=4;
  }
}


//Slide of fast Facts about CR & Math trends/History
void fastFacts(){
//set up colored boxes  
  background(50);
  stroke(0);
  fill(colCR,100);
  rect(width/2,0,width/2,height/2);
  fill(colM, 100);
  rect(0,height/2,width/2, height/2);  
//"Fast Facts"  
  textSize(60);
  fill(200);
  text("Fast", width/4, height/4);
  text("Facts", width-(width/4), height-(height/4));
//"Critical Reading"
  fill(colM);
  textSize(30);
  text("Critical Reading", width-(width/4), 30);
//"Mathematics"  
  fill(colCR);
  text("Mathematics",width/4, (height/2) +30);
// Fun facts for CR
  textSize(18);
  fill(0);
  text("Average Score in 1967 = " + avgScore1967(totalCR), width-(width/4), 70);
  text("Average Score in 2012 = " + avgScore2012(totalCR), width-(width/4), 100);
  text("Point Difference = " + abs(avgScore1967(totalCR)-avgScore2012(totalCR)), width-(width/4), 130);
  text("Lowest Scoring Year = " + lowScoreYr(totalCR), width-(width/4), 160);
  text("Lowest Score = " + min(totalCR), width-(width/4), 190);
  text("Highest Scoring Year = " + highScoreYr(totalCR), width-(width/4), 220);
  text("Highest Score = " + max(totalCR), width-(width/4), 250);
//fun facts for Math
  text("Average Score in 1967 = " + avgScore1967(totalM), width/4, (height/2)+70);
  text("Average Score in 2012 = " + avgScore2012(totalM), width/4, (height/2)+100);
  text("Point Difference = " + abs(avgScore1967(totalM)-avgScore2012(totalM)), width/4, (height/2)+130);
  text("Lowest Scoring Year = " + lowScoreYr(totalM), width/4, (height/2)+160);
  text("Lowest Score = " + min(totalM), width/4, (height/2)+190);
  text("Highest Scoring Year = " + highScoreYr(totalM), width/4, (height/2)+220);
  text("Highest Score = " + max(totalM), width/4, (height/2)+250);
}


int highScoreYr(int [] arrays){
  int high=0;
  for (int i=0; i<arrays.length; i++){
    int years=i+firstYr;
    if(arrays[i]==max(arrays)){
      high=years;  
    }  
  }
  return high;  
}

int lowScoreYr(int [] arrays){
  int low=0;
  for (int i=0; i<arrays.length; i++){
    int years=i+firstYr;
    if(arrays[i]==min(arrays)){
      low=years;  
    }  
  }
  return low;  
}

int avgScore1967(int [] arrays){
  return arrays[0]; 
}

int avgScore2012(int [] arrays){
  return arrays[arrays.length-1];  
}

//Title page of program
void titlePage(){
  background(50);
  fill(200);
  textSize(30);
  text("SAT Critical Reading and Mathematics Scores", width/2, 50);  
  text("1967-2012", width/2, 100);
  textSize(25);
  fill(0);
//Instructions  
  text("Press '1' for Boys & Girls Critical Reading Scores", width/2, 200);
  text("Press '2' for Boys & Girls Mathematics Scores", width/2, 270);
  text("Press '3' for Total Critical Reading and Mathematics Scores", width/2, 340);
  text("Press '4' for Fast Facts on Critical Reading and Mathematics Scoring History", width/2, 410);
  fill(180);
//Source citing  
  text("Data Taken from: http://www.erikthered.com/tutor/sat-act-history.html", width/2, 500);
}
//Graph of CR & Math
void graphTotal(){
  background(50);
  fill(0);
  textSize(18);
  text("SAT Total Critial Reading and Mathematics Scores", width-270, 50);
  text("Years", width/2, botEdge+50);
  text("Scores", 40, height/2);
  textSize(12);
  plotData(totalM, colM);
  plotData(totalCR, colCR);
  plotMean(totalM,colM);
  plotMean(totalCR,colCR);
  plotMedian(totalM, colM);
  plotMedian(totalCR,colCR);  
  stroke(0);
  textSize(14);
  fill(colCR);
  rect(width/3, 30, 20,20);
  fill(colM);
  rect(width/3, 60,20,20);
  fill(0);
  text("Critical Reading Scores", (width/3)+110, 40); 
  text("Mathematics Scores", (width/3)+100, 70);
}
//Graph of total Math scores
void graphTotalM(){
  background(50);
  fill(0);
  textSize(18);
  text("SAT Total Mathematics Scores", width-270, 50);
  text("Years", width/2, botEdge+50);
  text("Scores", 40, height/2);
  textSize(12);
  plotData(totalM, 255);
  plotMean(totalM,255);
  plotMedian(totalM, 255);
  //noLoop();    
}
//Graph of total CR scores
void graphTotalCR(){
  background(50);
  fill(0);
  textSize(18);
  text("SAT Total Critical Reading Scores", width-270, 50);
  text("Years", width/2, botEdge+50);
  text("Scores", 40, height/2);
  textSize(12);
  plotData(totalCR, 255);
  plotMean(totalCR,255);
  plotMedian(totalCR, 255);
  //noLoop();    
}

//Graph of boys and girls math scores
void graphM(){
  background(50);
  fill(0);
  textSize(18);
  text("SAT Mathematics Scores for Graduating Boys and Girls", width-270, 50);
  text("Years", width/2, botEdge+50);
  text("Scores", 40, height/2);
  textSize(12);
  plotData(boyM, colB);
  plotData(girlM, colG);
  plotMean(boyM,colB);
  plotMean(girlM,colG);
  plotMedian(boyM, colB);
  plotMedian(girlM, colG);
  stroke(0);
  textSize(14);
  fill(colB);
  rect(width/3, 30, 20,20);
  fill(colG);
  rect(width/3, 60,20,20);
  fill(0);
  text("Boys Scores", (width/3)+100, 40); 
  text("Girls Scores", (width/3)+100, 70);
  //noLoop();  
}
//graph of boys and girls CR scores
void graphCR(){
  background(50);
  fill(0);
  textSize(18);
  text("SAT Critical Reading Scores for Graduating Boys and Girls", width-270, 50);
  text("Years", width/2, botEdge+50);
  text("Scores", 40, height/2);
  textSize(12);
  plotData(boyCR, colB);
  plotData(girlCR, colG);
  plotMean(boyCR,colB);
  plotMean(girlCR,colG);
  plotMedian(boyCR, colB);
  plotMedian(girlCR, colG);
  stroke(0);
  textSize(14);
  fill(colB);
  rect(width/3, 30, 20,20);
  fill(colG);
  rect(width/3, 60,20,20);
  fill(0);
  text("Boys Scores", (width/3)+100, 40); 
  text("Girls Scores", (width/3)+100, 70);
}
//Plotting the median
void plotMedian(int [] arrays, color col){
  median = computeMedian(arrays);
  float y=map(median,maxValue,minValue,topEdge,botEdge);
  stroke(col);
  strokeWeight(2); 
  line(leftEdge, y, rightEdge, y);
  fill(200);
  text("Median", leftEdge+20, y-10); 
  text(int(median), rightEdge-20, y-10);
}
//Computing the Median
float computeMedian(int [] arrays){
  int [] sortedArrays=sort(arrays);
  int medianIndex=arrays.length/2;
  float median=arrays[medianIndex];
  return median;
}
//Plotting the Mean
void plotMean(int [] arrays,color col){
  mean=computeMean(arrays);
  float y= map(mean, maxValue, minValue,topEdge,botEdge);
  stroke(col); 
  strokeWeight(2);
  line(leftEdge, y, rightEdge, y);
  fill(200);
  text("Mean", leftEdge+20,y-10);  
  text(int(mean), rightEdge-20, y-10);
}
//Computing the Mean
float computeMean(int [] arrays){
  float sum = 0;
  for(int i=0; i<arrays.length; i++){
    sum+=arrays[i];
  } 
  float mean = sum/arrays.length;
  return mean;
}

//draws trend line
void drawTrendLine(int [] arrays, color col){
  fill(col);
  stroke(col);
  float y1=map(arrays[0], maxValue, minValue, topEdge, botEdge);
  float y2=map(arrays[arrays.length-1], maxValue, minValue, topEdge, botEdge);
  float x1 = leftEdge;
  float x2= rightEdge;
  float tx=x1;
  float ty=y1;


  //float x = leftEdge;
  //float y = map(arrays[0], maxValue, minValue, topEdge, botEdge);
  if(flag){
    deltaX= abs(x1-x2)/200;
    deltaY= abs(y1-y2)/200; 
    flag=false; 
    println(deltaX + "  " + deltaY);    
  }
  line(x1,y1,tx,ty);
  if(true){
    tx+=deltaX;
    ty+=deltaY;
  println(tx + "  " + ty + "  " + frameCount);      
  }
  else{
    deltaX=0;
    deltaY=0;  
  }
}

//Program to graph and plot the given data
void plotData(int [] arrays,color col){
  fill(0);
  float oldX=0;
  float oldY=0;
  for(int i=0; i<arrays.length; i++){
    float x=map(i,0,arrays.length,leftEdge, rightEdge);
    float y= map(arrays[i], maxValue, minValue, topEdge, botEdge);//or 550, 470 , max, min
    stroke(col);
    strokeWeight(9);
    point(x,y);
    fill(0);
    text(minValue, leftEdge-20, botEdge);
    text(maxValue, leftEdge-20,topEdge);
    int years=(i+firstYr)%100;
    if(years<10){
      fill(0);
      text("0" + years, x, botEdge+20);  
    }
    else{
      fill(0);
      text(years, x, botEdge+20);
    }
    if(i>0){
      if(y < oldY){
        stroke(0,200,0);  
      }
      else{
        stroke(255,0,0);  
      }
      strokeWeight(1);
      line(oldX,oldY,x,y);  
    }
    stroke(0);
    strokeWeight(1);
    fill(col,100);
    oldX=x;
    oldY=y;
  }  
}


