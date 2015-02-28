
void setup(){
  size(1000,1000);
  background(200);
}

void draw(){
 stroke(134, 66, 1);
 strokeWeight(50);
  line(500, 1000, 500, 750); 
}

void keyPressed(){
  if (key == '1'){
    stroke(134, 86, 1);
    strokeWeight(40);
    line(500, 750, 750, 500);
    line(500, 750, 250, 500);
}
 if (key == '2'){
    stroke(134, 106, 1);
    strokeWeight(30);
    line(750, 500, 850, 500);
    line(750, 500, 750, 400);
    line(750, 500, 850, 350);
    line(250, 500, 150, 400);
    line(250, 500, 150, 300);
    line(250, 500, 100, 400);
}
}
