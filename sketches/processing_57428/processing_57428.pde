
//Mauricio Orantes
//Visualizing Data
//Attempt1

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
//new int
int n;
int Qty;
String[] nas;
String[] nasdaqFull,actatable;
float[] sbuxFull, Blizz;
int startX, startY;



void setup() {
  //This code happens once, right when our sketch is launched
  size(800, 600);
  background(255);
  smooth();
  //images begin loading here
  img1 = loadImage("Star.png");
  img2 = loadImage("ea.jpg");
  img3 = loadImage("activision-logo.jpg");
  img4 = loadImage("wholefoods.jpg");
  img5 = loadImage("nas.jpg");
  //data loads here for NASDAQ all....and IMSTUCK


  String nas[]=loadStrings("nas.csv"); //Entire NasDaq Data
  Qty=nas.length;
  n=Qty;
  nasdaqFull = new String[Qty];
  for (int counter = 0;counter<Qty; counter++) {
    String[]temp=split(nas[counter], ',');
    nasdaqFull[counter]=temp[4];
  }
  //Blizzard - Activision
  String actatable[]=loadStrings("actatable.csv");// this is the specific traded company data csv
  Qty=actatable.length;
  n=Qty;
  Blizz = new float [Qty];//NEEDS TO BE FLOAT not STRING

  for (int counter=1;counter<Qty-1;counter++) {
    String[] temp = split(actatable[counter], ',');
    Blizz[counter]=float(temp[4]);
  }
  
  
}
//Logo call and bar graph illustrations
void draw() { 
  image(img1, 30, 30);
  image(img2, 130, 30);
  image(img3, 230, 30);
  image(img4, 330, 30);

//Creating a Table Confine for Data Rep
rect (50,125,700,450);
fill(255);


//Graphing
//Activision/Blizzard Data Representation
for (int counter= 1;counter<Qty-1;counter++){
  float maxactatable=map(Blizz[counter],12.1,max(Blizz),575,125);
  float maxactatable2=map(Blizz[counter+1],12.1,max(Blizz),575,125);
line(counter*18.9+50,maxactatable,(counter+1)*18.9+50,maxactatable2);
strokeWeight(1);
}

  //Bottom Line Seperators
//Nasdaq
line(1, 450,800,450); 
image(img5, 30,500);
}





