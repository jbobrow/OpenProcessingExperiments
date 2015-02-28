
boolean f=false;
color c;
void setup (){
  size(400,400);
  background(#F319F7);
point(89,56);
}
void draw (){
  if (f==false){
    fill(c);
  triangle(mouseX,mouseY,80,90,300,56);
  }
  else if(f==true){
    fill(c);
    ellipse(mouseX,mouseY,80,120);
  }
  }
  void mouseReleased (){
  if (f==false){
    f=true;
  }
  else if(f==true){
    f=false;
  }
  }
  
  void mouseMoved () {
  c = color(random(255), random (255), random (255));
  }
  
  void keyPressed (){
    if (key=='s'){
      save ("foto.png");
    }
  }
  

