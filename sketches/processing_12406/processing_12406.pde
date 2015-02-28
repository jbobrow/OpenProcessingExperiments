
class Handle
{
  int x, y;
  int boxx, boxy;
  int xPosition, yPosition;
  int[] position;
  int size;
  
  // over variables
  boolean overY, overX, overXY;
  
  // press Variables
  boolean pressY, pressX, pressXY;
  
  // locked variables
  boolean lockedY = false;
  boolean lockedX = false;
  boolean lockedXY = false;
  
  boolean otherslocked = false;
  Handle[] others;
  int blah;

  Handle( int iy, int ix, int is, Handle[] o)
  {
    xPosition = ix;
    yPosition = iy;
    size = is;
    boxx = ix;
    boxy = iy;
    others = o;
  }

  int[] update() 
  {

    boxx = xPosition;
    boxy = yPosition;

    for(int i=0; i<others.length; i++) {
      if(others[i].lockedX == true || others[i].lockedY == true || others[i].lockedXY == true) {
        otherslocked = true;
        break;
      }      
      else {
        otherslocked = false;
      }
    }

    if(otherslocked == false) {
      overY();
      overX();
      overXY();
      pressY();
      pressX();
      pressXY();
    }

    if(pressY) {
      yPosition = lock(mouseY+size, size/2, height-size/2-1);
    } 
    if(pressX) {
      xPosition = lock(mouseX-size, size/2, width-size/2-1);
    }
    if(pressXY) {
      xPosition = lock(mouseX, size/2, width-size/2-1);
      yPosition = lock(mouseY, size/2, height-size/2-1);
    }
    int[] position = {xPosition,yPosition};
    return position;
  }

  void overY()
  {
    if(overRectY(boxx, boxy-size, size, size)) {
      overY = true;
    } 
    else {
      overY = false;
    }
  }

  void overX()
  {
    if(overRectX(boxx+size, boxy, size, size)) {
      overX = true;
    } 
    else {
      overX = false;
    }
  }

  void overXY()
  {
    if(overRectX(boxx, boxy, size, size)) {
      overXY = true;
    } 
    else {
      overXY = false;
    }
  }



  void pressY()
  {
    if(overY && mousePressed || lockedY) {
      pressY = true;
      lockedY = true;
    } 
    else {
      pressY = false;
    }
  }


  void pressX()
  {
    if(overX && mousePressed || lockedX) {
      pressX = true;
      lockedX = true;
    } 
    else {
      pressX = false;
    }
  }

  void pressXY()
  {
    if(overXY && mousePressed || lockedXY) {
      pressXY = true;
      lockedXY = true;
    } 
    else {
      pressXY = false;
    }
  }

  void release()
  {
    lockedY = false;
    lockedX = false;
    lockedXY = false;
  }

  void display() 
  {
    fill(255);
    strokeWeight(1);
    rectMode(CENTER);
    //x
    rect(boxx+size, boxy, size, size);
    //y
    rect(boxx, boxy-size, size, size);
    //XY
    rect(boxx, boxy, size, size);

    //overY
    if(overY || pressY) {
      fill(255,0,0);
      rect(boxx, boxy-size, size, size);
    }
    //overX
    if(overX || pressX) {
      fill(0,0,255);
      rect(boxx+size, boxy, size, size);
    }
    //overXY
    if(overXY || pressXY) {
      fill(0,255,0);
      rect(boxx, boxy, size, size);
    }
  }

  boolean overRectY(int x, int y, int width, int height) 
  {
    if (mouseX >= x-size/2 && mouseX <= (x-size/2)+width && 
      mouseY >= y-size/2 && mouseY <= (y-size/2)+height) {
      return true;
    } 
    else {
      return false;
    }
  }

  boolean overRectX(int x, int y, int width, int height) 
  {
    if (mouseX >= x-size/2 && mouseX <= (x-size/2)+width && 
      mouseY >= y-size/2 && mouseY <= (y-size/2)+height) {
      return true;
    } 
    else {
      return false;
    }
  }

  boolean overRectXY(int x, int y, int width, int height) 
  {
    if (mouseX >= x-size/2 && mouseX <= (x-size/2)+width && 
      mouseY >= y-size/2 && mouseY <= (y-size/2)+height) {
      return true;
    } 
    else {
      return false;
    }
  }



  int lock(int val, int minv, int maxv) 
  { 
    blah = min(max(val, minv), maxv);
    //println(blah);
    return  min(max(val, minv), maxv);
  }
}


