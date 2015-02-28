
import java.awt.Point;
PGraphics pg;

ArrayList<Point> ps = new ArrayList();

void setup()
{
  background(0);
  size(400,400,P2D);
  ellipseMode(CENTER);
  noStroke();
  smooth();
  
  noCursor();
  
  pg = createGraphics(width/3,height/3,P2D);
  
  colorMode(HSB,255);
  
  frameRate(60);
  
  strokeJoin(ROUND);
  strokeCap(ROUND);
}

void draw()
{
  ps.add(new Point(mouseX,mouseY));
  
  if(ps.size()>20) ps.remove(0);
  
  noFill();
  strokeWeight(8);
  stroke((frameCount/2.0)%255,255,255);
  
  if(ps.size() > 2){
    for(int i=1;i<ps.size();i++){
      line(ps.get(i-1).x,ps.get(i-1).y,ps.get(i).x, ps.get(i).y);
    }
  }
  
  pg.beginDraw();
  pg.background(0);
  pg.blend(get(),0,0,width,height,0,0,pg.width,pg.height,ADD); // to be small
  pg.endDraw();
  
  background(0);
  
  blend(pg,0,0,pg.width,pg.height,0,0,width,height,ADD);
  
  println(frameRate);
}

