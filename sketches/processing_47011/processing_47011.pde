
/* 
 Daniel C. Young
 Grit Visualization
 11/27/2011
 */

XMLElement xml;
PFont scala;

void setup(){
  size(820,850);
  background(65);
  colorMode(HSB,100);
  
  xml = new XMLElement(this,"grit.xml");
  scala = loadFont("ScalaSansCaps-48.vlw");
  int count = xml.getChildCount();
  
  XMLElement[] experience = xml.getChildren("row/experience");
  XMLElement[] creativity = xml.getChildren("row/creativity");
  XMLElement[] grit = xml.getChildren("row/grit");
  XMLElement[] interest = xml.getChildren("row/interest");
  XMLElement[] effort = xml.getChildren("row/effort");
  XMLElement[] ambition = xml.getChildren("row/ambition");
  
  for(int i=0;i<count;i++){
    float exSat = 5+12*int(experience[i].getContent());
    float crHeight = -50*(float(creativity[i].getContent())-2.5);
    float grHeight = -50*(float(grit[i].getContent())-2.5);
    float inHeight = -50*(float(interest[i].getContent())-2.5);
    float efHeight = -50*(float(effort[i].getContent())-2.5);
    float amHeight = -50*(float(ambition[i].getContent())-2.5);
    
    //textAlign(LEFT);
    textFont(scala, 14);
    
    drawGraph(10,exSat,i,170,crHeight,"creativity");
    drawGraph(30,exSat,i,320,grHeight,"grit");
    drawGraph(55,exSat,i,470,inHeight,"interest");
    drawGraph(75,exSat,i,620,efHeight,"effort");
    drawGraph(95,exSat,i,770,amHeight,"ambition");
  }
}

void drawGraph(int _hue, float _sat, int _i, int _y, float _height, String _msg){
  fill(_hue,_sat,100);
  stroke(_hue,_sat,100);
  rect(60+_i*30,_y,20,_height);
  fill(100);
  noStroke();
  text(_msg, 60, _y+20, 70, 60);
}

