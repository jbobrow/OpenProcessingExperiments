
int h=0;
float t=1;
float r=100;
float g=150;
float b=200;
float diam=20;


void setup(){
  rectMode(CENTER);
  ellipseMode(CENTER);
  size(500,500);
  background(255);
 
  frameRate(10);
}
  
  void draw(){
    smooth();
    r=random(25,50);
    g=random(5,150);
    b=random(90,250);
    diam=random(20,50);
    fill(g,b,r,r);
    noStroke();
    ellipse(width/2,h,diam,diam);
    h=h+1;
      
      
       fill(b,r,g,g);
    noStroke();
    ellipse(300,h*3,diam-15,diam-15);
    h=h+1;
      
        fill(b,b,g,g);
    noStroke();
    ellipse(180,h*7,diam-15,diam-15);
    h=h+1;
      
      fill(r,g,b,r);
    noStroke();
    ellipse(55,t,diam,diam);
    t=t+2;
    
     fill(r,b,g,r);
    noStroke();
    ellipse(130,t*2,diam-20,diam-20);
    t=t+2;
    
    fill(r,b,b,r);
    noStroke();
    ellipse(400,t*3,diam-20,diam-20);
    t=t+2;
   
   if(mousePressed){
     
        fill(g,b,r,r);
    noStroke();
    ellipse(width/2,h,diam,diam);
    h=h-3;
      
      
       fill(b,r,g,g);
    noStroke();
    ellipse(300,h*3,diam-15,diam-15);
    h=h-3;
      
        fill(b,b,g,g);
    noStroke();
    ellipse(180,h*7,diam-15,diam-15);
    h=h-6;
      
      fill(r,g,b,r);
    noStroke();
    ellipse(55,t,diam,diam);
    t=t-4;
    
     fill(r,b,g,r);
    noStroke();
    ellipse(130,t*2,diam-20,diam-20);
    t=t-7;
    
    fill(r,b,b,r);
    noStroke();
    ellipse(400,t*3,diam-20,diam-20);
    t=t-8;
    
     
   
  }
  }
    
    
    
    
    

  
  


