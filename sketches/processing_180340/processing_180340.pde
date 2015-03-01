

void setup(){
size(400,250);

strokeWeight(.4);}

void draw(){
  background(255);
  if(mouseX <= width/2){
for(float x = 5; x< width-5; x += 5){

  line(x, 5,x, height-5);
}
if(mouseX <= width/2 && mouseY <=height/2 ){
for(float x = 5; x< width-5; x += 5){
  for(float y = 5; y<height-5; y += 5){
line(x, 5,x, height-5);
 line(5,y, width-5,y);
  }}
}

  }
  else{
  for(float y = 5; y<height-5; y += 5){
      line(5,y, width-5,y);
  }
}
}
