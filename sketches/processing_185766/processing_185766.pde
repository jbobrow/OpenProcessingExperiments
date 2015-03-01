
One theOne;
Two theTwo;
Three theThree;
Four theFour;

void setup(){
  size(500,500);
 background(100);
  smooth();
  theOne = new One();
  theTwo = new Two();
  theThree = new Three();
  theFour = new Four();
}

void draw(){
 
theOne.display();
theTwo.display();
theThree.display();
theFour.display();
if (keyPressed){
  if(key == CODED){
    if(keyCode == ENTER){
      background(100);
    }
  }
}

}
class Four{

float r=50;
float theta4=0;
float x;         
float y;






void display(){
 x=r*cos(theta4);
 y=r*sin(theta4);
  
  noStroke();
  fill(0,0,255);
  ellipse(x+width/2,y+height/2,20,20);

 
  theta4+=0.022;
  
  
  if (keyPressed){
    if(key == CODED){
      if(keyCode == UP){
    theta4 += 0.3;
    r += .7;
}
}
  }
   
  if (keyPressed){
    if(key == CODED){
      if(keyCode == DOWN){
    theta4 -= 0.3;
    r -= .7;
      }}}
}
}
class One{

float r=50;
float theta1=0;
float x;
float y;







void display(){
 x=r*cos(theta1);
 y=r*sin(theta1);

  
  noStroke();
  fill(255,0,0);
  ellipse(x+width/2,y+height/2,20,20);

 
  theta1+=0.022;
  
  
  if (keyPressed){
    if(key == CODED){
      if(keyCode == UP){
    theta1 += 0.3;
    r += .7;
}
}
  }
   
  if (keyPressed){
    if(key == CODED){
      if(keyCode == DOWN){
    theta1 -= 0.3;
    r -= .7;
      }}}
    
}
}
class Three{
  
 float r=50;
 float theta3=0;
 float x;
 float y;
  
  
  
  
  
  
  
  void display(){
    x=r*cos(theta3);
    y=r*sin(theta3);
  
    fill(0,255,0);
  ellipse(x+width/2,y+height/2,20,20);
  theta3+=.022;
    if (keyPressed){
    if(key == CODED){
      if(keyCode == UP){
    theta3 += 0.4;
    r += .7;
}
  }
    }
   if (keyPressed){
    if(key == CODED){
      if(keyCode == DOWN){
    theta3 -= 0.3;
    r -= .7;
      }}}
    }}
class Two{
  
 float r=50;
 float theta2=0;
 float x;
 float y;
  
  
  
  
  
  
  
  void display(){
    x=r*cos(theta2);
    y=r*sin(theta2);
  
    fill(255,0,0);
  ellipse(x+width/2,y+height/2,20,20);
  theta2+=.022;
    if (keyPressed){
    if(key == CODED){
      if(keyCode == UP){
    theta2 += 0.1;
    r += .7;
}
    }
  }
   if (keyPressed){
    if(key == CODED){
      if(keyCode == DOWN){
    theta2 -= 0.3;
    r -= .7;
      }}}
}



}





