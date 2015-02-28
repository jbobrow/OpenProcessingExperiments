
HashSet lines = new HashSet();
boolean isDrawing;
float startX, startY;
float DROOP; 
void setup(){
  size(250,250); 
  frameRate(30);
  DROOP = width / 5;
}
void draw(){
  background(204);

  if(isDrawing){
    noFill();
    strokeWeight(3);
    stroke(180,180,180);
    bezier(startX,startY,startX,startY+DROOP,mouseX,mouseY+DROOP, mouseX,mouseY);
    
    
    

    float roughLength = sqrt(pow(startX-mouseX,2) + pow(startY - mouseY,2));
    int bulbcount = 1 + int(3.2 * (roughLength / (width )));

    for(int i = 1; i < bulbcount+1; i++ ){
      float t = i / float(bulbcount+1);
      float x = bezierPoint(startX, startX, mouseX, mouseX, t);
      float y = bezierPoint(startY, startY+DROOP, mouseY+DROOP, mouseY, t);
	ellipse(x,y,10,10);
    }
    
    
  }

  Iterator i = lines.iterator();
  while(i.hasNext()){
    Line liner = (Line)i.next(); 
    liner.drawLine();

  }
  i = lines.iterator();
  while(i.hasNext()){
    Line liner = (Line)i.next(); 
    liner.drawBulbs();

  }
}  

void mousePressed(){

  if (mouseEvent.getClickCount()==2) {
    isDrawing = false; 
  } 
  else {
      if(isDrawing){
    lines.add(new Line(startX,startY, mouseX,mouseY));
  }
    startX = mouseX;
    startY = mouseY; 
    isDrawing = true;
  }
}

void keyPressed(){
if(key == ' '){
  lines = new HashSet(); 
  isDrawing = false;
}
}


class Line{
  float startx,starty,endx,endy;
  ArrayList bulbs = new ArrayList();
  Line(float startx, float starty, float endx, float endy){
    this.startx = startx;
    this.starty = starty;
    this.endx = endx;
    this.endy = endy;

    float roughLength = sqrt(pow(startx-endx,2) + pow(starty - endy,2));
    int bulbcount = 1 + int(3.2 * (roughLength / (width )));

    for(int i = 1; i < bulbcount+1; i++ ){
      float t = i / float(bulbcount+1);
      float x = bezierPoint(startx, startx, endx, endx, t);
      float y = bezierPoint(starty, starty+DROOP, endy+DROOP, endy, t);
      bulbs.add(new Bulb(x,y));
    }


  }  
  void drawLine(){
    noFill();
    strokeWeight(3);
    stroke(0,80,0);
    bezier(startx,starty,startx,starty+DROOP,endx,endy+DROOP, endx,endy);
  }
  void drawBulbs(){
    Iterator i = bulbs.iterator();
    while(i.hasNext()){
      Bulb b = (Bulb)i.next(); 
      b.draw();
    }

  }

}

class Bulb{
  float x,y;
  float r = 0.0,g = 0.0,b = 0.0;
  int interval; 
  int counter = 0;
  boolean bright = true;
  float w = width/30;
  float h  = width/10;
  float ro = PI + random( -(PI/4),PI/4    );


  Bulb(float x, float y){
    this.x = x;
    this.y = y; 
    while(r == 0 && g == 0 && b == 0.0){
      r = (random(2) > 1)?255:0.0;
      g = (random(2) > 1)?255:0.0;
      b = (random(2) > 1)?255:0.0;
    }


    bright = true;
    interval = int(random(20,90));
  }
  void draw(){

    strokeWeight(2);
    stroke(0); 

    pushMatrix();
    translate(x,y);
    rotate(ro);

    if(bright){
      fill(r,g,b);
    } 
    else {
      fill(dim(r),dim(g),dim(b));
    }
    ellipse(0,-h/3,w,h);


    fill(0,80,0);
    rect(-w/2,-w/2,w,w);

    popMatrix();
    counter++;
    if(counter >= interval){
      counter = 0;
      bright = !bright; 
    }

  }
  float dim(float a){
    return(a + 64) / 2.0;
  }


}







