
//import processing.serial.*;
import processing.net.*;

/**/
//Serial myPort;
Client c;
String data;
String domain = "wikipulse.herokuapp.com";
String addr = "/stats/wikidata-wikipedia/60000.json";
/**/

/**/
PImage skala;
Point n = new Point(380,360); /*Achse des Zeigers*/
int zl = 300;/*zeigerlaenge*/
boolean gtMAX = false;

float oldValue, realvalue, s=0.5/*geschwindigkeit des Zeigers*/, value=0;
float scale=1;

PFont meterfont;
PFont infofont;
PFont scalefont;

boolean started = false;
boolean blink = false;
boolean value_changed = false;
/**/


int actual_seconds = 0;
int last_seconds = 0;

void setup() {
//  println(Serial.list());
//  myPort = new Serial(this, Serial.list()[0], 9600);

  c = new Client(this, domain, 80); // Connect to server on port 80 
  
  println("string to int");
  println(int("1337"));
  
  meterfont = createFont("SansSerif", 36);
  
  size((int)(480*scale),(int)(463*scale));
  background(64);
  skala = loadImage("skala.jpg");
  smooth();


}

String act_value;

void draw(){
  actual_seconds = second();
  
  act_value = getEditsPerMin();
  
  if(act_value != "not yet"){
    value = int(act_value);
//    myPort.write(act_value);
//    myPort.write("\n");
  }
  
  if(value != oldValue){
    drawzeiger(value);
    drawLed(gtMAX,color(255,0,0,180));
    printValue();
    value_changed = true;
  }
  
  if(!started){
    delay(500);
    drawzeiger(0);
    drawLed(blink,color(0,255,0,100));
    blink=!blink;
  }

}

void drawzeiger(float value){
  scale(scale);
  delay(1);
  if(value<0)  value=0;
  if(value>1000){ value=1000; gtMAX=true;}
  else{gtMAX=false;}
    
  if(value>oldValue){
    oldValue+=s;
    if(oldValue>value) oldValue=value;
    drawBar(oldValue);
  }else{
    oldValue-=s;
    if(oldValue<value) oldValue=value;
    drawBar(oldValue);
  }
  oldValue=oldValue;
}


void drawLed(boolean an, color c){
  if(an) fill(c);
  else fill(color(0,0,0,50));
  ellipse(400,30,15,15);
}


void drawBar(float value){
  image(skala, 0, 0);
  pushMatrix();
  translate(n.x,n.y); 
  rotate(radians(90+value*9./100)); /*-100 fuer die 100er skala*/
  fill(0);
  rect(0, 0, 10, zl);
  rect(4,zl,2,30);
  popMatrix();
}


void printValue(){
    int posX = 80;
    fill(64); rect(0,463,480,252);
    fill(0);textFont(meterfont);textSize(36);
    textAlign(RIGHT);
    text((int)value,posX-5,65);
    textSize(24);textAlign(CENTER);
    text("edits",posX+25,50);
    strokeWeight(2);stroke(0);
    line(posX,55,posX+50,55);
    text("min",posX+25,77); 
}






String getEditsPerMin(){
  if(last_seconds > actual_seconds){
    last_seconds = 60-last_seconds;
  }
  
  if(actual_seconds - last_seconds <5 ){
    return "not yet";
  }
  
  last_seconds = actual_seconds;
    
  c.write("GET "+addr+" HTTP/1.1\r\n"); // Can replace / with, eg., /reference/ or similar path
  c.write("Host: "+domain+"\r\n"); // Which server is asked
  c.write("User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Ubuntu/10.04 Chromium/10.0.648.205 Chrome/10.0.648.205 Safari/534.16\r\n");
  c.write("Accept: application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5\r\n");
  c.write("Accept-Language: en-us,en;q=0.5\r\n");
  c.write("Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7\r\n");
  c.write("\r\n");
  
  
  while(c.available() <= 0){}
  data = c.readString();
  String[] result = data.split("\n");
 
  if(result.length < 2)
    return "0";
  else{
    if(!started) started = true;
    return (result[result.length-1]);
  }
}

class Point{
 public int x,y;
 
 public Point(int x, int y){
  this.x=x;
  this.y=y; 
 }
  
}
