
float r=random(20);
void setup() {   
  size(250, 250);
  background(255);   
}

void draw() {   
  fill(random(255),100,255,50);
  }
 void mouseMoved(){
 strokeWeight(25);
 stroke((random(255)),120,130);
 for(int a=10; a<260;a=a+40){
 line(a,250,a,mouseY+r)
 }
  }

