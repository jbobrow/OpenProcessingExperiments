
int total ;
int layer2;

void setup(){
  
  size(500,500);
  background(255);
  smooth();


layer2=5;
total =100;

}
void draw(){
background(0);


 for(int i = 0;i<total; i++){
  noFill();
stroke(random(0,255));
strokeWeight(20);
arc(random(-200,width), random(-200,height),random(50,200),random(50,200), 0, PI/2);

 }

for(int i = 0;i<layer2; i++){
stroke(random(0,255),random(0,255),random(0,255));
strokeWeight(50);

  float diametro = random(200,400);
  line(random(0,height),random(0,width),mouseX,mouseY);
}
}

