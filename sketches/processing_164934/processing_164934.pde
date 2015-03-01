
float v=10;
float rad;
float alpha=0;
float vx, vy;
float x=0;
float y=600;
boolean fly = true;
boolean goUp = true;
float g=0.5;
float num;
float angle;
boolean shoot = false;

void setup(){
  size(800,600);
  smooth();
  frameRate(10);
  
 
}

void draw(){
  if(key =='f') shoot = true;
  
  background(255);
  textSize(30);
  text("Click Mouse and Press 'f'  (within 5sec)", 250,50);
  fill(0);
  rect(0,500,1200,100);
  translate(0,-100);
  
  if(alpha==0) goUp = true;
  else if(alpha>90) goUp = false;
  if(goUp){
    if(shoot) {
      alpha +=0;
      angle = alpha;
      text("angle : "+angle+"'",250,200);
    }
    else alpha+=4;
  }
  else{
    if(shoot){
      alpha +=0;
      angle = alpha;
      text("angle : "+angle+"'",250,200);
    }
    else alpha-=4;
  }  
  
  
  
  rad = radians(alpha);   
  strokeWeight(25);
  line(0,600,100 *cos(rad),600-100*sin(rad));
  
  
  if(frameCount<50){
  vx = v*cos(rad);
  vy = -v*sin(rad);
  }

  if(shoot){
      if(y==600) fly = true;
      else if(y>600) fly = false;
      if(fly) {        
        vy += g;
        y += vy;
        x += vx; 
        num=x; 
        text("HAHAHAHAHAHAHA", x-100, y-20);
      }      
      else{     
        vy =0; 
        vx=0;
        y += vy;
        x += vx;   
        num = x;
        text("HAHAHAHAHAHAHA", x, 560);
      }
    
    ellipse(x,y, 10,10);
    textSize(30);
    
 
    
    text("score : "+num +"m" , 250,250);     
  }       
   
}
  

 
