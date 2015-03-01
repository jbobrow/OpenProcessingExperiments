
PFont matypo;

void setup(){
  matypo=createFont("Courier", 12, false);
  textFont(matypo, 48);frameRate(50);
  size(500,500);
  textAlign(CENTER); stroke(255,30); 
}

void draw(){
  background(0);
  fill(random(200,255),200);
  text("the end", 250+random(-2,2), 250+random(-2,2));
  for(int a=0;a<100;a++){
    point (random(width), random(height));
  }
    float w=random(width);
    line(w,0,w,height);
}
