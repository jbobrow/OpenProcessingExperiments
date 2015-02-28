
void setup(){
  size(500,500);
  background(255);
}
void draw(){

}
void keyPressed(){
  float r=random(10,100);
  println(r);
  fill(random(10,200),random(100,200),random(100,255),40);
rect(mouseX,mouseY,r,r);
line(mouseX,mouseY,mouseX+random(-100,+100),mouseY+random(-200,200));
if(key =='s'){
  float s=random(0,60);
  fill(random(255),random(255),random(255),40);
ellipse(mouseX,mouseY,s,s);
}
if (key== 'e'){
  saveFrame();
}
}
