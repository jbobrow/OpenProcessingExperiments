
int i=0;


void setup(){
size(400, 400);
background(100);
smooth();
fill(0);
colorMode(HSB,100);

}

void draw(){
  
  fill(i, i+3,i+3,abs(log(100*i) + 1)); 
  bezier(0, 0, mouseX, mouseY, 400, 400, mouseY, mouseX);
  if(i<254){
    i++;
  }
  else{
    i=20;
  }
  println(i);
  
}

