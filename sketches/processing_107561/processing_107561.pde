
float vel=5;
void setup(){
size(600,600);
 background(156,237,231);
}
void draw(){
  
  //background(156,237,231);
  vel=dist(mouseX,mouseY,pmouseX,pmouseY);
  println(vel);
ellipse(200,200,200,200);  
    stroke(33,203,191);
fill(56,56,56,20);
if(mousePressed){
  
  fill(180,27,86);
  float rx=random(10+vel);
  float ry=random(10+vel);
  ellipse(200+rx,200,5,5);
  ellipse(200+ry,200,5,5);
  fill(89,56,20);
  float rxa=random(9+vel);
  float orbitaX= 50*sin(mouseX*0.08);
  float orbitaY= 50*cos(mouseX*0.08);
   ellipse(mouseX+orbitaX,mouseY+orbitaY,15,15);
  float rya=random(9+vel);
  fill(180,27,86);
  ellipse(mouseX+rxa,mouseY+rya,15,15);
  ellipse(200+rya,200,5,5);

  fill(180,27,86);
  ellipse(mouseX,mouseY,80,80); 
  fill(68,96,250,20);
  ellipse(mouseX,mouseY,50,50);
  fill(147,27,180,5);
ellipse(mouseX,mouseY,30,30);

 
}
}
