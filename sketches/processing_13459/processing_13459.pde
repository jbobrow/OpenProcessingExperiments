
class Slider_GUI {
  int x,y,w,mv,Mv,v,ex,ey;
  int ed = 20;
  
  Slider_GUI( int ix, int iy, int iw, int imv, int iMv, int iv ){
    x = ix;
    y = iy;
    w = iw;
    mv = imv;
    Mv = iMv;
    v = iv;
    ey = y;
    ex = round( map( v,mv,Mv,x,x+w ) );
    this.drawUI();
  }
  
  boolean ui(){
    if( dist( Mx,My,ex,ey ) < .7*ed ){
      return true;
    } else {
      return false;
    }
  }
  
  int setVal(){
    ex = round( Mx );
    if ( ex < x+w && ex > x ){
      this.drawUI();
      v = round( map( ex-x,0,w,mv,Mv ) );
    }
    return v;
  }
  
  void drawUI(){
    if ( ex > x+w ) { ex = x+w;
    } else if ( ex < x ) { ex = x; }
    if ( ex <= x+w && ex >= x ){
      fill( 255,60 );
      noStroke();
      rect( x-ed/2,y-ed/2,w+ed,ed );
      stroke( 0,50 );
      line( x,y,x+w,y );
      fill( 0,50 );
      noStroke();
      ellipse( ex,ey,ed,ed );
    } 
  }
  
}

