

float x,y;

void setup(){
    size(500,500);
    background(50);
    x=width/2;
    y=height/2;
    frameRate(10);
}

void draw(){
   
}
void keyPressed(){
 if(key==CODED){
  if(keyCode==UP){
  background(50)
  y-=3;
  
  }
  if(keyCode==DOWN) {
  background(50)
  y+=3;
  }
  if(keyCode==RIGHT) {
  background(50)
  x+=3;
  }
  if(keyCode==LEFT) {
  background(50)
  x-=3;
  }
  
  ellipse(x,y,random(60,80),80);
  fill(random(20),random(75,40),random(x+y),5);
  stroke(255);
  strokeWeight(2);

 }

}
