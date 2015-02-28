
/* A simple random walker
* Made by: @ramayac
* Press 's' to get a "smokey effect" :)
* Press 'b' in smokey mode to kind of clear the smoke.sr
*/

class Walker{
  int x,y;
  color c;
  int ll = 4;
  
  Walker(color _c){
    x = width/2; 
    y = height/2;
    c = _c;
  }
  
  void step(){
    int d = int(random(4));
    
    switch(d){
      case 0: //up
        y-=ll;
        break;
      case 1: //down
        y+=ll;
        break;
      case 2: //left
        x-=ll;
        break;
      default:
        x+=ll;
        break;
    }
    
    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
    
  }
  
  void draw(){
    stroke(c, 220);
    strokeWeight(ll);
    point(x,y);
  }
}

Walker w1, w2, w3, w4;
boolean smokey = false;
void setup(){
  size(600,400);
  background(0);
  smooth();
  
  w1 = new Walker(#7C08FA);
  w2 = new Walker(#08FA5A);
  w3 = new Walker(#FAF208);
  w4 = new Walker(#F908FA);
}

PImage img;
void draw(){
  
  if(smokey){
    img = get();
    image(img, -4,-4, width+8, height+8);
  }
  
  w1.step(); w2.step(); w3.step(); w4.step();
  w1.draw(); w2.draw(); w3.draw(); w4.draw();
}

void keyPressed(){
  if(key == 'b' && smokey){ //draw a black dot
    stroke(20);
    point(width/2, height/2);
  } else if(key == 's'){
    smokey = !smokey ;
  }
}
