
  int larg= 800;
  int alt=  600;
  
  int quanti = int(random(6,40));
  int lato = larg/quanti;
  int quantiLarghezza = int(larg/lato);
  int quantiAltezza = int(larg/lato);
  int restox = larg-(lato*quantiLarghezza);
  int restoy = alt-(lato*quantiAltezza);
  int nx = 0;
  int ny = 0;
  int xoff;  
  int yoff;  
  int nunbElem = quanti*15;
  /** SETUP */
void setup() {
    colorMode(HSB,360); 
    background(0);
      size(larg,alt);
      smooth();
  }

  /** DRAW */

  public void draw() {
  background(0,300);
  if ( nx > 0){ 
    nx = int(random(width));
    nx = int(nx/lato)*lato; 
    ny = int(random (height));
    ny = int(ny/lato)*lato;
    } else {
    //posizionamento al centro  
    nx = lato*int((quanti/2));
    ny = 0;
    }
    for (int i = 0; i < nunbElem; i++){
      int rx = int(random(-2, 2));
      int ry = int(random(-2, 2));
      nx = nx + (lato*rx);
      ny = ny + (lato*ry);
      if (nx < lato){
        nx = lato; 
      }
      if (ny < lato){
        ny = lato; 
      }
      if (nx > width){
        nx = (width-lato)-restox;
      }
      if (ny > height){
        ny = (height-lato)-restoy; 
      }
      // Color dynamic generation
      int col = int(random(360));
      int sat = int(random(360));
      int bri = int(random(360));
     // println(col);
      //println(sat);
      //println(bri);
      // Call drawning class
      cerchio(nx,ny,col,sat,bri,360);
    }
       delay(10000);
  }

  void cerchio(int posx, int posy, int col, int sat, int bri, int trans){
    int radius = lato;
    int quoRotation = int(random(4))*90;
    for (int deg = 0; deg < 360; deg ++){
      float trasparenza = trans - deg;
      float angle = radians(deg+quoRotation);
      float x = posx + (cos(angle)*radius);
      float y = posy + (sin(angle)*radius);
      stroke(col,sat,bri,trasparenza);
      line (posx,posy,x,y);
    }
  }
  
 

