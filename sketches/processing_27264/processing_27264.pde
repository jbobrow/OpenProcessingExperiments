
void setup(){
  size (600,800);
  strokeWeight(3);
  stroke(200);
}
void draw (){
  if (mousePressed == true) {
    fill(0);
  } else {

  background (random(190,200),random(180,200),random(150,190));
  fill(random(1800,170),random(70,100),random(100,40));
  triangle (mouseX,mouseY,random(0,600),random(0,800),random(0,600),random(0,800));
  
 }}
  

