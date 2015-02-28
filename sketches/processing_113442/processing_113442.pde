
import processing.serial.*;

//Serial myPort;        // The serial port
String ardMsg;
int distValue;
float tempValue;
int threshold;
int randomNumber;
int bgBright;
//type of list <type of object> name of list
ArrayList<Raindrop> drops;

void setup(){
  bgBright = 250;
  size(500,500);
  drops = new ArrayList<Raindrop>();
  
  //myPort = new Serial(this, Serial.list()[8], 9600);
  //myPort.bufferUntil('\n');
}

void draw(){
  // here we're gonna check if it's time to add a raindrop!
  bgBright = int(map(mouseY,0,height,0,250));
  background(bgBright);
  //variable = threshold, map = function
  threshold = int(map(mouseX,0,width,400,500));
  randomNumber = int(random(500));
  
  if(randomNumber>threshold) {
    drops.add(new Raindrop()); 
  }
  
  // With an array, we say balls.length. With an ArrayList,
  // we say balls.size(). The length of an ArrayList is dynamic.
  // Notice how we are looping through the ArrayList backwards.
  // This is because we are deleting elements from the list.
  for (int i = drops.size()-1; i >= 0; i--) {
    Raindrop drop = drops.get(i);
    drop.fall();
    drop.display(); 
    
    if(drop.yPosition > height + 50) {
      drops.remove(i);
    }
  }
  
}


void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  
  if (inString != null) {
    inString = trim(inString);
    ardMsg = inString;
     
    String[] list = split(ardMsg, 'H');
    if(list.length == 2) {
      distValue = int(list[1]);
      tempValue = float(list[0]);
      println(distValue + " " + tempValue);
     }
   }
}


class Raindrop {
  color dropColor;
  int xPosition; 
  int yPosition;

  Raindrop() {
    dropColor = color(random(250), random(250), random(250));
    xPosition = int(random(width));
    yPosition = 0;
    
  }

  void fall() {
    yPosition = yPosition + 1;
  }
  
  void display(){
    fill(dropColor);
    noStroke();
    float dropSize = map(yPosition,0,height,15,3);
    ellipse(xPosition, yPosition,dropSize,dropSize);
  }

}




