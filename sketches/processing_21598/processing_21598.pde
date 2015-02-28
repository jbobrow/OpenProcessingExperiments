
int num = 6;
int x = 225;
int y = 50;

Rect[] myRects = new Rect[num]; 
color[] myColors = new color[3];

void setup(){
  size(300,300);
  rectMode(CENTER);
  
  myColors[0] = color(x,0,0,y);
  myColors[1] = color(0,x,0,y);
  myColors[2] = color(0,0,x,y);
  //myColors[3] = color(x,y,0,0);
  //myColors[4] = color(0,x,y,0);
  //myColors[5] = color(x,0,y,0);
  
  
  for( int i=0; i < myRects.length; i++){
  myRects[i] = new Rect();
  }
    
  noStroke();
}

void draw(){
  background(x);
  
  for(int i=0; i < myRects.length; i++) {
  myRects[i].update();
  myRects[i].display();
  }
}

class Rect{
  float rectSize = random(100);
  float rectX = random( 20, width - 20);
  float rectY = random( 20,height - 20);
  color col = myColors[floor(random(0,3))];
  
  Rect(){
  }
  
  void update(){
    
    this.rectSize++;
    if(this.rectSize > width){
      this.rectSize = 1;
      rectX = random(20,width-20);
      rectY = random(20,width-20);
    }
  }
    
    void display(){
      fill(col);
      rect(rectX, rectY, rectSize, rectSize);
    }
}
      
    
  
  
  
  



