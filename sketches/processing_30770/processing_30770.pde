
//declare global variables
PVector vec0 = new PVector(0,0,0);
PVector vec1 = new PVector(50,100,0);
PVector vec2 = new PVector(-150,150,0);
PVector vec3 = new PVector(0,-150,0);
PVector vec4 = new PVector(-70,-180,0);
PVector vec5 = new PVector(-130,-60,0);
PVector vec6 = new PVector(180,-30,0);

ArrayList CircleList;



void setup () {
  
  size (600,600);
  
  CircleList = new ArrayList();
  CircleNode c0 = new CircleNode(0,0,50,color(255,255,255),"Cedric Price");
  CircleNode c1 = new CircleNode(50,100,50,color(random(255),random(255),random(255)),"Reyner Banham");
  CircleNode c2 = new CircleNode(-150,150,50,color(random(255),random(255),random(255)),"Peter Cook");
  CircleNode c3 = new CircleNode(0,-150,50,color(random(255),random(255),random(255)),"Gordon Pask");
  CircleNode c4 = new CircleNode(-70,-180,50,color(random(255),random(255),random(255)),"Norbert Wiener");
  CircleNode c5 = new CircleNode(-130,-60,50,color(random(255),random(255),random(255)),"Richard L. Gregory");
  CircleNode c6 = new CircleNode(180,-30,50,color(random(255),random(255),random(255)),"Frank Newby");
  

  c1.addChild(c0);
  c2.addChild(c0);
  c3.addChild(c0);
  c4.addChild(c3);
  c5.addChild(c0);
  c6.addChild(c0);
  
  CircleList.add(c0);
  CircleList.add(c1);
  CircleList.add(c2);
  CircleList.add(c3);
  CircleList.add(c4);
  CircleList.add(c5);
  CircleList.add(c6);
  
}


void draw () {
  
  background (255);
  translate(300,300);
  
  for(int i = 0; i<CircleList.size(); i++){
    CircleNode circle = (CircleNode)CircleList.get(i);
    circle.update();
    circle.drawLines();
  }
  
  /*
  translate(300,300);
  
  stroke (220);
  strokeWeight(0.01);
  line(-600,0,600,0);
  line(-600,100,600,100);
  line(-600,-100,600,-100);
  line(-600,200,600,200);
  line(-600,-200,600,-200);  
  line(0,-600,0,600);
  line(100,-600,100,600);
  line(200,-600,200,600);
  line(-100,-600,-100,600);
  line(-200,-600,-200,600);  
   
  
stroke (100,200,0);
*/
/*
  strokeWeight (1);
  fill(100,200,200);  
  ellipse(0,0,50,50);
  text(" Cedric Price",0,0);
//history branch (hope become 1 class-2) 
   fill(155);
  ellipse (vec1.x, vec1.y,50,50);
 // PFont font;
// The font must be located in the sketch's 
// "data" directory to load successfully
//font = loadFont("FFScala-32.vlw"); 
//textFont(font, 32); 
text("Reyner Banham", vec1.x, vec1.y);
  
  line(0,0,vec1.x, vec1.y);
    
 //archigram branch (hope become class-2)
    fill(200,220,225);
    ellipse (vec2.x, vec2.y,50,50);
    line(0,0,vec2.x, vec2.y);
    text("Peter Cook", vec2.x, vec2.y);
    
 //cybernetics branch (hope become class-3) 
    fill(200,20,20); 
    ellipse (vec3.x,vec3.y,50,50);
    line(0,0,vec3.x, vec3.y);
   text("Gordon Pask", vec3.x, vec3.y);
   //cyber-master (class-3)
   fill(150,20,20);
   ellipse (vec4.x,vec4.y,50,50);
   line(vec3.x,vec3.y,vec4.x, vec4.y);
   text("Norbert Wiener ", vec4.x, vec4.y);
   
   // Psychology branch (hope become class-4) 
    fill(100,220,120); 
    ellipse (vec5.x,vec5.y,50,50);
    line(0,0,vec5.x, vec5.y);
   text("Richard L. Gregory", vec5.x, vec5.y);
   
   //Structure branch (class-5)
     fill(180,220,220); 
    ellipse (vec6.x,vec6.y,50,50);
    line(0,0,vec6.x, vec6.y);
    fill(0);
   text(""Frank Newby"", vec6.x, vec6.y);
   
   */
    
}

class CircleNode{
  
  ArrayList childList;
  int x;
  int y;
  int r;
  color c;
  String s;
  CircleNode(int _x, int _y, int _r, color _c, String _s){
    x = _x;
    y = _y;
    r = _r;
    c = _c;
    s = _s;
    childList = new ArrayList();
  }
  
  void update(){
    fill(c);
    ellipse(x,y,r,r);
    fill(0);
    text(s,x,y);
  }
  
  void drawLines(){
    for(int i = 0; i<childList.size(); i++){
      CircleNode child = (CircleNode)childList.get(i);
      stroke(0);
      line(x,y,child.x,child.y);
    }
  }
  
  void addChild(CircleNode child){
    childList.add(child);
  }
  
}

//there are some problems
//*1 I don't want fill the same the color in circles and the words.  
//* 2.I hope the color is a gradient. not by my chose
//* 3.I don't need the "spring" effect but i would like to move the circle freely. like the example "handles"in GUI, I can click and drag the circles to change their position. 


