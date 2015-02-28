
int node = 12;
Node[] nodes = new Node[node];
String[] picker = {"tt","how come","lives won","lives lost","run","biff bam boom"};
PFont font;




void setup(){
  size(900,900);
  smooth();
  font = loadFont("ARBONNIE-48.vlw");
  textFont(font);
  textSize(32);
  
  for(int i =0; i < nodes.length; i++){
    nodes[i] = new Node(random(width),random(height),random(0.5),random(-1,1),random(-1,1));
    
  }
}


void draw(){
  background(255);
  fill(0);
  stroke(0);
  for(int i = 0; i < nodes.length; i++){
  nodes[i].display();
  nodes[i].move();
  }
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
    stroke(0);
    fill(0);
    text(Picker[index],xpos,ypos);
    ellipse(xpos,ypos,10,10);
    for(int i=0;i<nodes.length; i++){
       stroke(150,50);
        line(xpos, ypos, nodes[i].xpos, nodes[i].ypos);
        
    }
  }
  
  void move(){
    xpos = xpos + (speed * transx);
    ypos = ypos + (speed * transy);
    if (xpos > width) {
      xpos = 0;
    } else if (ypos > height) {
      ypos = 0;
    } else if (xpos < 0) {
      xpos = width;
    } else if (ypos < 0) {
      ypos = height;
    }
     
  } 
 }
     



