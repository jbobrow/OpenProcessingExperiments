
class Bod
{
  float x, y, w, h, id, d, lim;
  int load = 0;
  int timeOut = 0;
  int time = int(random(30)+50);

  Bod(int idn) 
  {
    id = idn;
    x = random(width);
    y = random(height);
    w = 10;
    h = 10;
  }

  void lim(float l) {
    lim = l;
  }

  void display()
  {

    //stroke(250-(load%250));
    //point(x,y);
    //    translate(x,y);
  }
  void time() {
    //timeOut++; 
    //print(timeOut);
    if(timeOut == time) {
      //println("argh");
    }
  }
  void move(int a, int b) {
    x+=random(a)-a/2;
    y+=random(b)-b/2;

    if(x>width+w) {
      x= -(w-1);
    }
    if(x<-w) {
      x+=width+(w-1);
    }
    if(y>height+h) {
      y= -(h-1);
    }
    if(y<-h) {
      y+=height+(h-1);
    }
    //return x, y;
  }

  void connect()
  {
    //float x1, float y1, float x2, float, 2y, 


    for(int p = 0; p < pocet; p++) {
      if(p != id) {  
        d = dist(x,y,b[p].x,b[p].y);

        if( d < lim) {
          
          //lim++;
         // grow++;
          stroke(250-(load%250),10);
          line(x,y,b[p].x,b[p].y);
          load++;
        }

        /*else {
          if(lim > ) {
            lim--;
          }
        }*/
      }
    }
  }
}


