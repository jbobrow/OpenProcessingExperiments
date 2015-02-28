
int Nint = 12;
Node[] nodePoet = new Node[Nint];
PFont font;

void setup(){
  size(700,700);
  background(0);
  smooth();
  font = loadFont("Vijaya-48.vlw");
  textFont(font);
  for(int i = 0; i < Nint; i++){
  Node oneOfmany = new Node(random(0,width),random(0,height),random(-1,1),random(-1,1));
  nodePoet[i] = oneOfmany;
  }

}

void draw(){
  
  textSize(20);
  for(int i =0;i<nodePoet.length;i++){
  nodePoet[i].display();
  }
  /*for(int i=0;i<Nint; i++){
    nodePoet[i].makeN();
    
    Node nodeA = nodePoet[i];
    //nodeA.floatAround();
    
   for(int j = i+1; j < Nint; j++) {
    Node nodeB = nodePoet[j];
   
    stroke(150, 50);
    line(nodeA.x, nodeA.y, nodeB.x, nodeB.y);
   }*/
  }
  
  
    
   



class Node{


  
  float x,y,vx,vy;
  int rad = 20;
  int speed =10;
  String StringT = "test";
  
  String[] Picker = {"resolve","of the","chicken","boom","pow","tt"," so says he"};
  
  
  
  
  
  Node(float firstx,float firsty, float rise,float run ){
    x = firstx;
    y= firsty;
    vx = run;
    vy = rise;
    
    
    
  }
  void makeN(){
    fill(255);
    noStroke();
    //ellipse(x,y,rad,rad);
    //text(Picker[int(random(0,Picker.length))],x,y);
    text(Picker[0],x,y);
  
  }
  
  void display(){
  for(int i=0;i<Nint; i++){
    nodePoet[i].makeN();
    
    Node nodeA = nodePoet[i];
    //nodeA.floatAround();
    
   for(int j = i+1; j < Nint; j++) {
    Node nodeB = nodePoet[j];
   
    stroke(150, 50);
    line(nodeA.x, nodeA.y, nodeB.x, nodeB.y);
   }
  }
  }
  
  void floatAround(){
    x = x + (speed*vx);
    y = y+ (speed*vy);
  }
}


