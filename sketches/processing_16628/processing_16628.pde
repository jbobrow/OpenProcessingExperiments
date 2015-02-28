
void setup(){
  background(255);
  size(800,600);
  smooth();

}

void draw(){

float m = millis();
translate(mouseX,mouseY);
strokeWeight(0.2);
rotate(m%15);

fill(m% 0,172,255,30);
ellipse(0,0,700,600/2);

fill(m% 255,243,0,30);
ellipse(0,0,600,500/2);

fill(m % 250,10,10,30);
ellipse(0,0,500,400/2);

fill(0,21,255,100);
ellipse(0,0,300,200/2);

fill(m% 0,172,255,30);
ellipse(0,0,150,200/2);

fill(m%255,13,13,100);
ellipse(0,0, 100, 50);

fill(100,50,200);
ellipse(0,0, 50,20);
}


