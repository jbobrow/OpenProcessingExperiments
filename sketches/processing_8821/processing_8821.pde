
public class Circles{
  PGraphics pg;
  float x, y;
  public Circles(float _x, float _y){
    x = _x;
    y = _y;
    pg = createGraphics(100, 100, P3D);
    }
    
  public void show(){
    float angle = atan2(mouseY - y, mouseX - x);
    pg.beginDraw();
    pg.noStroke();
    pg.pushMatrix();
    pg.translate(pg.width/2, pg.height/2);
    pg.rotate(angle);    
    //circle 1
    pg.fill(fillColor(4));
    pg.ellipse(0, 0, 90, 90);
    //circle 2
    pg.fill(fillColor(3));
    pg.ellipse(10, 0, 70, 70);
    //circle 3
    pg.fill(fillColor(2)); 
    pg.ellipse(20, 0, 50, 50);
    //circle 4
    pg.fill(fillColor(1));  
    pg.ellipse(30, 0, 30, 30);
    pg.popMatrix();  
    pg.endDraw();    
   image(pg, x-pg.width/2, y-pg.height/2);
    
  } 
}

