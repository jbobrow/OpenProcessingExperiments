
float r;
float g;
float b;
void setup(){
  size(600,600);
  background(255);
}
void draw(){
  fill(#920AC9);
  rect(0,0,100,50);
  fill(#FA19C2);
  rect(1*width/6,0,100,50);
  fill(#F2273F);
  rect(2*width/6,0,100,50);
   r=random(200);
    g=random(55);
    b=random(150);
    fill(r,g,b);
  rect(3*width/6,0,100,50);
    line(pmouseX,pmouseY,mouseX,mouseY);
  if((mouseX<100) && (mouseY>0 && mouseY<=height)){
    if(mousePressed){
      stroke(#920AC9);}
  }
  else if((mouseX>=1*width/6 && mouseX<=2*width/6) && (mouseY>0 && mouseY<=height)){
    if(mousePressed){
      stroke(#FA19C2);}
  }
      else if((mouseX>=3*width/6 && mouseX<=4*width/6) && (mouseY>0 && mouseY<=height)){
        if(mousePressed){
          stroke(r,g,b);}
  }
  else {
  stroke(#F2273F);}
  
}
