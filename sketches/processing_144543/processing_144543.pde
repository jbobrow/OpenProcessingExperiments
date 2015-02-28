
float rect_length = 0;

void setup(){
  size(400,400);
}


void draw(){
  rect(0,10,rect_length,20);
  rect_length = rect_length+1.5;
  if (rect_length > 100){
    rect_length = 100;
  }
  
}


