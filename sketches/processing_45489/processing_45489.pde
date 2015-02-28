
/*
"CircleDraw" by Nate "ZombieProof"
 Created November 09, 2011.
*/



//Handles array; holds all handles created
Handle[] handles;
//number of handles
final int num = 3;
//size of handles
final int hsize = 10;

void setup()
{
 
  size(200, 200);
  handles = new Handle[num];
  //initialize handles
  for(int i=0; i<num; i++) {
    handles[i] = new Handle(width/4*(i+1), height/2, 50-hsize/2, 10, handles);
  }
}

void draw()
{
  background(153);
  
  float handle1X, handle1Y, handle2X, handle2Y, handle3X, handle3Y;
  
  //for easier code later I compressed the center of each handle into a single variable
  handle1X = handles[0].boxx+hsize/2;
  handle1Y = handles[0].boxy+hsize/2;
  handle2X = handles[1].boxx+hsize/2;
  handle2Y = handles[1].boxy+hsize/2;
  handle3X = handles[2].boxx+hsize/2;
  handle3Y = handles[2].boxy+hsize/2;
  
  stroke(255);
  //handle line connectors; created by using the array that holds the handles
  line(handle1X, handle1Y, handle2X, handle2Y);
  line(handle2X, handle2Y, handle3X, handle3Y);
  line(handle3X, handle3Y, handle1X, handle1Y);
  
  //update display of handles
  for(int i=0; i<num; i++) {
    handles[i].update();
    handles[i].display();
  }
  
  
  //check if points are in the same place
  if(dist(handle1X, handle1Y, handle2X, handle2Y)!=0&&
  dist(handle2X, handle2Y, handle3X, handle3Y)!=0&&
  dist(handle3X, handle3Y, handle1X, handle1Y)!=0)
  {
    //two slopes from points
    float slope1 = (handle1Y-handle2Y)/(handle1X-handle2X);
    float slope2 = (handle2Y-handle3Y)/(handle2X-handle3X);
    //make sure that the points aren't in a line
    if(slope1!=slope2){
      //equation mumbo-jumbo; take from http://regentsprep.org/Regents/math/geometry/GCG6/RCir.htm
      float centerX = (slope1*slope2*(handle3Y-handle1Y) + slope1*(handle2X+handle3X) - slope2*(handle1X+handle2X))/(2*(slope1-slope2));
      float centerY = -1/slope1*(centerX-(handle1X+handle2X)/2)+(handle1Y+handle2Y)/2;
      float radius = dist(centerX, centerY, handle2X, handle2Y);
      //draw the circle
      noFill();
      stroke(255,0,0);
      ellipse(centerX, centerY, 2*radius, 2*radius);
    }
  }
}

void mouseReleased() 
{
  for(int i=0; i<num; i++) {
    handles[i].release();
  }
}


//not much to see from here on out, I just reworked the handles sample code from Processing.org a bit to allow for 2d movement
class Handle
{
  int x, y;
  int boxx, boxy;
  int locX;
  int locY;
  int size;
  boolean over;
  boolean press;
  boolean locked = false;
  boolean otherslocked = false;
  Handle[] others;
  
  Handle(int ix, int iy, int il, int is, Handle[] o)
  {
    x = ix;
    y = iy;
    size = is;
    boxx = x;
    boxy = y;
    others = o;
  }
  
  void update() 
  {
    boxx = x;
    boxy = y;
    
    for(int i=0; i<others.length; i++) {
      if(others[i].locked == true) {
        otherslocked = true;
        break;
      } else {
        otherslocked = false;
      }  
    }
    
    if(otherslocked == false) {
      over();
      press();
    }
    
    if(press) {
      x = mouseX-size/2;
      y = mouseY-size/2;
    }
  }
  
  void over()
  {
    if(overRect(boxx, boxy, size, size)) {
      over = true;
    } else {
      over = false;
    }
  }
  
  void press()
  {
    if(over && mousePressed || locked) {
      press = true;
      locked = true;
    } else {
      press = false;
    }
  }
  
  void release()
  {
    locked = false;
  }
  
  void display() 
  {
    
    fill(255);
    stroke(0);
    rect(boxx, boxy, size, size);
    //line(boxx+size/2, boxy+size/2, others[0].boxx, others[0].boxy);
    if(over || press) {
      line(boxx, boxy, boxx+size, boxy+size);
      line(boxx, boxy+size, boxx+size, boxy);
    }

  }
}

boolean overRect(int x, int y, int width, int height) 
{
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

int lock(int val, int minv, int maxv) 
{ 
  return  min(max(val, minv), maxv); 
} 

