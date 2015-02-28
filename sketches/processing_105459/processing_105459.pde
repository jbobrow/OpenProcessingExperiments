
/*wait for 10seconds, you will see the form change to a broken TV screen.
*/


float x;
float y;
void setup(){
  size(500,500);
  background(255);
}

void draw(){
  if(mousePressed){
  }
  else{
    background(255);
    stroke(0);
    strokeWeight(1);
    for(int i=0;i<13;i++){
      for(int j=0;j<500;j=j+2){
        drawline(j);
      }
      x=50*i;
    }
    y=y+10;
    x=50;
  }
}

void drawline(float arg){
   line(x,y-50*(arg-1),x+10*arg,y-50*arg);
}


