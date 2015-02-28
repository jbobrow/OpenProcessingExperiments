
int sizeX;
int sizeY;
int count;
 
void setup(){
  size(800,800);
  background(0);
  smooth();
  count = 1;
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text("KEEP YOUR CIRCLES FROM",width/2,height/2-25);
  text("GETTING DROWNED OUT!!!",width/2,height/2+25);
}
 
void draw(){
  noStroke();
  sizeX = int(random(255));
  sizeY = int(random(255));
  fill(int(random(255)),int(random(255)),int(random(255)),int(random(255))-(count/4));
  ellipse(mouseX,mouseY,sizeX,sizeY);
  count += 1;
  if (count >= 250){
    stroke(255);
    strokeWeight(5);
    line(random(width),random(height),random(width),random(height));
  }
  if (count >= 500){
    line(random(width),random(height),random(width),random(height));}
   
}
