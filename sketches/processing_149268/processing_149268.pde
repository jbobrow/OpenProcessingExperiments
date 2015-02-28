
import gifAnimation.*;
PImage[] animation;
Gif looptest;
float diameter;
float angle = 0;

float x, a, theta, sz=80;
int num = 30;
color[] palette = {
  #FF0000, #00FF00, #0000FF
};

int node = 8;
Node[] nodes = new Node[node];
String[] picker = {"tt","how come","lives won","lives lost","run","biff bam boom"};
PFont font;
 
void setup() {
  size(1200, 800);
  diameter = height - 10;
  stroke(225);
  looptest = new Gif(this,"copygif.gif");
  looptest.loop();
  
    for(int i =0; i < nodes.length; i++){
    nodes[i] = new Node(random(800,400),random(800,400),random(.9),random(-1,1),random(-1,1));
     
  }
}
void draw(){
  background(0);
  image(looptest,10,height/2-looptest.height/2);
  /*drawWheel(#332D2F, #F2F1F0, 80+240+240, second(), 60);
  drawWheel(#575151, #F2F1F0, 80+240, minute(), 60);
  drawWheel(#BFC3B9, #332D2F, 80, hour(), 12);*/
  
   //background(0);
 
  //translate(850, 350);
  for(int i = 0; i < nodes.length; i++){
  nodes[i].display();
  nodes[i].move();
  }
   
 /* for (int i=0; i<num; i++) {
    a = map(sin(theta+(TWO_PI/num)*i), -1, 1, 0, 100);
    fill(#FFFFFF, a);
    pushMatrix();
    rotate(i*(TWO_PI/num));
    x = map(sin(theta), -1, 1, -120, 80);
    rect(x, 0, 1.8*sz, sz, 10);
    popMatrix();
  }
  theta += 0.0523;
  */
  
}




 class Node{
   
  float xpos,ypos,speed,transx,transy;
   
  String[] Picker = {"resolve","of the","transparent","occular","new media","she laughs","come on by said the spider to the fly","don;t slow down, it doesn't feel right","everything. Every Last Detail","black hole","he moaned","don't sit down, don't perspire","utopia means groundlessness","how can I live","boom","tt"," so says he","what foolishness","it has become poetry","why can't I die yet"};
   
  int index = int(random(Picker.length));
   
   
  Node(float _xpos,float _ypos, float _speed, float _transx,float _transy){
    xpos = _xpos;
    ypos = _ypos;
    speed = _speed;
    transx =_transx;
    transy = _transy;
  }
   
  void display(){
    //stroke(0);
    fill(255);
    //text(Picker[index],xpos,ypos);
    ellipse(xpos,ypos,.1,.1);
    for(int i=0;i<nodes.length; i++){
       stroke(random(0,255));
        line(xpos, ypos, nodes[i].xpos, nodes[i].ypos);
         
    }
  }
   
  
  
  
  void move(){
    float uper, down;
    
    //uper = ypos - (speed * transy);
    //down =  xpos + (speed * transx);
    
    
    
    xpos = xpos + (speed*transy);
    //ypos = ypos - (speed * transy);
    ypos = ypos + (speed*transx);
    if (xpos > 900) {
      xpos = random(600,900);
      speed = random(-.9,.9);
    } else if (ypos > 350) {
      ypos = random(150,350);
      speed = random(-.9,.9);
    } else if (xpos < 600) {
      xpos = random(600,900);
      speed = random(-.9,.9);
    } else if (ypos < 150) {
      ypos = random(150,400);
      speed = random(-.9,.9);
    }
      
  }
 }
 


