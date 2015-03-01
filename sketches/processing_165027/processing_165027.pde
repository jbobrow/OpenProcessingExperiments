
float step=1.4;
 
void setup(){
   
  size(600,800);
  strokeWeight(1);
  background(255);
}
 
void draw(){
    background(255);
    
    if(mouseY>width/2){
        if(step>1.7) step=1.5;
        else step+=0.01;
    }
    else{
        if(step<1.3) step=1.5;
        else step-=0.01;
    }

    for(float y=1;y<height;y *= step){
    line(0, y, width, y);
  }
}

