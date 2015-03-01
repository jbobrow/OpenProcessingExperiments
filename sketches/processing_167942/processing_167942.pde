

import java.util.*;



final float Zoom  = 100;
final float iZoom = 1.0/Zoom; 

final int szx = 500; 
final int szy = 250;

final float MAX_VR2 = 10000;

MyStreamFunction myFunc;








/*
interface ScalarFunction2D{
  double eval2D( double x, double y ){};
}

interface VectorFunction2D{
  double eval2D( double x, double y,  ){};
}
*/

class AeroFunction{
  double vx,vy;
  double phi;
  
  double strength;

  void eval( double x, double y){};
}

class MyStreamFunction extends FreeStream {

  LinkedList<AeroFunction> components;
  
  MyStreamFunction( double alfa, double strength){
    super(alfa,strength);
    components = new LinkedList<AeroFunction>();
  }
  
  void eval( double x, double y){
     super.eval( x,y );
     
     for ( AeroFunction comp: components){
       //println( comp );
       comp.eval(x,y);
       vx+=comp.vx; 
       vy+=comp.vy;
       phi+=comp.phi;
     }
     
  }
}


class FreeStream extends AeroFunction{
  
    double alfa;
    double sa,ca;
    
     FreeStream( double alfa, double strength){
      this.alfa = alfa; 
      this.ca   = Math.cos(alfa); 
      this.sa   = Math.sin(alfa); 
      this.strength=strength;  
    }
    
    void eval( double x, double y){
      vx = strength*ca;
      vy = strength*sa;
    };
}

class PointFunction extends AeroFunction{
  double posx,posy;
  PointFunction( double posx, double posy, double strength){    this.strength=strength; this.posx=posx; this.posy=posy;    }
}

class Source extends PointFunction{
  
  Source( double posx, double posy, double strength){    super(posx,posy,strength);   }
  void eval( double x, double y){
    double dx = x-posx;
    double dy = y-posy;
    //double scaling = strength/Math.sqrt( dx*dx + dy*dy );
    double scaling = strength/( dx*dx + dy*dy );
    vx = dx*scaling;
    vy = dy*scaling;
    //println( x,y, vx,vy );
  };
}

class DoubletX extends PointFunction{
    
    DoubletX( double posx, double posy, double strength){ super(posx,posy,strength);  }
  
    void eval( double x, double y){
      double dx = x-posx; double dx2=dx*dx;
      double dy = y-posy; double dy2=dy*dy;
      double ir2 = 1/( dx2 + dy2 );
      double ir4 = ir2*ir2;
      vx = (dx2-dy2);
      vy =  2*dx*dy;
    };
}

class Doublet extends PointFunction{

    double alfa;
    double sa,ca;
    
    Doublet( double posx, double posy, double alfa, double strength){
      super(posx,posy,strength); 
      this.alfa = alfa; 
      this.ca   = Math.cos(alfa); 
      this.sa   = Math.sin(alfa); 
      println( ca,sa );
    }
      
    void eval( double x, double y){
      double dx = x-posx; double dx2=dx*dx;
      double dy = y-posy; double dy2=dy*dy;
      double ir2 = 1/( dx2 + dy2 );
      double scaling = strength*ir2*ir2;
      double a = dx2-dy2;
      double b = 2*dx*dy;
      vx = ( sa*a + ca*b )*scaling;
      vy = ( sa*b + ca*a )*scaling;
    };
}



class Vortex extends PointFunction{

    
    Vortex( double posx, double posy, double strength){
      super(posx,posy,strength);  
    }
      
    void eval( double x, double y){
      double dx = x-posx; 
      double dy = y-posy; 
      double scaling = strength/( dx*dx + dy*dy );
      vx = y*scaling;
      vy = x*scaling;
    };
}




float x2s( double x){ return Zoom*(float)x+szx; }
float y2s( double y){ return Zoom*(float)y+szy; }

double s2x( double sx){ return (sx-szx)*iZoom; }
double s2y( double sy){ return (sy-szy)*iZoom; }

void traceStreamLine( double startX, double startY, AeroFunction func, double dt, int n ){
  double x = startX;
  double y = startY;
  for (int i=0; i<n; i++){
    double ox=x,oy=y;
    func.eval( x, y );
    double vx = func.vx;
    double vy = func.vy;
    double vr2 = vx*vx + vy*vy; 
    if( vr2 > MAX_VR2 ){
      break;
    }else{
      x+= func.vx*dt;
      y+= func.vy*dt;
      //println( x,y );
      float clr = 2*255*(float)Math.log( func.vx*func.vx + func.vy*func.vy  );
      //stroke( 1-clr,0, clr );
      line(x2s(ox),y2s(oy),x2s(x),y2s(y));
    }
  }
}



























void setup(){
  size(2*szx,2*szy);

  myFunc = new MyStreamFunction( 0, 1.0 );
  /*
  myFunc.components.add( new Source( 0,0,  0.5 )  );
  myFunc.components.add( new Source( 0.25,0, -0.25 )  );
  myFunc.components.add( new Source( 0.5,0,  -0.20 )  );
  myFunc.components.add( new Source( 1.0,0,  -0.05 )  );
  */
  
  //myFunc.components.add( new Doublet ( 0, 0,   PI/2   ,   -0.5 )  );
  //myFunc.components.add( new Doublet ( 0.5, 0,      0   ,  -0.1 )  );
  
  //myFunc.components.add( new Doublet ( -2, 0.5,   PI/2   ,   -0.2 )  );
  //myFunc.components.add( new Doublet ( 3.2, 0,   PI/3   ,   -0.1 )  );
  //myFunc.components.add( new Doublet ( 0, 0,   PI/2   ,   -0.13 )  );
  
  
  myFunc.components.add( new Doublet ( -2, 0.5,   PI/2   ,   -0.2 )  );
  
  myFunc.components.add( new Vortex ( 0, 0,    -0.43 )  );

/*
  for ( int i=0; i<(2*szy); i+=5 ){
    traceStreamLine( -4, s2y(i), myFunc, 0.01, 1000 );
  }
*/  
  
}



void draw(){
  stroke(random(255),10);
  for ( int i=0; i<1000; i+=5 ){
    traceStreamLine( s2x(random(0,width)), s2y( random(0,height) ), myFunc, 0.01, 100 );
  }

}

