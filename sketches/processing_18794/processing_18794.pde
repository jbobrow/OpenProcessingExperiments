
void setup(){
  size(250,250);
  fill(33,20,9,60);
  smooth();
  stroke(220,102);
  strokeWeight(5);
}
  
  void draw(){
    float weight= dist(mouseX,mouseY,pmouseX,pmouseY);
    strokeWeight(weight/10);
   
   
  background(0,100);
for(int x=0;x<=130;x+=40){
   for(int i = 1/2; i <250; i += 4.5) {
     stroke(mouseX,random(10,110),mouseY);
     ellipse(mouseX,mouseY-mouseX,random(weight,pmouseX),random(weight,mouseY));
  //bezier(mouseX,weight, 100,pmouseY,pmouseX,random(mouseX,mouseY),i-x+10, mouseY);
}
}
}

  



