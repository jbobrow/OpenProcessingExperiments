
color[] beach = {#344459,#485F73,#5DA6A6,#A9D9CB,#F2EAD0};
void setup(){
  size(400,400);
  background(255);
 strokeWeight(5);
 frameRate(100);
//  for(int x = 0;x < width; x++){
//    stroke(beach[int(random(1,5))]);
//    line(x,0,x,400);
  //}
}
void draw(){
  stroke(beach[int(random(1,5))]);
  int x = int(random(0,400));
  line(x,0,x,400);
}


