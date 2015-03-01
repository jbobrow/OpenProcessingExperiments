
/*
Beginnings of a sketch for London Design Festival installation
A board will be pre-printed with a spider diagram that shows a number of bubbles around
various categories such as "visitor", "PDD staff", "HCD participant" etc
The bubbles will be connected to resistor ladders via conductive ink.
The resistor ladders will be monitored by an arduino with a wifi shield.
The arduino uploads the number of connections to each bubble to Xively.
This processing sketch retrives the data from Xively and draws the physical spider diagram 
on a specific website (using processing.js)
*/


float diameter = 50;
int numBubbles;
int lastNum;

float [] x = {50, 300, 550};
float [] y = {200, 100, 200};
int index;

// An Arraylist of Bubble objects
ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
//Bubble[] bubbles;

void setup(){
  size(600,600); 
  //getData();
  smooth();
}

void draw(){
  background(255);
  getData();
  // Display all bubbles
  for (Bubble b : bubbles) {
    b.display();
    b.rollover(mouseX, mouseY);
  }
  //display central bubble
  stroke(0);
    strokeWeight(2);
    fill(255);
  ellipse(width/2, height/2, 200,100);
  
}

void getData(){
String lines[] = loadStrings("https://api.xively.com/v2/feeds/1255159163.csv?key=aoTxjgBtvDNckQY19M0EeObgc1FT5dLOSDoHEhoh5h20ZSAm");
//println("there are " + lines.length + " lines");
for (int i = 0 ; i < lines.length; i++) {
  //println(lines[i]);
  float data [] = float(split(lines[i], ','));
  numBubbles = int(data[2]);
}
  println(numBubbles);

 //create bubbles
 if(numBubbles > lastNum){
    bubbles.add(new Bubble(x[index], y[index],diameter));
    index++;
 }
 if(numBubbles < lastNum){
    bubbles.remove(bubbles.size()-1);
    index--;
 }
 
lastNum = numBubbles;
  
}
// A Bubble class

class Bubble {
  float x,y;
  float diameter;
  String name;
  
  boolean over = false;
  
  // Create  the Bubble
  Bubble(float x_, float y_, float diameter_) {
    x = x_;
    y = y_;
    diameter = diameter_;
  }
  
  // CHecking if mouse is over the Bubble
  void rollover(float px, float py) {
    float d = dist(px,py,x,y);
    if (d < diameter/2) {
      over = true; 
    } else {
      over = false;
    }
  }
  
  // Display the Bubble
  void display() {
    //draw a line to connect bubble to main bubble
    strokeWeight(1);
    stroke(0);
    line(x,y,width/2,height/2);
    //draw bubble and fill black if mouse is over
    strokeWeight(2);
    if (over) {
      fill(0);
    }
    else{
      fill(255);
    }
    ellipse(x,y,diameter,diameter);
 
  }
}


