

santa s;
HashSet skids = new HashSet();

float RING = 225;

void setup(){
  size(250,250);
   frameRate(50); 
  s = new santa(125,180);
}
void draw(){
  background(255);
  noStroke();
  fill(225,225,255);
  ellipse(125,125,RING,RING);
  
  Iterator si = skids.iterator();
  while(si.hasNext()){
     skid sk = (skid)si.next();
     sk.draw();
  }
  s.move();
  s.draw(); 
  
}

void mousePressed(){
  s.xs = (mouseX - s.x )/ 20;
  s.ys = (mouseY - s.y )/20;
  s.skid();
}
class skid{
  float x1,y1,x2,y2;
  float SIZE=width/10;
  skid(float x1, float y1, float x2, float y2){
    this.x1 = x1; 
    this.y1 = y1; 
    this.x2 = x2; 
    this.y2 = y2; 
  }
  void draw(){
    strokeWeight(2);
    stroke(200);
    line(x1,y1,x2,y2);
  }

}

boolean inRing(float  x, float y){
  return
  dist(125,125,x,y) <= 110;
}

class santa {
  float x,y;
  float xs,ys;
  float SIZE = width/10;
  santa(float x, float y){
    this.x = x;
    this.y = y; 
  }

  void skid(){
      float xleft1 = this.x-SIZE*.5;
      float xleft2 = xleft1 + xs;
      float xright1 = this.x+SIZE*.5;
      float xright2 = xright1 + xs;
      float y1 = this.y+SIZE*.4;
      float y2 = y1+ys;
      
    if(inRing(xleft1,y1) && inRing(xleft2,y2))
     skids.add(new skid(xleft1,y1,xleft2,y2));
    
    
    if(inRing(xright1,y1) && inRing(xright2,y2)) 
     skids.add(new skid(xright1,y1,xright2,y2)); 
     
     
     
  }


  void move(){
    x = x + xs;
    y = y + ys;

    if(! inRing(this.x, this.y)){
      
      xs *= -1.1;
      ys *= -1.1; 
      //x = x + xs;
      //y = y + ys;
      skid();  
  }

    xs *= .98;
    ys *= .98; 
  }


  void draw(){
    strokeWeight(2);
    stroke(0);
    fill(0);

    boolean front = true;
    if(ys < 0) {
      front = false; 
    }

    rect(x-SIZE*.5,y+SIZE*.4,SIZE/3,SIZE/5);
    rect(x+SIZE*.5,y+SIZE*.4,-SIZE/3,SIZE/5);
    fill(200);
    noStroke();
    rect(x-SIZE*.5,y+SIZE*.48,SIZE/3,SIZE/8);
    rect(x+SIZE*.5,y+SIZE*.48,-SIZE/3,SIZE/8);

    stroke(0);

    if(!front) {
      fill(255); 
      ellipse(x, y-SIZE/2, SIZE*2/3, SIZE*2/3);// back of head

    } 


    fill(255,0,0);
    ellipse(x,y,SIZE,SIZE); //body
    fill(255); 
    rect(x-SIZE/2,y,SIZE,SIZE/8); //belt
    if(front) {
      fill(255,128,128); //skin
      ellipse(x, y-SIZE/2, SIZE*2/3, SIZE*2/3);//head

    } 
    if(front){
      fill(255);
      triangle(x - SIZE*.4,y-SIZE/2,x+SIZE*.4,y-SIZE/2,x,y); //beard
    }
    fill(255,0,0);
    triangle(x - SIZE/3,y-SIZE*.75,x+SIZE/3,y-SIZE*.75,x,y-SIZE*1.2); //hat
    fill(255);
    ellipse(x,y-SIZE*1.2,SIZE/4,SIZE/4);
  }

}





