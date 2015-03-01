
int numLines=500; 
MovingLine[]lines=new MovingLine[numLines];
int currentLine=0;

void setup(){
  size(500,500);
  smooth();
  frameRate(30);
  for(int i=0;i<numLines;i++){
    lines[i]=new MovingLine();
  }
}
void draw(){
  background(0);
  for(int i=0;i<currentLine;i++){
    lines[i].display();
  }
}
void mouseDragged(){
  lines[currentLine].setPosition(mouseX,mouseY,pmouseX,pmouseY);
  if(currentLine<numLines-1){
    currentLine++;
  }
}
  class MovingLine{
  float x1,y1,x2,y2;
  
  void setPosition(int x,int y,int px,int py){
    x1=x;y1=y;x2=px;y2=py;
  }
  void display(){
    strokeWeight(random(1,40));
    stroke(random(0,255),60);
    x1+=random(-1,1);
        y1+=random(-1,1);
            x2+=random(-1,1);
                y2+=random(-1,1);
               ellipse(x2,y2,20,20);   
            ellipse(x1,y1,2,2);   
     // text("A",x1,y1);
      
  }
}


