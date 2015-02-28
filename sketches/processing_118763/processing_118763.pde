
Circles Sonic;
LCircles Tails;
RCircles CharmyBee;


void setup(){
  colorMode(HSB);
  //background(0);
  
  size(500,500);
  Sonic = new Circles(255);
  Sonic.xpos=width/2;
  Sonic.ypos=height/2;
  Tails = new LCircles(255);
  Tails.xpos=width/2;
  Tails.ypos=height/2;
  CharmyBee = new RCircles(255);
  CharmyBee.xpos = width/2;
  CharmyBee.ypos=height/2;
  
}

void draw(){
  background(0);
 Sonic.update();
Sonic.display();
Tails.update();
Tails.display();
CharmyBee.update();
CharmyBee.display();
}
class Circles {
  float values;
  float x;
  float y;
  float x_values;
  float y_values;
  int beauty;
  float velocity;
  int xpos;
  int ypos;


  Circles(float values) {
    values=0;
    x=0;
    velocity=0;
    y=0;
    x_values=0;
    beauty=0;
    y_values=0;
    xpos=0;
    ypos=0;
    
  }

  void update() {
    
    velocity+=.2;
    if(beauty>=255){beauty=0;}
    beauty=beauty+10;
    x=x+.1;
    y=y+.1;
    x_values=cos(x)*100;
    y_values=sin(y)*100;
    
  }

  void display() {
    fill(beauty,255,255,100);
    //stroke(random(beauty),255,255,100);
    ellipse(xpos,ypos,x_values,x_values);
    ellipse(xpos+50,ypos,x_values,x_values);
    ellipse(xpos+100,ypos,x_values,x_values);
    ellipse(xpos-50,ypos,x_values,x_values);
   ellipse(xpos-100,ypos,x_values,x_values);
    }
  }

class LCircles{
  float x;
  float y;
  float x_value;
  float y_value;
  int beauty;
  float xpos;
  float ypos;
  float circlingX;
  float circlingY;

  
  
  
  LCircles(float lewis ){
    circlingX=0;
    circlingY=0;
    lewis=0;
    x=0;
    y=0;
    x_value=0;
    y_value=0;
    beauty=0;
    xpos=0;
    ypos=0;
  }
  void update(){
    x=x+.1;
    y=y+.1;
    circlingX=cos(x)*100;
    circlingY=sin(y)*100;
    x_value=cos(x)*70;
    y_value=sin(y)*70;
    beauty=beauty+10;
    if(beauty>=255){beauty=0;}
  
  }
  
  
  void display(){
    fill(beauty,255,255,255);
    ellipse( xpos+circlingX,ypos+circlingY,x_value,x_value);
    ellipse( xpos+50+circlingX,ypos+circlingY,x_value,x_value);
    ellipse( xpos+100+circlingX,ypos+circlingY,x_value,x_value);
    ellipse( xpos-50+circlingX,ypos+circlingY,x_value,x_value);
    ellipse( xpos-100+circlingX,ypos+circlingY,x_value,x_value);
    
    
    
    
    
  }
}
class RCircles{
  float x;
  float y;
  float ypos;
  float xpos;
  float x_valu;
  float y_valu;
  float beauty;
  float circlingX;
  float circlingY;
 
 
  RCircles(float num){
    circlingX=0;
    circlingY=0;
    num=0;
    x=0;
    y=0;
    ypos=0;
    xpos=0;
    x_valu=0;
    y_valu=0;
  }
  void update(){
    x=x+.1;
    y=y+.1;
    circlingX=cos(x)*200;
    circlingY=sin(y)*200;
    x_valu=cos(x)*50;
    y_valu=sin(y)*50;
    beauty=beauty+10;
    if(beauty>=255){beauty=0;}
  
  }
  
  
  void display(){
    fill(beauty,255,255,255);
    
    ellipse(xpos+circlingY,ypos+circlingX,x_valu,x_valu);
     ellipse(xpos+50+circlingY,ypos+circlingX,x_valu,x_valu);
      ellipse(xpos+100+circlingY,ypos+circlingX,x_valu,x_valu);
       ellipse(xpos-50+circlingY,ypos+circlingX,x_valu,x_valu);
        ellipse(xpos-100+circlingY,ypos+circlingX,x_valu,x_valu);
    
  }
  
  
  
  
  
  
}
