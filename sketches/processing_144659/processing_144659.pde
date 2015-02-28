
//copyright Leslie Bloomfield, homework 10
//press any key to exit

String[] file;
String[] quotes;
float x, y;
  
PFont font;
float angle;
float rot;

void setup() {
  size(600, 600);
  smooth();
  frameRate(5);
  font = loadFont("TwCenMT-Bold-22.vlw");
  file = loadStrings("data1.txt");
  quotes = split(file[0], ',');
}

void draw() {
  fill(255, 10);
  rect(0, 0, width, height);
   drawAllDesigns();
   
}

void drawAllDesigns() {

 for(int i = 0; i < quotes.length ; i++) {
   
    design(quotes[(int)random(7)], random(width),random(height));
     
      


 }
   
}


void design(String one, float x, float y) {

 fill(random(0), random(0), random(255));
 angle +=.05;
 rot +=.05;
 translate(angle, angle);
 rotate(rot);
textSize(random(22));

text(one, x, y);

  }

  
void keyPressed()
{
  
    exit ();
    
}




