
void setup(){
size(500,500);
background(255);
noStroke();
smooth();
}
 
void draw(){
background(255);
fill(255,0,mouseX/2,100);
  rect(0,0,width,mouseY);
  rect(500,500,-1*width,-1*mouseY);
  fill(mouseX/2,255,0,100);
  rect(0,height/3,width,mouseY);
  rect(500,500,-1.3*width,-1.3*mouseY);

  fill(0,mouseX/2,255,100);
  rect(0,height/5,width,mouseY);
  rect(500,500,-1.2*width,-1.2*mouseY);

}
