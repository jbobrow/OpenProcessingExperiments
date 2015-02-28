
void setup(){
 size(400, 400); 
}

void draw(){
  background(211, 181, 60);
  translate(width/2, -170);
  rotate(PI/4.0);
 //rotate(radians(angle)); 
 noStroke();
 for(int y = 0; y <= 500; y = y + 60){
    for(int x = 0; x <= 500; x = x + 60){
      fill(85, 66, 12, 100);
 rect(x, y, 40, 40); 
    }
 }
 
  for(int y = 0; y <= 600; y = y + 40){
    for(int x = 0; x <= 600; x = x + 40){
      fill(52, 39, 4);
     ellipse(x, y, 10, 10);
    }
 }
}
