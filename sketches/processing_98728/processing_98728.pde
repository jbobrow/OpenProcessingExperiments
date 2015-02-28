
//----UNIVERAL-----//
PFont f;    //declares font (code taken from http://www.processing.org/learning/text/)

//-----RECESSION BUTTON----//
PImage recOFF;
PImage recON;

//----COUNTING DOWN THE ROWS WITH BEN----//
int counter; // Automatically initialized at 0
final int DISPLAY_TIME = 3500; // 3500 ms = 3.5 seconds
int lastTime; // When the current image was first displayed

int Data;

String[]Year;
String[]Quarter;
String[]UsaPopulation;
String[]SwePopulation;
String[]UsaGDP;
String[]SweGDP;
String[]UsaCompany;
String[]SweCompany;

float[]UsaBirth;
float[]SweBirth;

int[]UsaREC;
int[]SweREC;


//-my own text strings-//
String[] MyText;
String[] OnCanvas;



//---SETUP----//
void setup() {
size (1000,700); //canvas
background(#210F17);

//----Images----//
recOFF=loadImage("Recession-off.png");
recON=loadImage("Recession-on.png");

//---Dataset----//
String dataLines[]=loadStrings("Usa-Swe-Data.csv");
Data=dataLines.length;

  //Text - columns
  Year = new String [Data];
  Quarter = new String [Data];
  UsaPopulation = new String [Data];
  SwePopulation = new String [Data];
  UsaGDP = new String [Data];
  SweGDP = new String [Data];
  UsaCompany = new String [Data];
  SweCompany = new String [Data];
  
  //Float - columns
  UsaBirth = new float [Data];
  SweBirth = new float [Data]; 

  //INT -columns
  UsaREC = new int [Data];
  SweREC = new int [Data];
  
  for (int counter=0;counter<Data;counter++) {
    String[] column = split(dataLines[counter], ';');

  //TEXT
  Year[counter]=(column[0]);
  Quarter[counter]=(column[1]);
  UsaPopulation[counter]=(column[5]);
  SwePopulation[counter]=(column[6]);
  UsaGDP[counter]=(column[7]);
  SweGDP[counter]=(column[8]);
  UsaCompany[counter]=(column[3]);
  SweCompany[counter]=(column[4]);

  //FLOAT
  UsaBirth[counter]=float(column[9]);
  SweBirth[counter]=float(column[10]); 

  //INT
  UsaREC[counter]=int(column[11]);
  SweREC[counter]=int(column[12]);
}


MyText = new String[10];
MyText[0]="GDP";
MyText[1]="Pop";
MyText[2]="SWEDEN";
MyText[3]="UNITED STATES";
MyText[4]="Year";
MyText[5]="Startups";

lastTime = millis();



textSize(25);
f = createFont("OpenSans-Semibold",14,true); // declares the font globally, because even as the data the sktech loads changes, I would want the font to stay the same
textAlign(CENTER);
smooth();
ellipseMode(RADIUS);
imageMode(CENTER);

}


//----VOID DRAW-----//
void draw (){   
background(#210F17);
fill(151, 167, 180, 255);

//---Roll down the dataset
OnCanvas = new String[10];

  if (millis() - lastTime >= DISPLAY_TIME) // Time to display next image
  { // Increment counter, then compute its modulo, ie. reset it at zero when reaching data.length
    counter = ++counter % Data;
    lastTime = millis();}
OnCanvas[0]=MyText[0]+" "+SweGDP[counter]; // SWEDEN GDP
OnCanvas[1]=MyText[0]+" "+UsaGDP[counter]; // USA GDP
OnCanvas[2]=MyText[1]+": "+SwePopulation[counter]; // SWEDEN POPULATION
OnCanvas[3]=MyText[1]+": "+UsaPopulation[counter]; // USA POPULATION
OnCanvas[4]=MyText[4]+": "+Year[counter]; // YEAR
OnCanvas[5]=MyText[5]+": "+UsaCompany[counter]; // USA Startups
OnCanvas[6]=MyText[5]+": "+SweCompany[counter]; // SWE Startups

int UsaRecession = UsaREC[counter];
int SweRecession = SweREC[counter];
float UsaBirthrate = UsaBirth[counter];
float SweBirthrate = SweBirth[counter];

//---Visual on the screen
//YEAR
text(OnCanvas[4], width/2, height/8);

//COUNTRY-name
text(MyText[3], 200, height/5);
text(MyText[2], 800, height/5);

//POPULATION
text(OnCanvas[3], 200, height/3);
text(OnCanvas[2], 800, height/3);

//GDP
text(OnCanvas[1], 200, height-50);
text(OnCanvas[0], 800, height-50);

//Population Bubble
ellipse(200, height-300, 160, 160); // USA population bubble
ellipse(800, height-300, 160, 160); // SWE population bubble

//Birthrate Bubbles
pushMatrix();
fill(#0C9023);
noStroke();
ellipse(200, height-300, UsaBirthrate*200, UsaBirthrate*200); // USA BirthRate bubble
ellipse(800, height-300, SweBirthrate*200, SweBirthrate*200); // SWE BirthRate bubble
popMatrix();

pushMatrix();
fill(#FF64C9);
text(OnCanvas[5], 200, height-300); //USA startups in numbers
text(OnCanvas[6], 800, height-300); //SWE startups in numbers
popMatrix();

//Recession Button
//USA
if (UsaRecession == 1){
  image(recON, 200, height-100);
} else {image(recOFF, 200, height-100);
}
//SWE
if (SweRecession == 1){
  image(recON, 800, height-100);
} else {image(recOFF, 800, height-100);
}

}
//--[0]=Year (text)
//[1]=Quarter (redundant)
//[2]=Quarter/year (redundant)
//[3]=company births in the US (redundant)
//[4]=company births in Sweden (redundant)
//[5]=US Population (text)
//[6]=SWE Population (text)
//[7]=USA GDP (text)
//[8]=SWE GDP (text)
//[9]=US birth rate/population (float)
//[10]=SWE birth rate/population (float)
//[11]=US recession (int)
//[12]=SWE recession (int)



//----UNIVERAL-----//

//String[]TextData;
//String[]IntData;
//String[]FloatData;


//TextData = new String [Data];
//IntData = new String [Data];
//FloatData = new String [Data];

//TextData[0]=(column[0]); //Year
//TextData[5]=(column[5]); //US population
//TextData[6]=(column[6]); //SWE population
//TextData[7]=(column[7]); //USA GDP
//TextData[8]=(column[8]); //SWE GDP
  
//IntData[11]=(column[11]); //USA Recession (binary 0 if not, 1 if)
//IntData[12]=(column[12]); //SWE Recession (binary 0 if not, 1 if)
  
//FloatData[9]=(column[9]); //US company birth rate/population (help determine bubble size)
//FloatData[10]=(column[10]); // SWE company birth rate/population (help determie bubble size)


