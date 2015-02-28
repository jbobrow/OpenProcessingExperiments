
  Stick stick;
  public void setup() {
    size(800,800);
    initStick();
    smooth();
  }

  public void draw() {
    stick.display();
  }

  public void mousePressed() { 
    initStick();
  }

  private void initStick(){
    stick = new Stick(width/2, height, 50, 255);
    background(255);
  }
   
   class Stick {
   
    float x;
    float y; 
    float twidth;
    float theight;
    boolean parentStick;
    float xVelocity;
    float yVelocity;
    Stick[] sticks = new Stick[1000];
    int stickArrayLenght ;
    float vampireLife ;
    float life;
  
      public Stick( float x, float y, float twidth, float life, float xVelocity, float yVelocity){
      this.x = x;
      this.y = y;
      this.stickArrayLenght = 0;
      this.twidth = twidth;
      this.theight = twidth;
      this.life = life;  
      this.yVelocity = yVelocity;
      this.xVelocity = xVelocity;
      parentStick = false;
    }
  
    public Stick( int x, int y, int twidth, float life){
       this.x = x;
      this.y = y;
      this.twidth = twidth;
      this.theight = twidth;
       this.stickArrayLenght = 0;
      this.life = life;  
      this.yVelocity = (float) 0.05;
      this.xVelocity = 0;
      parentStick = true;
      vampireLife = 100;
    }  
    
    public void display(){
      if(life > 0){
        noStroke();
        float grey = (parentStick?150:75)-life;
        
        fill(((grey <0)?0:grey),life);
        float wid = twidth *(life/255);
        ellipse(x, y, wid, wid);
        computeNewData();
      }
       for (int i = 0; i <stickArrayLenght; i++) {
         sticks[i].display();
      }  
    }
    
    private void computeNewData() {
    x += xVelocity;
    y -= yVelocity ;
    life -=(float)0.15;
    yVelocity += ( random(-(200/((parentStick)?2:1)),200) /50000);
    float xrand = (parentStick)?200:350;
    xVelocity += ((xVelocity >1)||(xVelocity <-1))? 0 :( random(-xrand,xrand) /10000);
    if(random(parentStick?300:115)> life && random(10000) < (parentStick?255:150)  ) addstick();
  }

  private void addstick() {
    float ratiolife = (float) ((parentStick)?0.50:0.80);
    float ratiotttwidth = (float) ((parentStick)?0.75:0.9);
    sticks[stickArrayLenght] = new Stick(x, y, twidth*(float)ratiotttwidth, life*(float)ratiolife, xVelocity+(random(-1,1)*(float)0.3), yVelocity+(random(-1,1)*(float)0.1));
   stickArrayLenght++;
    vampireLife -= 1.2;
    float vamprisedLife = (float) life*(vampireLife/100);
    life =(parentStick)? vamprisedLife :life *(float)0.97;
  }
    
    
    
    
    
   }


