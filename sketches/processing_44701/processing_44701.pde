
void setup(){
  size(500,500);
  background(40,40,40);
  frameRate(200);
}

void draw(){
  noStroke();
  fill(255,255,255,50);
  if(mousePressed == true) {
    ellipse (mouseX,mouseY,random(100),random(100));
    stroke(255);
    line (200, 200,pmouseX,pmouseY);
  }
  if(keyPressed){
    if(key == '1'){
  fill(random(4),21);
  noStroke();
  ellipse(random(width),random(height),map(mouseX,0,width,0,50),map(mouseX,0,width,0,50));
  }}
  fill(155,155,155);
  if(keyPressed){
    if (key == '2'){
      stroke(5);
      line(pmouseX,pmouseY,mouseX+random(-70,70),mouseY+random(-70,70));
      fill(160,155,155,50);
     rect(pmouseX,pmouseY,random(10),random(10)); 
    }}
    fill(50,25,100,10);
    stroke(100);
    if(keyPressed) {
      if (key == '3'){
    line (pmouseX,pmouseY,mouseX+random(-500,500),mouseY+random(-500,500));
  }}
  if(keyPressed){
    if (key == '4'){
      stroke(255);
      line(pmouseX,pmouseY,mouseX+random(-50,50),mouseY+random(-50,50));
      fill(160,155,155,50);
     rect(pmouseX,pmouseY,random(10),random(10)); 
    }}
}

