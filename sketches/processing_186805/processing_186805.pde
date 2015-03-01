
void setup(){
size(600,600);
}
 
void draw(){
  background(66,66,66);
 
 
 
if ( mouseX < width/3) {
fill(224,22,43);
rect(0,0,200,600);
}else if( mouseX < width/3*2){
fill(255,255,255);
rect(200,0,200,600);
}else if( mouseX < width){
fill(0,82,165);
rect(400,0,200,600);
 
 
}
}

