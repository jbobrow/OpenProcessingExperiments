

class Flame {
  
  float x,y;
  float w,h;
  PShape fir = new PShape();
  PImage fire;// = new PImage();
  int jitter;
  float jitterAmount;
  int type;
  
  /**
  *This class takes in an x and y coordinate and a width and height for the fire.
  *
  */
  Flame(float a,float b,float w, float h, int type)
  {
    this.x = a;
    this.y = b;
    this.w = w;
    this.h = h;
    fire = new PImage((int)w,0);
    jitter = 0;
    jitterAmount = 5;
    if(type==0){
      fire = loadImage("data/graphics/fireBack.png");
      //fire.resize(w,h);
      //fire.width += w;
      //fire.height += h;
    } else if( type==1){ 
      fire = loadImage("data/graphics/fireTop.png");
      //fire.resize(w,h);
    } else if (type ==2){
      fire = loadImage("data/graphics/fireTop2.png");
    } else {
     //fir? 
    }
    imageMode(CENTER);
    
  }
  
  public void drawFlame() {
    //fill(200,10,0,70);
    //rect(x+jitterAmount*sin(jitter),y+jitterAmount*cos(jitter),diameter/3,diameter);
    //image(tex,x+diameter/2,y+diameter/2);
    
    //bezier(x+jitterAmount*cos(jitter),y+jitterAmount*sin(jitter),-20,500,-20,500,x+diameter,y+diameter);
    if(type==0){
      image(fire,x,y,w,h);
    } else if( type==1){ 
      image(fire,x,y,w,h);
    } else if (type ==2){
      shape(fir,x,y, w, h);
    }
    /*println("x : " + w);
    println("y : " + h);
    image(fire,x,y,w,h);
    //image(fire,x,y);
    */
    jitter ++;
    jitterAmount = y*sin(jitter);
  }
  
  public void setSize(float w,float h){
    this.w = w;
    this.h = h;
  }
  
  public void increaseSize(float w,float h){
    this.w += w;
    this.h += h;
    this.y -= h/2;
  }
  
   public void decreaseSize(float w,float h){
    this.w -= w;
    this.h -= h;
    this.y += h/2;
   }
   
   public void gradualDecrease(float w, float h){
     this.w -= w;
    this.h -= h;
    this.y += h/2;
   }
  
  /*
  *Moves the x and y the respective distances
  */
  public void move(float x, float y){
    this.x += x;
    this.y += y;
  }
  
}

