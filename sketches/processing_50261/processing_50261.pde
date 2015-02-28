
List<Branch> branches = new ArrayList<Branch>();
float bAng = 35;      // branching angle
float bDec = 0.6;     // branching decrease length
float genLimit = 10;  //generations limit
boolean update = false;
Button pause,reset,save;

void setup(){
  smooth();
  size(400,350);
  background(0);
  stroke(200,50);  strokeWeight(1);
  pause  = new Button(0,0,150,"pause");
  save   = new Button(0,height-150,150,"save");
  reset  = new Button(width-150,height-150,150,"reset");
  Branch b = new Branch(width/2,height-20,50,-90);
  branches.add(b);
  reset.render();
  pause.render();
  save.render();
}

void draw(){
  branching(update);
}

void branching(boolean _update){
  if(_update==true){
    background(0);
    for(int i=0;i<branches.size();i++){
      branches.get(i).update();
      branches.get(i).render();
    }
  
    for(int i=0;i<branches.size();i++){
      if(branches.get(i).isGrown==true &&
         branches.get(i).isDivided==false &&
         branches.get(i).Gen<genLimit){
           for(int j=0;j<int(random(6));j++){
             Branch b = new Branch(branches.get(i).ex,
                                   branches.get(i).ey,
                                   20,
                                   branches.get(i).ang+random(-bAng,bAng));
             b.Gen = branches.get(i).Gen + 1;
             branches.add(b);
           }
           branches.get(i).isDivided = true;
      }
    }
  }
}

void mousePressed(){
  if(pause.isFloating()==true) update=!update;
  if(save.isFloating()==true) saveFrame();
  if(reset.isFloating()==true){
    branches.clear();
    Branch b = new Branch(width/2,height-20,50,-90);
    branches.add(b);
  }
}

class Branch{
  float x,y;  float ex,ey;
  float L,eL;
  float ang;
  int Gen;
  boolean isGrown    = false;
  boolean isDivided  = false;
  
  Branch(float _x,float _y,float _eL,float _angle){
    x = _x;  ex = x;
    y = _y;  ey = y;
    eL = _eL;
    ang = _angle;
    L = 0;
  }
  
  void update(){
    if(L<eL) L++;
    else isGrown = true;
  }
  
  void render(){
    ex = x+L*cos(radians(ang));
    ey = y+L*sin(radians(ang));
    strokeWeight(1);
    stroke(200,180);
    line(x,y,ex,ey);
  }
}

class Button{
  float x,y,w,h;
  boolean isClicked;
  String s;
  
  Button(float _x,float _y){
    x = _x;
    y = _y;
    w = 50; h = 20;
    isClicked = false;
  }
  
  Button(float _x,float _y,float _r,String _s){
    x = _x;
    y = _y;
    w = _r;
    h = _r;
    s = _s;
  }
  
  void render(){
    textAlign(CENTER);
    textSize(20);
    fill(150);
    text(s,x+w/2,y+h/2);
    stroke(150);
    strokeWeight(5);
    noFill();
    noStroke();
    fill(100,50);
    ellipse(x+w/2,y+h/2,w,h);
  }
  
  boolean isFloating(){
    if(mouseX>x && mouseX<x+w &&
       mouseY>y && mouseY<y+h)
       return true;
    else return false;
  }
}               
