
import java.awt.Robot;

Robot robot;
float rmx, rmy;

void setup() {
  size(400,400);
  noCursor();
//following lines create the java "Robot" used to control mouse pos
//it has to be in a try / catch block because its possible for it
//to throw an exception
  try{ robot = new Robot(); }
  catch(Throwable e){}
}

void draw() {
  background(204);
    
    robot.mouseMove(frame.getX()+this.getX()+round(width/2),
      frame.getY()+this.getY()+round(height/2));
//above line moves mouse pos to center of canvas
//frame.getX() is the horizontal pos of the window top left (or so)
//this.getX (or just getX()) gets offset from window frame to canvas
//required because robot's coords are global not relative to canvas
    rmx += mouseX-width/2;
    rmy += mouseY-height/2;
//mouse pos is locked in center of canvas
//above lines subtract the centering, get whatever offset from
//center user creates by moving mouse before robot resets it, then
//continously adds that to our new mouse pos variables
    rmx = rmx>width?rmx-width:rmx;
    rmx = rmx<0?width+rmx:rmx;
    rmy = rmy>height?rmy-height:rmy;
    rmy = rmy<0?height+rmy:rmy;
//above four lines are just shortened conditionals to handle
//wrapping of our mouse pos variables when they go outside canvas
//first one:
//if rmx>width? set rmx to rmx-width else : set rmx to rmx
    
    ellipse(rmx,rmy, 7,7);
}

