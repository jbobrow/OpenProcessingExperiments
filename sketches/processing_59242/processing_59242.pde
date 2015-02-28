
Sketch[] sketches;
Sketch mainSketch;
int sketchLimit = 13;

void setup(){
 size(900, 450);
 
 sketches = new Sketch[sketchLimit];
 mainSketch = new Sketch("main");
 mainSketch.parent = mainSketch;
 mainSketch.ribbon = new Ribbon(1);

 
 /*
 for(int i=0; i<sketches.length; i++){
        sketches[i] = new Sketch();
 }
 for(int i=0; i<sketches.length; i++){
    Sketch myParent = sketches[int(random(19))];
    myParent.time = int(random(200));
    sketches[i] = new Sketch(myParent, myParent.time + int(random(200)));
 }
 */
 sketches[0] = mainSketch;
 sketches[1] = new Sketch("1",mainSketch, 1) ;
 sketches[2] = new Sketch("2",mainSketch, 2) ;
 sketches[3] = new Sketch("3",mainSketch, 3) ;
 sketches[4] = new Sketch("4",mainSketch, 4) ;
 sketches[5] = new Sketch("5",mainSketch, 5) ;
 sketches[6] = new Sketch("3-1",sketches[3],1) ;
 sketches[7] = new Sketch("3-2",sketches[3],2) ;
 sketches[8] = new Sketch("3-3",sketches[3],3) ;
 sketches[9] = new Sketch("3-4",sketches[3],4) ;
 sketches[10] = new Sketch("3-5",sketches[3],5) ;
 sketches[11] = new Sketch("3-3-1",sketches[8],1) ;
 sketches[12] = new Sketch("3-3-2",sketches[8],2) ;

  
  noStroke();
  PFont font;
    font = loadFont("Helvetica-18.vlw"); 
    textFont(font);
   smooth(); 
   
   
   background(255);
 translate(width/2,50);
 for(int i=0; i<sketches.length; i++){
    sketches[i].draw();
 }
    
}

void draw(){
 
  
}

public class Sketch {

  int time;
  Sketch parent;
  Ribbon ribbon;
  String title;
  boolean hasChild = false;
  int ribbonDirection;  //1 for right, -1 for left
  ArrayList myChildren;

  float myX, myY;
  int w = 70, h = 20;
  color[] ribbonColors = {#dde5b2, #e1b284, #c36665, #cdaacb};

  public Sketch(String title) {
    this.title = title;
    this.parent = this;
    this.time = 0;
    this.ribbonDirection = 1;
    this.ribbon = new Ribbon(this.ribbonDirection);
    this.myX= (this.ribbonDirection*cos(PI/4)*this.time);
    this.myY= (sin(PI/4)*this.time);
    this.myChildren = new ArrayList();
  }

  public Sketch(String title, Sketch parent ,int order) {
    this.title = title;
    this.parent = parent;
    this.time = order*50;
    this.ribbonDirection = this.parent.ribbonDirection*-1;
    this.ribbon = new Ribbon(this.ribbonDirection);
    this.myX= this.parent.myX+(this.parent.ribbonDirection*cos(PI/4)*this.time);
    this.myY= this.parent.myY+(sin(PI/4)*this.time);
    this.myChildren = new ArrayList();
    this.parent.hasChild = true;
    this.parent.myChildren.add(this);
    
    
  } 

  /*
    public Sketch(Sketch parent, int time){
   this.parent = parent;
   this.time = time;
   this.ribbonDirection = this.parent.ribbonDirection*-1;
   } 
   */

  void draw() {
    translate(this.myX, this.myY);
    if(this.hasChild){
      translate(0,this.h);
      this.ribbon.draw(this.ribbonColors[(this.parent.time/50+this.time/50)%this.ribbonColors.length], this.myChildren.size() );
      translate(0,-this.h);

    }
    fill(200, 200, 200, 255);
    rect(0, 0, this.w, this.h);
    fill(0);
    //text(this.title, 2, 15); 
    translate(-this.myX, -(this.myY));
  }
}

public class Ribbon {
  int direction;
  Sketch sketch;
  int w = 70, h = 50, offset;

  public Ribbon(int d) {
    this.direction = d;
    //this.offset = this.direction*-20;
    this.offset = 1;
    
  }

 
  void draw(color c, int len) {
    fill(c, 90);
    int h = len*this.h;

    //stroke(0);
    //line(0,0,sin(PI/4)*(this.direction*this.h), cos(PI/4)*this.h);
    quad(this.offset+0, 0, this.offset+this.w, 0, this.offset+sin(PI/4)*(this.direction*h)+this.w, h*cos(PI/4), this.offset+sin(PI/4)*(this.direction*h), h*cos(PI/4) );
  }
}

