
void setup(){
size(600, 700);
background(100);
stroke(0);
}

void draw(){
translate(width/2, height/2);
for (int a = 0; a < 250; a++){
  for (int b = 0; b < 250; b++){
    
    float angle = random (-90, 90);
    rotate (radians (angle));
    
    float RS=map (b, 0, 200, 2, 30);
    rect(0, 0, RS, RS);
    
    translate(0, 10);
  }
}
}
