
void setup(){
  size (400,400);
  background(0);
}

void draw(){
  
if(mouseY < 200){
background(0,0,256);
} else { //otherwise, yes or no
background(256,0,0);
}

}
