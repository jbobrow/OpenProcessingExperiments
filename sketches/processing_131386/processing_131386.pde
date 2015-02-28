
/*  CS 591 HW1 
Marco Espinoza
maespinozas0188@gmail.com
*/


/*
1 get data from csv and put them in arrays
2 define plot area 
3 Plot first category


*/


ArrayList arrayState= new ArrayList();
ArrayList array1= new ArrayList(); //Current expenditure per pupil in average daily attendance in public elementary and secondary schools (thousands of dollars)
ArrayList array2= new ArrayList();//Average pupil/teacher ratio in public elementary and secondary schools
ArrayList array3= new ArrayList();//Estimated average annual salary of teachers in public elementary and secondary schools
ArrayList array4= new ArrayList(); //Percentage of all eligible students taking the SAT
ArrayList array5= new ArrayList(); //Average verbal SAT score
ArrayList array6= new ArrayList(); //Average math SAT score
ArrayList array7= new ArrayList(); //Average total score on the SAT
ArrayList activeArray=new ArrayList();
String[] axisXlabel;

float plotX1, plotY1;
float plotX2, plotY2;
PFont pFTitle, pFLabels, pFAxes,pFCategory, pFTooltip; 


float minvalue,maxvalue;
int w,h;

//Colors
color barColor=color(200,100,150);//kind of pink

//Graph controL
int prev=1, next=1;
boolean overTooltip,tooltipOn;

void setup(){
//size(1024, 768);
loadDataset();
w=round(1024);
h=round(768);
size(1024, 768);
plotX1=round(w*.1);
plotX2=round(w-plotX1);
plotY1=round(h*.10);
plotY2=round(h-plotY1);

//plot area rectangle
rectMode(CORNERS);
fill(100,40,40,40);
strokeWeight(3); 
//rect(plotX1, plotY1, plotX2, plotY2);
line(plotX1,plotY2,plotX2, plotY2);
line(plotX1,plotY1,plotX1, plotY2);

strokeWeight(1);

//Fonts
pFLabels=createFont("SansSerif", 18);
pFTitle=createFont("SansSerif",25);
pFAxes=createFont("SansSerif",23);
pFCategory=loadFont("categoryFont.vlw");
pFTooltip=loadFont("tooltipFont.vlw");

plotCategory(arrayState,array1);
activeArray=array1;

//quad(plotX2, plotY1-30, plotX2-20, plotY1-5, plotX2+20, plotY1-5, plotX2+25, plotY1-20);
fill(0);
ellipse(plotX2,plotY1*.5,20,20);
textAlign(CENTER);
textSize(20);
text("Tooltip",plotX2+25,plotY1*.25);
}

void draw(){
//Plot visualization
//update(mouseX,mouseY);
//plotStates(arrayState);

//plotCategory(arrayState,array1);
//barColor=color(50,200,50);
tooltipActive();



}


// ################FUNCTIONS#######################

void loadDataset(){
  String[] lines=loadStrings("dataset.csv");
  String[] stringfromfile;
  for(int i=0; i<lines.length*.5;i++){
    stringfromfile=split(lines[i],",");
    arrayState.add(stringfromfile[0]);
    if(i==0){
    array1.add((stringfromfile[1]));
    array2.add((stringfromfile[2]));
    array3.add((stringfromfile[3]));
    array4.add((stringfromfile[4]));
    array5.add((stringfromfile[5]));
    array6.add((stringfromfile[6]));
    array7.add((stringfromfile[7]));
    }
    else{
    array1.add(float(stringfromfile[1]));
    array2.add(float(stringfromfile[2]));
    array3.add(float(stringfromfile[3]));
    array4.add(float(stringfromfile[4]));
    array5.add(float(stringfromfile[5]));
    array6.add(float(stringfromfile[6]));
    array7.add(float(stringfromfile[7]));
    }
  }
  
}

void plotCategory(ArrayList arrayState, ArrayList arrayCategory){
  cleanGraph();
  stroke(255,255,255);
  fill(100,50,255); //States label color 
  int offset= arrayState.size()+2;
  float distx= (plotX2-plotX1)/10; //offset between labels
  float disty= (plotY2-plotY1)/offset;
  float value;
  maxvalue=getmaxvalue(arrayCategory);
  minvalue=0;
  float increasex=getmaxvalue(arrayCategory)/10;
  //float increasey=(maxvalue-minvalue)/10;
  int c=10;
  for(int m=1;m<arrayState.size();m++)
  {
    textFont(pFLabels);
    //text((String)(arrayState.get(m)),plotX1-150,plotY2-(disty)*(m));
      fill(0);
      textAlign(RIGHT);
      text((String)(arrayState.get(m)),plotX1-10,plotY1+2*disty+(disty)*(m));
      //do rectangle
      rectMode(CORNERS);
      fill(barColor);
      strokeWeight(1);
      stroke(0);
      value=map((Float)arrayCategory.get(m),minvalue,maxvalue,plotX1,plotX2); // goes in third position in rect
      if(m==0)
      {
      rect(plotX1, plotY1+(disty), value, plotY1+2*disty);
      fill(0);
      //text(m,plotX1+50, plotY1+2*disty+(disty)*(m));
      if(tooltipOn){
      //textSize(15);
      //textFont(pFTooltip);
      text((Float)(arrayCategory.get(m)),value-5, plotY1+2*disty+(disty)*(m));}
      }
      else
     { 
      rect(plotX1, plotY1+(disty)*(m+1),value, plotY1+(disty)*(m+1)+disty);
      fill(0);
      //text(m,plotX1+50, plotY1+2*disty+(disty)*(m));
      if(tooltipOn){
      //textFont(pFTooltip);
      //textSize(15);
      text((Float)arrayCategory.get(m),value-5, plotY1+2*disty+(disty)*(m));}
      //text((String)(arrayState.get(m)),plotX1-150,plotY1+disty+(disty)*(m)); //If align left
     }
  }
  //plot X axis label
  for(int m=0;m<11;m++)
  {
    if(m==0)
    {
      text(minvalue,plotX1,plotY2+20);
    }
    else
    {
      text(minvalue+increasex*(m),plotX1+(distx)*(m),plotY2+20);
    }
  }
  textAlign(LEFT);
  //textMode(SHAPE);
  //textFont(pFAxes);
  textFont(pFCategory);
  textSize(35);
  fill(200,50,50);
  text(" Getting What You Pay For: The Debate Over Equity in Public School Expenditures ",plotX1,plotY1-50,plotX2-plotX1,plotY1-5);
  //Title
  text(" Getting What You Pay For: The Debate Over Equity in Public School Expenditures ",plotX1,plotY1-48,plotX2-plotX1,plotY1-5);
  //fill(0);
  textSize(20);
  fill(255);
  text((String)arrayCategory.get(0),plotX1,plotY2+29,plotX2-plotX1,plotY2*1.3);
  //fill(0);
  fill(200,50,50);
  text((String)arrayCategory.get(0),plotX1,plotY2+32,plotX2-plotX1,plotY2*1.3);
  textAlign(RIGHT);
  text("States",plotX1*.85,plotY1*.85);
  textAlign(CENTER);
  textSize(20);
  text("Tooltip",plotX2+25,plotY1*.25);
  textSize(12);
  text("Use left and right keys\n to change contents\n of the graph",plotX2,plotY1);

  
}

void plotStates(ArrayList arrayState){
  stroke(255,255,255);
  fill(100,50,255); //States label color 
  int offset= arrayState.size()+2;
  float distx= (plotX2-plotX1)/offset; //offset between labels
  float disty= (plotY2-plotY1)/offset;
  //float increasex=(Float)(arraytime.get(arraytime.size()-1))/10;
  //float increasey=(maxvalue-minvalue)/10;
  for(int m=0;m<offset-2;m++)
  {
    textFont(pFLabels);
    //text((String)(arrayState.get(m)),plotX1-150,plotY2-(disty)*(m));
    if(m==0 || m==offset)
    {
      //no plot to keep some space in the borders
      textAlign(RIGHT);
      text((String)(arrayState.get(m)),plotX1-10,plotY1+2*disty+(disty)*(m));
    }
    else
    {
      textAlign(RIGHT);
      text((String)(arrayState.get(m)),plotX1-10,plotY1+2*disty+(disty)*(m));
      //text((String)(arrayState.get(m)),plotX1-150,plotY1+disty+(disty)*(m)); //If align left
    }
  }
}

//Adapt for custom features buttons
void update(int x, int y) {
  /*if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = false;
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = rectOver = false;
  }*/
}

private float getmaxvalue(ArrayList array1)
{
  println("Getting initial max value:", array1.get(1));
  float maxval=(Float)array1.get(1);
  for(int i=1;i<array1.size();i++)//i=1 to omit column labels
  {
    if(maxval<(Float)array1.get(i))
    maxval=(Float)array1.get(i);
  }
 // println("Getting max value:", maxval);
  return maxval;
  
}

void cleanGraph()
{
  background(255);
  background(240,240,240);
  //plot area rectangle
  rectMode(CORNERS);
  fill(235,235,235);//rectangles  
  strokeWeight(3); 
  //rect(plotX1, plotY1, plotX2, plotY2);
  //stroke(200);
  line(plotX1,plotY2,plotX2, plotY2);
  //stroke(126);
  line(plotX1,plotY1,plotX1, plotY2);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (next==7){next=1;}
      else{
      next++;}
    } else if (keyCode == LEFT) {
      if(next==1){next=7;}
      else{
      next--;}
    } 
  } else {
    cleanGraph();
  }
  //println("next is" +next);
  
  switch(next){
    case 1:
    //barColor=color(random(255),random(255),random(255));
    barColor=color(255,233,65);
    plotCategory(arrayState,array1);
    activeArray=array1;
    break;
    case 2:
    barColor=color(151,132,255);
    plotCategory(arrayState,array2);
    activeArray=array2;
    break;
    case 3:
    barColor=color(21,144,58);
    plotCategory(arrayState,array3);
    activeArray=array3;
    break;
    case 4:
    barColor=color(192,91,25);
    plotCategory(arrayState,array4);
    activeArray=array4;
    break;
    case 5:
    barColor=color(146,173,192);
    plotCategory(arrayState,array5);
    activeArray=array5;
    break;
    case 6:
    barColor=color(103,173,192);
    plotCategory(arrayState,array6);
    activeArray=array6;
    break;
    case 7:
    barColor=color(38,151,192);
    plotCategory(arrayState,array7);
    activeArray=array7;
    break;
    
  }
  
  
}

void tooltipActive()
{
  if(mouseX>plotX2-20 && mouseX<plotX2+20 && mouseY>plotY1*.5-20 && mouseY<plotY1*.5+20)
  {
  overTooltip=true;
  fill(255);
  ellipse(plotX2,plotY1*.5,20,20);}
  else
  {
    overTooltip=false;
    fill(0);
    ellipse(plotX2,plotY1*.5,20,20);}
}

void mousePressed() {
  if(overTooltip){
  tooltipOn=!tooltipOn; //switch state of boolean
  plotCategory(arrayState,activeArray);
  //println("yeah");
  }
  
}
  








