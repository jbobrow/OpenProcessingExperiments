
MisterSun sunset = new MisterSun();
Car drives = new Car();

float yPos;
float r;
float g;
float b;

float mr;
float mg;
float mb;
float m= minute();

float xPos;
float xSpeed;


void setup(){
  size(600,600);
  smooth();
  
  
  
  xSpeed = 15;
  xPos = -55;
  ellipseMode(BOTTOM);
  
  sunset.prime();
  
  //println(m);
  

  
}


void draw(){
  //background(second(),height-yPos+90,yPos);
  //background(154,214,255);  DESIRED COLOR TIL 0,0,0
  background(r,g,b);
  
  //r =map(154,154,0,0,400);
  r=map(yPos,0,height,154,0);
  //g =map(214,214,0,0,400);
  g=map(yPos,0,height,214,0);
  //b =map(255,255,0,0,400);
  b=map(yPos,0,height,255,0);
  
  yPos=map(second(),0,59,0,600);
  //ellipse(width/2,yPos,50,50);
  
  
  sunset.animate(250,yPos);
  
  
  
  
  
  
    
  fill(50,g,50);
    
  rect(0,400,600,200);
  fill(80,80,80);
  rect(0,470,600,50);
    
    
  mr=map(yPos,420,height,0,250);
  
    
  
  fill(255,255,255,mr);
  rect(60,80,40,40);
  rect(70,70,40,10);
  rect(70,120,40,10);
  rect(80,60,40,10);
  rect(80,130,40,10);
  rect(90,50,40,10);
  rect(90,140,40,10);
  rect(110,40,30,10);
  rect(110,150,30,10);
  
  drives.display(xPos,475);
  
  if(m+100<=yPos && m+100>yPos-10){
    xPos += xSpeed;
    
  }else if(m+100>yPos){
  
  xPos = -55;
}
  
    
  
}



class MisterSun { 
  
  float x;
  float y;
  
  
 
  void prime(){
    
    
   
    
    
    
    
  }
  
  void animate(float _x, float _y){
     x = _x;
     y = _y;
     
     smooth();
    noStroke();
   fill(252,180,36);
    rect(x-20,y-80,50,50);
    rect(x-20,y+30,50,50);
    rect(x+90,y-80,50,50);
    rect(x+90,y+30,50,50);
    //top
    rect(x+30,y-90,60,20);
    rect(x+40,y-100,40,30);
    rect(x+50,y-110,20,20);
    //bottom
    rect(x+30,y+60,60,30);
    rect(x+40,y+70,40,30);
    rect(x+50,y+80,20,30);
    //left
    rect(x-30,y-30,10,60);
    rect(x-40,y-20,10,40);
    rect(x-50,y-10,10,20);
     //right
    rect(x+140,y-30,10,60);
    rect(x+150,y-20,10,40);
    rect(x+160,y-10,10,20);
    
    
    //yellow
    fill(252,237,36);
    rect(x,y-60,120,120);
    //rect(100,40,80,80);
    rect(x-10,y-50,140,100);
    rect(x+10,y-70,100,140);
    rect(x-20,y-40,160,80);
    rect(x+20,y-80,80,160);
    
    fill(0);
    //eyes
    rect(x+20,y-20,10,10);
    rect(x+90,y-20,10,10);
    //mouth
    rect(x+100,y+10,10,10);
    rect(x+10,y+10,10,10);
    rect(x+90,y+20,10,10);
    rect(x+20,y+20,10,10);
    rect(x+30,y+30,60,10);
    
    
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
}





class Car { 
  
  float c;
  float d;
  
  void engage(){
    
    
  }
  
  void display(float _c, float _d){
    c = _c;
    d = _d;
    
    fill(255,0,0);
    rect(c,d,30,30);
    rect(c-10,d+10,60,20);
    fill(154,214,255);
    rect(c+18,d+2,10,8);
    fill(0);
    rect(c,d+25,10,10);
    rect(c+30,d+25,10,10);
    fill(229,248,90);
    rect(c+48,d+10,3,6);
    
    
  }
  
  
  
}
