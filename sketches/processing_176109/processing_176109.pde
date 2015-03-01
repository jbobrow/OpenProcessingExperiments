
int num;
void setup(){
  size(400,400);
  background(255);
  num = 0;
}

void draw(){
 for (int e = 0; e < 400; e = e+5) { 
   for (int d = 0; d < 400; d = d+5){
     rect(d,e,5,5);
     fill(random(255));
    }
  }
}
