


PImage groundFelt;
PImage groundCard;

PFont font;

int phraseContentCount=55;  //not random
int contentCounter;
int phraseCompanyCount=23;
int phraseJobsCount=26;
int phraseLocationCount=20;
int phraseNameCount=61;

float flip;

String[] phraseCompany;
String[] phraseContent;
String[] phraseJobs;
String[] phraseLocation;
String[] phraseName;

//x and y variables for strings
float contentX=250;
float contentY=240;
float jobsX=250;
float jobsY=135;
float companyX=490;
float companyY=20;
float locationX=10;
float locationY=20;
float nameX=250;
float nameY=110;

void setup(){
 size (500,250);
 groundFelt = loadImage("backgroundv3.jpg");
 groundCard = loadImage("CARDPROJECTION.jpg");
 font = loadFont ("GaramondPremrPro-30.vlw");
 frameRate(.5);
 smooth();
 textFont(font);
 



