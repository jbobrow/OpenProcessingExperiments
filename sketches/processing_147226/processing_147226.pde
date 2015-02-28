
float x;
float y;
float easing=0.009;
float r=0;
float g=0;
float b=0;
void setup(){
  size(1000,600);
  smooth();
  }
void draw(){
      stroke(r,g,b);
   if( mouseX>width/2){
    r++;
  }else{
    r-=1;
  }
  if( mouseY>height/3){
    g++;
  }else{
    g-=1;
  }
  if(mousePressed){
    b++;
  }else{
    b-=1;
  }
  r=constrain(r,0,255);
  g=constrain(g,0,255);
  b=constrain(b,0,255);
  
    float targetX=mouseX;
    float targetY=mouseY;
   y+=(targetY-y)*easing;
     x+=(targetX-x)*easing;
     
              
strokeWeight(6);    
line (x/0.5,y/0.5,x+b*2,y+b*1.5);

}
void keyPressed (){
  
  r = int(random(256));
  g = int(random(256));
  b = int(random(256)); 
  
  background(r,g,b);

}

