
class Ribbon {
  PVector loc;
  PVector end;
  float length;
  int col;
  boolean vertical;
  boolean direction;
  
  boolean growing;
  boolean branching;
  boolean dying;
  boolean dead;
  
  boolean rStart;
  boolean rEnd;
  
  int age;
  
  RibbonSet parent;
  
  Ribbon(RibbonSet Parent, float X, float Y, boolean Vertical, boolean Direction, int Col) {
    parent = Parent;
    
    loc = new PVector(X,Y);
    end = new PVector(X,Y);
    col = Col;
    length = 0;
    growing = true;
    branching = false;
    dead = false;
    
    age = 0;
    
    vertical = Vertical;
    direction = Direction;
    rStart = randBool();
    rEnd   = rStart;
  }
  
  void grow() {
    if (growing) {
      if (direction) {
        length++;
      } else {
        length--;
      }
      if (!branching && abs(length)>ribbonWidth*5) {
        branching = true;
      }
    }
  }
  
  void update() {
    age++;
    
    if (dying) {
      if (direction) {
        length--;
      } else {
        length++;
      }
      if (vertical) {
        if (direction) {
          loc.y++;
        } else {
          loc.y--;
        }
      } else {
        if (direction) {
          loc.x++;
        } else {
          loc.x--;
        }
      }
      if (abs(length)<=1) {
        dead=true;
      }
    }
    
    if (growing) {
      if (abs(length)>ribbonWidth*5) {
        if (sometimes(3)) {
          turn();
        } else
        if (branching && sometimes(12)) {
          branch();
        } else
        if (abs(length)>ribbonWidth*5 && sometimes(.6)) {
          stopGrowing();
        }
      }
      
      if (vertical) {
        end.y=loc.y+length;
      } else {
        end.x=loc.x+length;
      }
    } else {
      if (branching) {
        if (sometimes(1)) {
          branch();
        } else
        if (sometimes(1)) {
          branching = false;
        }
      }
    }
    
    if (age>300) {
      die();
    }
  }
  
  void die() {
    /*
    PVector tempPoint = new PVector(loc.x,loc.y);
    loc.x = end.x;
    loc.y = end.y;
    end.x = tempPoint.x;
    end.y = tempPoint.y;
    */
    dying = true;
  }
  
  void render() {
    fill(colors[col]);
    beginShape();
    if (vertical) {
      // VERTICAL RIBBONS
      if (!rStart) {
        vertex(loc.x+ribbonWidth/2,loc.y-ribbonWidth/2);
        vertex(loc.x-ribbonWidth/2,loc.y+ribbonWidth/2);
      } else {
        vertex(loc.x+ribbonWidth/2,loc.y+ribbonWidth/2);
        vertex(loc.x-ribbonWidth/2,loc.y-ribbonWidth/2);
      }
      if (!rEnd) {
        vertex(loc.x-ribbonWidth/2,loc.y+length+ribbonWidth/2);
        vertex(loc.x+ribbonWidth/2 ,loc.y+length-ribbonWidth/2);
      } else {
        vertex(loc.x-ribbonWidth/2,loc.y+length-ribbonWidth/2);
        vertex(loc.x+ribbonWidth/2 ,loc.y+length+ribbonWidth/2);
      }
    } else {
      // HORIZONTAL RIBBONS
      if (!rStart) {
        vertex(loc.x+ribbonWidth/2,loc.y-ribbonWidth/2);
        vertex(loc.x-ribbonWidth/2,loc.y+ribbonWidth/2);
      } else {
        vertex(loc.x-ribbonWidth/2,loc.y-ribbonWidth/2);
        vertex(loc.x+ribbonWidth/2,loc.y+ribbonWidth/2);
      }
      if (!rEnd) {
        vertex(loc.x+length-ribbonWidth/2,loc.y+ribbonWidth/2);
        vertex(loc.x+length+ribbonWidth/2,loc.y-ribbonWidth/2);
      } else {
        vertex(loc.x+length+ribbonWidth/2,loc.y+ribbonWidth/2);
        vertex(loc.x+length-ribbonWidth/2,loc.y-ribbonWidth/2);
      }
    }
    endShape();
  }
  
  void stopGrowing() {
    growing = false;
    if (abs(length)<ribbonWidth*2) {
      die();
    }
  }
  
  void turn() {
    stopGrowing();
    Ribbon newRibbon;
    if (vertical) {
      newRibbon = parent.addRibbon(loc.x, loc.y+length, !vertical, randBool(), col, this);
    } else {
      newRibbon = parent.addRibbon(loc.x+length, loc.y, !vertical, randBool(), col, this);
    }
    if (newRibbon !=null) {
      rEnd = direction==newRibbon.direction;
      newRibbon.rStart = direction==newRibbon.direction;
      newRibbon.rEnd = direction==newRibbon.direction;
    }
  }
  
  void branch() {
    if (vertical) {
      parent.addRibbon(loc.x+ribbonWidth+ribbonSpacing,loc.y+length, vertical, randBool(), randInt(4));
    } else {
      parent.addRibbon(loc.x+length,loc.y+ribbonWidth+ribbonSpacing, vertical, randBool(), randInt(4));
    }
  }
  
  void dodge() {
    //stopGrowing();
    if (sometimes(90)) {
      turn();
    } else {
      stopGrowing();
    }
  }
  
  boolean endCollide(Ribbon R) {
    if (loc.x==R.end.x && loc.y==R.end.y) {
      return false;
    }
    if ((abs(end.x-R.end.x)<ribbonWidth+ribbonSpacing &&
        abs(end.y-R.end.y)<ribbonWidth+ribbonSpacing) ||
        
        (abs(loc.x-R.loc.x)<ribbonWidth+ribbonSpacing &&
        abs(loc.y-R.loc.y)<ribbonWidth+ribbonSpacing) ||
        
        (abs(end.x-R.loc.x)<ribbonWidth+ribbonSpacing &&
        abs(end.y-R.loc.y)<ribbonWidth+ribbonSpacing) ||
        
        (abs(loc.x-R.end.x)<ribbonWidth+ribbonSpacing &&
        abs(loc.y-R.end.y)<ribbonWidth+ribbonSpacing))
     {
       return true;
     }
     return false;
  }
  
  boolean collide(Ribbon R) {
    if (loc.x==R.end.x && loc.y==R.end.y) {
      return false;
    }
    if (vertical==R.vertical) {
      // PARALLEL RIBBONS
      if ( R.vertical &&  R.direction) {
        if (end.x<R.loc.x+ribbonWidth+ribbonSpacing && end.x>R.loc.x-ribbonWidth-ribbonSpacing &&
            end.y>R.loc.y-ribbonWidth-ribbonSpacing && end.y<R.end.y+ribbonWidth+ribbonSpacing)
        {
          return true;
        }
      } else
      if ( R.vertical && !R.direction) {
        if (end.x<R.loc.x+ribbonWidth+ribbonSpacing && end.x>R.loc.x-ribbonWidth-ribbonSpacing &&
            end.y<R.loc.y+ribbonWidth+ribbonSpacing && end.y>R.end.y-ribbonWidth-ribbonSpacing)
        {
          return true;
        }
      } else
      if (!R.vertical &&  R.direction) {
        if (end.y<R.loc.y+ribbonWidth+ribbonSpacing && end.y>R.loc.y-ribbonWidth-ribbonSpacing &&
            end.x>R.loc.x-ribbonWidth-ribbonSpacing && end.x<R.end.x+ribbonWidth+ribbonSpacing)
        {
          return true;
        }
      } else
      if (!R.vertical && !R.direction) {
        if (end.y<R.loc.y+ribbonWidth+ribbonSpacing && end.y>R.loc.y-ribbonWidth-ribbonSpacing &&
            end.x<R.loc.x+ribbonWidth+ribbonSpacing && end.x>R.end.x-ribbonWidth-ribbonSpacing)
        {
          return true;
        }
      }
    } else {
      // PERPENDICULAR RIBBONS
      if ( R.vertical &&  R.direction) {
        if (end.x<=R.loc.x+ribbonWidth+ribbonSpacing && end.x>=R.loc.x-ribbonWidth-ribbonSpacing &&
            end.y>=R.loc.y-ribbonWidth-ribbonSpacing && end.y<=R.end.y+ribbonWidth+ribbonSpacing)
        {
          return true;
        }
      } else
      if ( R.vertical && !R.direction) {
        if (end.x<=R.loc.x+ribbonWidth+ribbonSpacing && end.x>=R.loc.x-ribbonWidth-ribbonSpacing &&
            end.y<=R.loc.y+ribbonWidth+ribbonSpacing && end.y>=R.end.y-ribbonWidth-ribbonSpacing)
        {
          return true;
        }
      } else
      if (!R.vertical &&  R.direction) {
        if (end.y<=R.loc.y+ribbonWidth+ribbonSpacing && end.y>=R.loc.y-ribbonWidth-ribbonSpacing &&
            end.x>=R.loc.x-ribbonWidth-ribbonSpacing && end.x<=R.end.x+ribbonWidth+ribbonSpacing)
        {
          return true;
        }
      } else
      if (!R.vertical && !R.direction) {
        if (end.y<=R.loc.y+ribbonWidth+ribbonSpacing && end.y>=R.loc.y-ribbonWidth-ribbonSpacing &&
            end.x<=R.loc.x+ribbonWidth+ribbonSpacing && end.x>=R.end.x-ribbonWidth-ribbonSpacing)
        {
          return true;
        }
      }
    }
    return false;
  }
}






