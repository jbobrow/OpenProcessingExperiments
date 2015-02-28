
void setup(){
size(900,900);
smooth();
background(255);
noFill();
noStroke();
}


void draw(){
for(int x=-600; x<800; x +=10){
for(int y=-600; y<800; y +=10){
  ellipseMode(CORNER);  
  ellipse(500,500,random(x,y),random(x,y));
  stroke(10,10,random(100,255),5);
frameRate(50);
rotate(90);

}
}
//save("a486078_최우석_####.jpg");
}


