
//Mauricio Orantes
//Visualizing Data
//Attempt1

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;


void setup() {
  //This code happens once, right when our sketch is launched
 size(800,600);
 background(255);
 smooth();
 //images begin loading here
  img1 = loadImage("Star.png");
  img2 = loadImage("ea.jpg");
  img3 = loadImage("activision-logo.jpg");
  img4 = loadImage("wholefoods.jpg");
  img5 = loadImage("nas.jpg");
  //data loads here for NASDAQ all....and IMSTUCK
String dataLines[]=loadStrings("nas.csv"); 




}
//Logo call and bar graph illustrations
void draw(){ 
image(img1,30,30);
image(img2,130,30);
image(img3,230,30);
image(img4,330,30);


//Bottom Line Seperators
//Nasdaq
line(1, 450,800,450); 
image(img5, 30,500);
}


