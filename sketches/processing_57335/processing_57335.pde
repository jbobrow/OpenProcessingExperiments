
void setup(){
  size(300,300);
  smooth();
}

void draw (){
  background(0);
  strokeWeight(2);
  for (int y=10; y<280; y+=10){
    for(int x=10; x<280; x+=10){
    float mx = mouseX/90; //
    float offsetA = random(-mx,mx);
    float offsetB = random(-mx,mx);
    fill(random(200), random(200), random(200));
    rect(x+offsetA,y-offsetB,20,20);
    fill(255, 107, 245);
    rect(x+offsetB,y-offsetA,15,15);
    rect(x+offsetA,y-offsetA,10,10);
    rect(x+offsetA,y-offsetA,10,10);
  }
  }
}

