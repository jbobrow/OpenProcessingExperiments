
class Homosapien{
  //properities
  char gender; // 'F' or 'M'
  float age;
  String name ;
  float h; // height
  float w; // weight
  float px,py;
  PVector bbox, loc, vel,locp, velp, locq,velq; // bounding box, location and velocity. 
  //constructure
  Homosapien(String n, float a , char g, float hh, float ww){
    name = n;
    age=a;
    gender=g;
    h=hh;
    w=ww;
    this.bbox = new PVector(this.w/2, this.w/2);  // width and height of the bounding box. 
    this.loc = new PVector(0, 0); 
    this.vel = new PVector(0, 0);    
    this.locp = new PVector(0, 0); 
    this.velp = new PVector(0, 0);
  }
  //methods
  // 
  void setLocation(float lx, float ly,float mx, float my) { 
    this.loc.set(lx, ly, 0); 
    this.locp.set(mx,my,0);

  } 
  void setVelocity(float vx, float vy,float vx2, float vy2) { 
    this.vel.set(vx, vy, 0); 
    this.velp.set(vx2,0,0);
  } 

  void display(){ 
    p = loadImage("p7.png");
    noStroke();
    this.px = 60;
    this.py = 96;     
    image (p,230,50,px,py);
    p = loadImage("p6.png");
    noStroke();
    this.px = 60;
    this.py = 96;     
    image (p,30,250,px,py);
    p = loadImage("p7.png");
    noStroke();
    this.px = 60;
    this.py = 96;     
    image (p,170,160,px,py);
    p = loadImage("p6.png");
    noStroke();
    this.px = 60;
    this.py = 96;     
    image (p,310,250,px,py);
    p = loadImage("p8.png");
    noStroke();
    this.px = 38;
    this.py = 34;     
    image (p,90,120,px,py);
    p = loadImage("p8.png");
    noStroke();
    this.px = 48;
    this.py = 42;     
    image (p,350,160,px,py);
    p = loadImage("p8.png");
    noStroke();
    this.px = 48;
    this.py = 42;     
    image (p,10,50,px,py);
    p = loadImage("p11.png");
    noStroke();
    this.px = 128;
    this.py = 156;     
    image (p,this.loc.x,this.loc.y,px,py);
    p = loadImage("p5.png");
    noStroke();
    this.px = 129;
    this.py = 211;     
    image (p,this.locp.x,this.locp.y,px,py);   
  }

  void move() { 
    this.loc.add(this.vel); 
    this.locp.add(this.velp);
    this.vel.x=this.vel.x + mouseX/300;        
    if (this.vel.x > 35){
      this.vel.x =  random(-3,3); 
    }
    if (this.loc.x + 8 < 0  || this.loc.x > width-110) { 
      this.vel.x = -this.vel.x; 
    } 
    if (this.loc.y + 7 < 0 || this.loc.y > height-135 ){ 
      this.vel.y = -this.vel.y; 
    } 
    if (this.locp.x < 0 || this.locp.x > width - 110) { 
      this.velp.x = -this.velp.x; 
    } 
    if (this.locp.y < 0 || this.locp.y > height-76) { 
      this.velp.y = -this.velp.y;      
    }   
    if (this.loc.x < this.locp.x && (this.locp.x - this.loc.x)< 80 && this.loc.y < this.locp.y &&  (this.locp.y - this.loc.y)< 80){
      greet();
      greet2();     
    }
    if (this.loc.x > this.locp.x && (this.loc.x - this.locp.x)< 80 && this.loc.y > this.locp.y &&  (this.loc.y - this.locp.y)< 80){
      greet();
      greet2();    
    }
  }

  void greet() { 
    String msg = "Hi!"; 
    float tw = textWidth(msg); // calculate text width 
    fill(255); 
    stroke(50); 
    rect(this.loc.x, this.loc.y-20, tw + 4, 16); // draw bubble 
    fill(50); 
    noStroke(); 
    textAlign(LEFT); 
    text("Hi!", this.loc.x+2, this.loc.y-16, tw, 14); // draw name 
  }

  void greet2() { 
    String msg = "See you later!"; 
    float tw = textWidth(msg); // calculate text width 
    fill(255); 
    stroke(50); 
    rect(this.locp.x, this.locp.y-20, tw + 4, 16); // draw bubble 
    fill(50); 
    noStroke(); 
    textAlign(LEFT); 
    text("See you later!", this.locp.x+2, this.locp.y-16, tw, 24); // draw name 
  }
}// end of class



