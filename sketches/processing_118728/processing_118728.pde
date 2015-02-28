
float sw = .1;
void setup(){
  size(1400,600);
  smooth();
  


  frameRate(300);
   background(255);
}

void draw() {
if (mousePressed){
 //sw=sw-.01;
    strokeWeight(sw);
    
   strokeCap(SQUARE); 
  stroke(255);
  
  stroke(random (255), random (255), random (255));
  float mx = random (mouseX) + random (0,800);
  //line(mouseX,400,mx,mouseY);
  //line(400,mouseX,mx,mouseY);
  //line(200,mouseY,mx,mouseY);
  //line(mouseX,400,mx,mouseY);
  line(mouseX,mouseY, mx,width);
  line(mouseX,mouseY,mx, width);
  
  if (key == 's'){
    saveFrame("#####.tif");
}}}
