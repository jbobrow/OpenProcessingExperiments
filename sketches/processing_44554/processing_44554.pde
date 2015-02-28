
int numberOfNodes = 200;
boolean mouseDown;
Node[] nodes = new Node[numberOfNodes];
void setup() {
 
  size(800,600,P2D);
  smooth();
  background(255);
 
  for(int i = 0; i<numberOfNodes; i++){
    nodes[i] = new Node(random(width),random(height));
  }
 
 
 
 
}
 
 
float multiplier1 = .0003;
float multiplier2 = .0002;
float multiplier3 = 5;
 
void draw() {
  background(255);
 
 
  stroke(0,64);
  //strokeWeight(2);
  for(int i = 0; i<numberOfNodes-1; i++){
    for(int c = i+1; c<numberOfNodes; c++){
 
 
      float d = dist(nodes[c].x,nodes[c].y,nodes[i].x,nodes[i].y);
      if(  d>50 && d<70  ){
        line(nodes[c].x,nodes[c].y,nodes[i].x,nodes[i].y);
 
        nodes[i].xv += multiplier1  *(nodes[c].x-nodes[i].x)*  (nodes[c].radius);
        nodes[i].yv += multiplier1  *(nodes[c].y-nodes[i].y)*  (nodes[c].radius);
        nodes[c].xv += multiplier1  *(nodes[i].x-nodes[c].x)*  (nodes[i].radius);
        nodes[c].yv += multiplier1  *(nodes[i].y-nodes[c].y)*  (nodes[i].radius);
      }
 
      else if(  d<10 && d> (pow(nodes[c].radius,1) + pow(nodes[i].radius,1) )  ){
        line(nodes[c].x,nodes[c].y,nodes[i].x,nodes[i].y);
 
        nodes[i].xv -= multiplier2  *(nodes[c].x-nodes[i].x)*  (nodes[c].radius);
        nodes[i].yv -= multiplier2  *(nodes[c].y-nodes[i].y)*  (nodes[c].radius);
        nodes[c].xv -= multiplier2  *(nodes[i].x-nodes[c].x)*  (nodes[i].radius);
        nodes[c].yv -= multiplier2  *(nodes[i].y-nodes[c].y)*  (nodes[i].radius);
      }
      else if( d<(pow(nodes[c].radius,1)+pow(nodes[i].radius,1)) ){
        nodes[i].xv -= multiplier3  *(nodes[c].x-nodes[i].x)/d;
        nodes[i].yv -= multiplier3  *(nodes[c].y-nodes[i].y)/d;
        nodes[c].xv -= multiplier3  *(nodes[i].x-nodes[c].x)/d;
        nodes[c].yv -= multiplier3  *(nodes[i].y-nodes[c].y)/d;
      }
 
    }
  }
  for(int t = 0; t<numberOfNodes; t++){
    nodes[t].display();
  }
 
}
 
void mouseDragged(){
  //saveFrame("nodeGarden####.png");
  mouseDown= true;
}
void mouseReleased(){
  mouseDown = false;
}
 
class Node {
 
  float x,y,xv,yv,radius;
 
  color c;
 
  Node(float xp, float yp){
    this.radius = random(5,10);
    this.x = xp;
    this.y = yp;
    this.xv = random(-1,1);
    this.yv = random(-1,1);
    c = color(this.radius*25.5, 200);
 
 
  }
 
  void display() {
 
 
 
    if(mouseDown){
      this.xv -= 500*(mouseX-this.x)/ ((pow(mouseX-this.x,2) + pow(mouseY-this.y,2))*10);
      this.yv -= 500*(mouseY-this.y)/ ((pow(mouseX-this.x,2) + pow(mouseY-this.y,2))*10);
    }
 
    this.x += 2*this.xv/this.radius;
    this.y += 2*this.yv/this.radius;
 
 
    if(this.x <= 0){
      this.xv+=1;
    }
    if(this.x >= 600){
      this.xv+=-1;
    }
    if(this.y <= 0){
      this.yv+=1;
    }
    if(this.y >= height/2){
      this.yv+=-1;
    }
 
    if(this.xv < -5){
      this.xv=-5;
    }
    if(this.xv > 5){
      this.xv=5;
    }
 
 
 
    fill(this.c);
    noStroke();//0,0,0);
    ellipse(x, y, radius*2.5, radius*2.5);
 
  }
 
}


