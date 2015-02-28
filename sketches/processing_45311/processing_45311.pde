
// source: NationMaster.com

PImage bg;
PFont font;
PFont small;


Piracy Armenia;
Piracy UK;
Piracy USA;
Piracy China;
Piracy Peru;
Piracy Greece;
Piracy Spain;
Piracy NewZealand;
Piracy Sweden;
Piracy India;
Piracy Tunisia;
Piracy Canada;
Piracy SouthAfrica;
Piracy Mauritius;
Piracy Mexico;
Piracy SouthKorea;
Piracy Guatemala;
Piracy Kenya;
Piracy Azerbeijan;
Piracy Czech;
Piracy PuertoRico;
Piracy ElSalvador;
Piracy SriLanka;
Piracy Zambia;
Piracy Australia;
Piracy Singapore;
Piracy Brazil;
Piracy Egypt;
Piracy Japan;
Piracy Poland;
Piracy Turkey;
Piracy Russia;
Piracy Switzerland;
Piracy Iceland;
Piracy Iraq;

String[] country = {
  "Armenia",
  "United Kingdom",
  "United States",
  "China",
  "Peru",
  "Greece",
  "Spain",
  "New Zealand",
  "Sweden",
  "India",
  "Tunisia",
  "Canada",
  "South Africa",
  "Mauritius",
  "Czech Republic",
  "South Korea",
  "Turkey",
  "Kenya",
  "Azerbeijan",
  "Mexico",
  "Puerto Rico",
  "El Salvador",
  "Sri Lanka",
  "Zambia",
  "Australia",
  "Singapore",
  "Brazil",
  "Egypt",
  "Japan",
  "Poland",
  "Guatemala",
  "Russia",
  "Switzerland",
  "Iceland",
  "Iraq"
  
};

void setup(){
  size(640,350);
  bg = loadImage("bg.png");
  background(bg);
  smooth();
  
  font = loadFont("font.vlw"); 
  small = loadFont("fontsmall.vlw");
  textFont(font);
 

 
  //below: country is given three arguments: piracy percentage,
  //x coordinate in the world, y coordinate and id number.
  //northern and western hemispheres = negative values
  //southern and eastern hemispheres = positive values
  //convert minutes to approximate decimal points if possible
  
  Armenia = new Piracy(93,44.5,-40,0);
  UK = new Piracy(26,1,-51.5,1);
  USA = new Piracy(20,-77,-39,2);
  China = new Piracy(82,116,-40,3);
  Peru = new Piracy(71,-77,12,4);
  Greece = new Piracy(58,24,-38,5);
  Spain = new Piracy(43,-3.75,-40.5,6);
  NewZealand = new Piracy(22,174.5,41.2,7);
  Sweden = new Piracy(25,18,-59.5,8);
  India = new Piracy(69,77.25,-28.5,9);
  Tunisia = new Piracy(76,10,-37,10);
  Canada = new Piracy(33,-75.75,-45.5,11);
  SouthAfrica = new Piracy(34,28.25,25.75,12);
  Mauritius = new Piracy(57,57.5,20,13);
  Mexico = new Piracy(61,-99.5,-19,19);
  SouthKorea = new Piracy(43,127,-37.5,15);
  Guatemala = new Piracy(80,-90.5,-14.6,30);
  Kenya = new Piracy(81,36.5,1.1,17);
  Azerbeijan = new Piracy(92,45.9,-40.3,18);
  Czech = new Piracy(39,40.3,-50,14);
  PuertoRico = new Piracy(44,-66.1,-18.3,20);
  ElSalvador = new Piracy(81,-89.1,-13.4,21);
  SriLanka = new Piracy(90,79.5,-6.5,22);
  Zambia = new Piracy(82,28.2,15.3,23);
  Australia = new Piracy(28,151.2,34,24);
  Singapore = new Piracy(37,103.5,-1.2,25);
  Brazil = new Piracy(59,-47.6,15.5,26);
  Egypt = new Piracy(60,31.1,-30.3,27);
  Japan = new Piracy(23,140,-36,28);
  Poland = new Piracy(57,21,-52,29);
  Turkey = new Piracy(65,33,-40,16);
  Russia = new Piracy(73,38,-56,31);
  Switzerland = new Piracy(25,7,-47,32);
  Iceland = new Piracy(48,-22,-64,33);
  Iraq = new Piracy(85,44,-33,34);
  
  

}
  
void draw()
{
  noStroke();
  
  //lower left box
  fill(0);
  rect(12,97,90,235);
  fill(150);
  rect(15,100,90,235);
  fill(100);
  text("Country:", 25, 118);
  
  //lower right box
  fill(0);
  rect(323,273,295,65);
  fill(150);
  rect(320,270,295,65);
  fill(100);
  text("Scale:", 325, 285);
  ellipse(380, 302, 50, 50);
  fill(150);
  text("100%",369, 308);
  fill(100);
  text("Worldwide Software Piracy Rates", 415, 285);
  textFont(small);
  text("data source: NationMaster.com         (06 Nov 2011)", 415, 300);
  text("image source: Wikipedia ", 415, 310);
  text("Programmed by H. Fenton, M. Gackowski, R. McNeill, C. Murdo", 411, 327);
  textFont(font);
  
  
  
  
  
//display the country bubbles:
  Armenia.display();
  UK.display();
  USA.display();
  China.display();
  Peru.display();
  Greece.display();
  Spain.display();  
  NewZealand.display();
  Sweden.display();
  India.display();
  Tunisia.display();
  Canada.display();
  SouthAfrica.display();
  Mauritius.display();
  Mexico.display();
  SouthKorea.display();
  Guatemala.display();
  Kenya.display();
  Azerbeijan.display();
  Czech.display();
  PuertoRico.display();
  ElSalvador.display();
  SriLanka.display();
  Zambia.display();
  Australia.display();
  Singapore.display();
  Brazil.display();
  Egypt.display();
  Japan.display();
  Poland.display();
  Turkey.display();
  Russia.display();
  Switzerland.display();
  Iceland.display();
  Iraq.display();
  
  Armenia.mouseOver();
  UK.mouseOver();
  USA.mouseOver();
  China.mouseOver();
  Peru.mouseOver();
  Greece.mouseOver();
  Spain.mouseOver();  
  NewZealand.mouseOver();
  Sweden.mouseOver();
  India.mouseOver();
  Tunisia.mouseOver();
  Canada.mouseOver();
  SouthAfrica.mouseOver();
  Mauritius.mouseOver();
  Mexico.mouseOver();
  SouthKorea.mouseOver();
  Guatemala.mouseOver();
  Kenya.mouseOver();
  Azerbeijan.mouseOver();
  Czech.mouseOver();
  PuertoRico.mouseOver();
  ElSalvador.mouseOver();
  SriLanka.mouseOver();
  Zambia.mouseOver();
  Australia.mouseOver();
  Singapore.mouseOver();
  Brazil.mouseOver();
  Egypt.mouseOver();
  Japan.mouseOver();
  Poland.mouseOver();
  Turkey.mouseOver();
  Russia.mouseOver();
  Switzerland.mouseOver();
  Iceland.mouseOver();
  Iraq.mouseOver();
    
}


class Piracy {
  float bubbleSize;
  float bubbleX;
  float bubbleY;
  float currentSize=0;
  float colour;
  int no;
  
  
  Piracy(float piracyRate, float x, float y, int number){
    bubbleSize = piracyRate;

  //convert world coordinates to sketch coordinates
    bubbleX = map(x,-180,180,0,width);
    bubbleY = map(y,-90,90,0,height);
    no = number;
  }
  
  void display(){
    noStroke();
    ellipseMode(CENTER);
    fill(colour,0,0,5);
    ellipse(bubbleX,bubbleY,currentSize,currentSize);
    
    if(currentSize<bubbleSize/2){
      currentSize+=1;
    }
  }
   void mouseOver(){
     if (mouseX>(bubbleX-(currentSize/2)) && mouseX<(bubbleX+(currentSize/2)))
     {
       if (mouseY>(bubbleY-(currentSize/2)) && mouseY<(bubbleY+(currentSize/2)))
       {
         colour = 0;
         fill(0);
         text(country[no], 25, 138+(5.5*no)); 
       }
       else{colour=255;}
     }
     else{colour=255;}
   }
  }


