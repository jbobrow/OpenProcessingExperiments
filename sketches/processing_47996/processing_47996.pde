
public class CursorAxis {
  
  int axisLength = 50;
  Vec3D origin;
  public CursorAxis(Vec3D o)
  {
    origin = o;
  }
  
  //Draws and updates cursor
  void drawCursor(){
    
    fill(0);
    strokeWeight(5);
    
    //creates XYZ object using origin and expanding in 3 directons
    stroke(255,0,0);
      line(origin.x,origin.y,origin.z,origin.x+50,origin.y,origin.z);
    stroke(0,255,0);
      line(origin.x,origin.y,origin.z,origin.x,origin.y-50,origin.z);
    stroke(0,0,255);
      line(origin.x,origin.y,origin.z,origin.x,origin.y,origin.z+50);

    noFill();
    strokeWeight(1);
  }

  //resets origin and crosshair to (0,0,0)
  public void resetOrigin()
  {
    origin.x = 0;
    origin.y = 0;
    origin.z = 0;
    crosshair.x = 0;
    crosshair.y = 0;
    crosshair.z = 0; 
  }
  
}


