


HashMap trees = new HashMap();

void setup(){
  size(250,250);
  frameRate(30);
}

void addTree(){
  float y = random(0,200);
  float x = width+50;
  Tree t = new Tree(x,y,30);

  trees.put(t.getBottom(),t);
}

float speedmult = 1;

void draw(){
  background(255);
  
speedmult = 3*norm(mouseX,0,width);
  if(random(10) < speedmult){
    addTree(); 
  }
  java.util.List treeKeys = new ArrayList(trees.keySet());
  Collections.sort(treeKeys);
  Iterator tki =   treeKeys.iterator();
  while(tki.hasNext()){
    Object o = tki.next();
    Tree t = (Tree)trees.get(o);
    t.move();
    t.draw(); 
  }
  tki = trees.keySet().iterator();
  while(tki.hasNext()){
    Tree t = (Tree)  trees.get(tki.next());
    if(t.x < -50){
      tki.remove();
    } 
  }
}

class Ornament{
  float x,y;
  color c;
  Ornament(float x, float y){
    this.x = x;
    this.y = y;
    this.c = color(random(128,255),random(128,255),random(128,255));
  }


}


class Tree {
  float x,y;
  float MINSIZE = width/10;
  float MAXSIZE = width / 5;
  float WIDTH,HEIGHT;
  float xs;

  ArrayList ornaments = new ArrayList();

  //float stroke ;
  Tree(float x, float y, float basesize){
    this.x = x;
    this.y = y;
    WIDTH = basesize * (.5 + norm(y,0,250)); // basesize * random(.8,1.2);
    HEIGHT = basesize *( .5 + norm(y,0,250));
    ;
    //stroke = basesize / 5;
    xs = 4*(.1 + norm(getBottom(),0,250));
    //int c = Math.round(random(3,8));
    for(int i = 1; i <= 3; i++){
      addOrnament(i/4.0);
    }
    addOrnament(4.0/5.0);
  }
  void addOrnament(float yper){
//    triangle(x,y-HEIGHT*.5,x-.75*WIDTH,y+HEIGHT,x+.75*WIDTH,y+HEIGHT);
      
      //float yper = random(1);
 
      float oy = (-HEIGHT*.5)    + (yper * (1.5 * HEIGHT));
      float xper = random(-1,1);
//xper = 1;
      float ox = xper * yper  * .75 * WIDTH;      
      ornaments.add(new Ornament(ox,oy));
  }

  void move(){
    x = x - xs*speedmult;
  }  
  void draw(){
    strokeWeight(10);
    stroke(0);
    doTrunk();
    noStroke();
    doTrunk();
    stroke(0);
    doGreen();
    noStroke();
    doGreen();
    Iterator i = ornaments.iterator();
    while(i.hasNext()){
      Ornament o = (Ornament)i.next();
      strokeWeight(6);
      stroke(0);
      fill(o.c);
      ellipse(x+o.x,y+o.y,WIDTH/5,WIDTH/5); 
      noStroke();
      ellipse(x+o.x,y+o.y,WIDTH/5,WIDTH/5); 

    }

  }    
  float getBottom(){
    return  y+HEIGHT*1.5;
  }

  void doTrunk(){
    fill(128,64,0);
    rect(x -WIDTH*.075,y+HEIGHT*.5,WIDTH*.15,HEIGHT);
  }
  void doGreen(){

    fill(0,200,0);
    //upper
    mytri(-HEIGHT*.5, 0, WIDTH*.35);
    //middle
    mytri(-HEIGHT*.35,HEIGHT*.5,WIDTH*.55);
    //lower
    mytri(-HEIGHT*.2,HEIGHT,-WIDTH*.75);
  }    
  void mytri(float topOffset, float botOffset, float widthOffset){
    triangle(x,y+topOffset,x - widthOffset,y+botOffset,x+widthOffset, y+botOffset);
  }


}




