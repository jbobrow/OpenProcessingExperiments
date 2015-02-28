
float y=150;
float x=150;
float r=15;
void setup(){
    size(300,300);
  smooth();
}

void draw(){
  background(#acd373);
  if(keyPressed){
    if (key =='w'){
      y=y-5;
    
  }else if(key =='s'){
    y=y+5;
      }   else if(key =='a'){
    x=x-5;
      } else if (key=='d'){
     x=x+5;   
      }}
      if(x<r){x=x+width;
    }else if(x>width-r){
      x=x-width;}
        if(y<r){y=y+height;
    }else if(y>height-r){
      y=y-height;}

  fill(140);
  noStroke();
  ellipse(x,y,2*r,2*r);
}
