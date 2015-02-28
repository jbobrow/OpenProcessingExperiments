
import processing.serial.*;

Serial myPort;  // Create object from Serial class
float angle=0;
int w=600;
int h=300;

int botCounter=0;
int botSize =200;
Bot[] b = new Bot[botSize];


void setup()
{

 // b[0] = new Bot(w/2,h/2,angle);



  background(0);
  size(w, h);
  smooth();

//  String portName = Serial.list()[1];
//  myPort = new Serial(this, portName, 9600);
}
/*
void serialEvent(Serial myPort) 
{
  if ( myPort.available() > 0) {  // If data is available,
    String val = myPort.readStringUntil('\n');
    if(val!=null) {
      System.out.println("val == ["+val+"]");
      val = trim(val);
      int[] data = int(split(val, ":"));

      angle = map(data[3],0,1023,0,360);
    }
  }
}
*/
/*
void mousePressed(){
 if(botCounter<botSize) {
 b[botCounter++] = new Bot(mouseX,mouseY,angle);
 }
 else {
 botCounter=0;
 b[botCounter++] = new Bot(mouseX,mouseY,angle);
 }
 }
 */
void draw()
{

  background(0);

  if(mousePressed) {
    if(botCounter<botSize) {
      b[botCounter++] = new Bot(mouseX,mouseY,random(360));
    }
    else {
      botCounter=0;
      b[botCounter++] = new Bot(mouseX,mouseY,random(360));
    }
  }

  for(int i=0;i<botSize;i++) {
    if(b[i] !=null) {
      b[i].advance();
    }
  }
}


class Bot {
  float a=0;

  float xPos=0;
  float yPos=0;
  int w=2;
  int h=2;
  float magnatute=1;
  color c = 0;
  

  public Bot() {
  }
  public Bot(int x,int y,float angle) {
    c=color((int)random(255),(int)random(255),(int)random(255));
    xPos=x;
    yPos=y;
    a=angle;
    magnatute = random(3)+1;
    w=(int)random(7)+3;
    h=w;
    
  }
  int iteration=0;

  void advance()
  {
    // background(0);


    xPos = xPos+(cos(radians(a+=random(2)-1)) )*(w/3);
    yPos = yPos+(sin(radians(a+=random(2)-2)) )*(w/3);

    stroke(c);
    fill(c);
    //    strokeWeight(3);
    /*
    if(iteration < 10){
     iteration++;
     } else {
     iteration=0;
     w+=1;
     h+=1;
     }
     */
    ellipse(xPos, yPos, w, h);
    
    line( xPos,yPos,
     xPos+(cos(radians(a+180)) )*(2*w),
     yPos+(sin(radians(a+180)) )*(2*w)
     );
     
  }
}


