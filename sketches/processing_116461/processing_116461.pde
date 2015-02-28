
void setup() {
 
  size (400,400);
    rectMode(CENTER);
   ellipseMode(CENTER);
}
 int bodyX= 200;
   int bodyY= 200;
   int bodywidth=80;
   int bodyHeight=100;// BODY MEASUREMENTS
   int legOneX=170;
   int legOneY=265;
   int legOneWidth=20;
   int legOneHeight=40;// Left leg
   int legTwoX=230;
   int legTwoY=265;
    int legTwoWidth=20;
   int legTwoHeight=40;
   int tipY= 30;
   int tipX=70;
   
 void draw() { 
   
    background(0, 49.8, 100);
    
   // face();
   portal();
   spaceship();
    ground();
    body();
    bodyAndLegs();
    mouth ();
    arms();
    
     line(240,170,270,170);
    line(130,170,160,170); //arms
  ellipse (173, 140, 8, 8);
  ellipse (225, 140, 8, 8);
 }
  
  void arms () {
    noStroke();
     fill(100,75,50);
    quad(120,200,160,195,160,220,110,230);
    quad(240,195,280,200,295,225,240,220);
 }
  void spaceship() {
   //warp portal
 
  // ellipse(200,25,10, 10);
   fill(192,192,192);
   
   triangle(100,tipX,200,tipY,300,tipX);
     tipY=tipY+3;
    if (tipY >width)
   { 
     tipY=-1;
   }
    tipX=tipX+3;
    if (tipX >width)
   { 
     tipX=-1;
   
 
 }
 
   // spaceship
   fill(0,0,255);
    line(100,70,100,100);
    fill(0,255.0);
     line(300,70,300,100);
    fill (0,0,255);
   line(200,70,200,95);   // beaming the alien down
    }
    void body () {
   fill(100,75,50);
   rect(bodyX,bodyY,bodywidth,bodyHeight);
   // body
   noStroke();
    }
    void bodyAndLegs () {
  fill(100,75,50);
  // rect(legOneX,legOneY,legOneWidth,legOneHeight);
  // rect(legTwoX,legTwoY,legTwoWidth,legTwoHeight);
  
   quad(legOneX-10,legOneY-20,190,legOneY-20,175,295,150,295);
    quad(legTwoX-10,legTwoY-20,legTwoX+10,legTwoY-20,legTwoX+30,295,legTwoX,295);
   //float randface1=random(100);
   //float randface2=random(100);
   
   
   stroke(0);
   fill(0,150,150);
   ellipse(200,150,100,100);// face
   
   fill(0,250,0); 
    rect(180,140,25,10);
    rect(220,140,25,10);
    line(170,130,190,130);
    line(210,130,230,130);
   // point( 195,95);  //eyes and eyelashes
   }
   void portal() {
      float r;
   float g;       
   float b;
   
    r=random(255);
    g=random(255);
    b=random(255);
    fill (r,g,b);
    ellipse (200,200,300,300);
    noStroke();
  }
   void mouth () {
    float a;
     a=random (200);
    line(a,180,200,180);//mouth
   }
   void ground () {
     fill(0,250,0);
    rect (200,400,400,200); 
   }
   
 


