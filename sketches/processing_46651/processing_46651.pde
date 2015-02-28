
Z [] zarray= new Z[100];
int tops=120;


void setup() {
  size(1000, 1000);
  background(0);
  smooth();

  for (int i=0;i<zarray.length;i++) {
    float x=random(tops,width-tops);
    float y=random(tops,height-tops);
    float s=random(10, tops);
    float xm=random(-10,10);
    float ym=random(-10,10);

    zarray[i]= new Z(x, y, xm, ym, s, i, zarray);//x,y,size,id,and an array of class Z
  }
}

  void draw() {
    background(0);
    for (int i=0; i<zarray.length; i++) {
      zarray[i].connect();
      zarray[i].move();
      zarray[i].display();
    }
    
    if(mousePressed){
      println(frameCount);
    }
  }

  class Z {
    float x, y, s;
    int id;
    float xm=0;
    float ym=0;
    float xf, yf;
    Z[] others;

    Z(float cx, float cy, float cxm, float cym, float cs, int cid, Z[] co) {
      x=cx;
      y=cy;
      s=cs;
      id=cid;
      others=co;
      xm=cxm;
      ym=cym;
    }

    void connect() { //+ interact in other ways
      for (int i=id+1;i<zarray.length;i++) {
        float distance=dist(others[i].x, others[i].y, x, y);
        float minDist = others[i].s/2 + s/2;
        if (minDist>distance) {
          stroke(255,100);
          line(others[i].x, others[i].y, x, y);
          
          /* //"slow follow formula for when the circles are touching
          x=x+(others[i].x-x)/20;
          y=y+(others[i].y-y)/20;
          *///
        }
        
        
         //formula for making circles push away from each other
        if(frameCount>2){ // so the circles don't go crazy in the beginning when there's no real mouseX+Y
        xm = xm + .1/(x-others[i].x);
        ym = ym + .1/(y-others[i].y);
        }
        //
        
        
      }
      
      }

      void move() { //and correct if they leave the window
        xf=xm/100;//determine how much friction
        yf=ym/100;
        
        xm-=xf;//take friction away from movement
        ym-=yf;
        
        x+=xm; //speed to location
        y+=ym;
        
        if (x>width-s/2 || x<s/2) {
          xm=-xm;
        }
        if (y>height-s/2 || y<s/2) {
          ym=-ym;
        }
        
        if(x<-10 || x>width+10){ //if it leaves the screen
          x=width/2;
          y=height/2;
          xm=random(-10,10);
          ym=random(-10,-10);
        }
      }
      

      void display() {
        fill(30, 10, 220, 60);
        noStroke();
        ellipse(x, y, s, s);
      }
  }

