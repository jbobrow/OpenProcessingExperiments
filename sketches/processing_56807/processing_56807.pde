
//Homework12
//Vishal Agrawal
//vishala@andrew.cmu.edu
//copyright (C) 2012

// ---Set1---(3 Input + find)
// Raw Data 
//float [ ] unknown1 = { 0,0.0979,0.163,0.2401,0.289,0.3661,0.4268,0.5195,1.0259,1.1199,1.4111,1.5341,1.6764,1.7619,1.8018,1.9481,1.9338,2.0004,2.1226,2.2155,2.398,2.4928 };
//float [ ] unknown2 = { 0,0.1051,0.1779,0.2632,0.306,0.3723,0.442,0.5236,0.9556,1.0274,1.3867,1.4852,1.5641,1.6457,1.7215,1.84,1.8675,1.9375,2.0507,2.1415,2.2691,2.3623 };
//float [ ] unknown3 = { 0,0.1095,0.1757,0.2633,0.3169,0.39,0.4449,0.5349,0.8814,0.9693,1.3079,1.4207,1.4706,1.5572,1.6109,1.7154,1.7326,1.7954,1.9028,1.9846,2.1159,2.1919 };

// Match 
//float [ ] unknown4 = { 0, 0.137, 0.1992, 0.2612, 0.5349, 0.6452, 1.8841, 1.9852, 2.5058, 2.5481, 2.8535, 2.9747, 3.0447, 3.1261, 3.1121, 3.2421, 3.2305, 3.2934, 3.3369, 3.4296, 3.5453, 3.605 };
//float [ ] unknown4 = { 0, 0.0892, 0.1216, 0.1987, 0.2531, 0.3226, 0.3049, 0.3902, 0.5074, 0.5758, 0.7876, 0.8921, 1.036, 1.1722, 1.2011, 1.3072, 1.3751, 1.523, 1.463, 1.5671, 1.6573, 1.7544 };
//float [ ] unknown4 = { 0,0.1074,0.1525,0.2396,0.2972,0.3685,0.4213,0.5076,0.9636,1.047,1.3678,1.4666,1.5537,1.6461,1.6863,1.7879,1.8067,1.8735,1.9801,2.0659,2.189,2.2774 };
//float [ ] unknown4 = { 0, 0.0884, 0.1073, 0.2369, 0.2023, 0.3174, 0.3296, 0.4899, 0.4526, 0.6042, 0.6898, 0.917, 0.8484, 0.9426, 1.0095, 1.1051, 1.0383, 1.1615, 1.1065, 1.2053, 1.1542, 1.2907 };
//float [ ] unknown4 = { 0,0.1196,0.1356,0.2246,0.3022,0.3764,0.42,0.505,1.0747,1.1571,1.581,1.7006,1.841,1.9284,1.9541,2.0985,2.1413,2.2234,2.4923,2.6132,2.7841,2.8865 };

// ---Set2---(All different)
float [ ] unknown1 = { 0, 0.137, 0.1992, 0.2612, 0.5349, 0.6452, 1.8841, 1.9852, 2.5058, 2.5481, 2.8535, 2.9747, 3.0447, 3.1261, 3.1121, 3.2421, 3.2305, 3.2934, 3.3369, 3.4296, 3.5453, 3.605 };
float [ ] unknown2 = { 0, 0.0892, 0.1216, 0.1987, 0.2531, 0.3226, 0.3049, 0.3902, 0.5074, 0.5758, 0.7876, 0.8921, 1.036, 1.1722, 1.2011, 1.3072, 1.3751, 1.523, 1.463, 1.5671, 1.6573, 1.7544 };
float [ ] unknown3 = { 0,0.1074,0.1525,0.2396,0.2972,0.3685,0.4213,0.5076,0.9636,1.047,1.3678,1.4666,1.5537,1.6461,1.6863,1.7879,1.8067,1.8735,1.9801,2.0659,2.189,2.2774 };
float [ ] unknown4 = { 0, 0.0884, 0.1073, 0.2369, 0.2023, 0.3174, 0.3296, 0.4899, 0.4526, 0.6042, 0.6898, 0.917, 0.8484, 0.9426, 1.0095, 1.1051, 1.0383, 1.1615, 1.1065, 1.2053, 1.1542, 1.2907 };

// Names for Data
String name1 = "unknown1";
String name2 = "unknown2";
String name3 = "unknown3";
String name4 = "unknown4";

// Length between Key(s) Pressed
float [ ] length1 = new float[unknown1.length];
float [ ] length2 = new float[unknown2.length];
float [ ] length3 = new float[unknown3.length];
float [ ] length4 = new float[unknown3.length];

// X Co-ordinates for Lines
float [ ] xLine1 = new float[unknown1.length];
float [ ] xLine2 = new float[unknown2.length];
float [ ] xLine3 = new float[unknown3.length];
float [ ] xLine4 = new float[unknown3.length];

// Y Co-ordinates for Lines
float [ ] yLine1 = new float[unknown1.length];
float [ ] yLine2 = new float[unknown2.length];
float [ ] yLine3 = new float[unknown3.length];
float [ ] yLine4 = new float[unknown3.length];

// Color combination used
color [ ] rainbow = {color(66, 165, 222, 100), color(9, 150, 46, 100), color(249, 233, 24, 100), color(209, 13, 35, 100)};
color [ ] rainbowContent = {color(66, 165, 222), color(9, 150, 46), color(249, 233, 24), color(209, 13, 35)};
color nameData = color(255, 255, 255, 255);

// Password
char [ ] word = {'.','t','i','e','5','R','o','a','n','1'}; 

// Scale
float s=200.0;

// Distance between blocks
float d=10;

// Lateral (2D) Motion
float lateralx, increaseLateralx;
float lateraly, increaseLateraly;
float lateralz, increaseLateralz;

// Rotational (3D) Motion
int rotationx, rotationxIncrease;
int rotationy, rotationyIncrease;
int rotationz, rotationzIncrease;

// # of keyboard inputs to display
int display=word.length;

// Load font
PFont font;

void setup( )
{
  font= loadFont("helveticaBold.vlw"); 
  
  // Size of Graphics Window
  size( 800, 800, P3D );

  // Setting Background Color to Black
  background( 0 );
  
  // Lighting
  lights( );
  
  // Initializations  
  lateralx = 0;
  increaseLateralx= (width*0.01); 
 
  lateraly = 0;
  increaseLateraly= (height*0.01); 
  
  lateralz = 0;
  increaseLateralz= (height*0.1); 
  
  rotationx = 0;
  rotationxIncrease = 10;
  
  rotationy = 0;
  rotationyIncrease = 10;
  
  rotationz = 0;
  rotationzIncrease = 10;
  
  computeLength( );
 
}











