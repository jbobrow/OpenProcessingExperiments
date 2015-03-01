
int y =35;

void setup(){
  size(600,600);
  background(59,249,233,80);
}

void draw(){
  if (mousePressed ==true){
    if(mouseButton==RIGHT){
      fill(0);
    }else if (mouseButton ==LEFT ){
      fill(255);
    }
  }else{
     fill(10);
    }
    rect(100,100,100,100,90);
    
    }


