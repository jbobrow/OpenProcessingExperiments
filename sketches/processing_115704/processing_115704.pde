
Text myText1;
Text myText2;
Text myText3;
Text myText4;
Text myText5;
Text myText6;
void setup() {
  size(400, 400);
  myText1= new Text("Greetings",color(255),10,30,10);
  myText2 = new Text("Earthlings",color(255),20,40,10);
  myText3 = new Text("We",color(255),30,50,10);
  myText4= new Text("Have",color(255),40,60,10);
  myText5= new Text("Travelled",color(255),50,70,10);
  myText6= new Text("Afar",color(255),60,80,10);
}
void draw() {
  background(0);
  myText1.move();
  myText1.display();
  myText2.move();
  myText2.display();
  myText3.move();
  myText3.display();
  myText4.move();
  myText4.display();
  myText5.move();
  myText5.display();
  myText6.move();
  myText6.display();
}
//Class
class Text {
  //Fields
  String t;
  color c;
  float xpos;
  float ypos;
  float xspeed;
  //Constructor
  Text(String thestring, color shadeC, float shadeXpos, float shadeYpos, float shadeXspeed) {
    t=thestring;
    c=shadeC;
    xpos=shadeXpos;
    ypos=shadeYpos;
    xspeed=shadeXspeed;
  }
  void display() {
    stroke(0);
    fill(c);
    text(t,xpos,ypos);
    
  }
  void move() {
    xpos=random(xpos-xspeed);
    ypos=random(ypos);
    if (xpos>width) {
      xpos=0;
    }
    if (xpos<0) {
      xpos=300;
    if(ypos<0);
    ypos=200;
    }
  }
}



