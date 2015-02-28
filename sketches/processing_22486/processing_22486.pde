
import geomerative.*;
RFont font;
RPoint[] points;

void setup(){
  RG.init(this);
  size(500,500);
  font=new RFont("Arial Rounded MT Bold.ttf",200,RFont.CENTER);
  RCommand.setSegmentLength(3);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  
  RShape shape=font.toShape("cat");
  points= shape.getPoints();
}

void draw(){
  for(int i=0;i<points.length;i++){
    line(points[i].x+200,points[i].y+300,30,530);
  }
}

                
                
