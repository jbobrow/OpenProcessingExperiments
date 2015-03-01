
int x;
void setup(){
 size(600,600);
 background(#223a70);
}
 
void draw() {}
 
void mousePressed(){
//if(mouseDragged == True){
  x=mouseX;
 // }
}

 
void mouseReleased(){
  if (x<mouseX){
    int s;
    int a;
    a = int(random(200,255));
    strokeWeight(random(3));
    stroke(#192f60,a);
    a = int(random(75,255));
    fill(#17184b, a);
    s = (mouseX-x)/2;
    rect(mouseX-s/2,mouseY-s/2,s,s);
  }
  if (x>mouseX) {
    int r;
    int a;
    a = int(random(200,255));
    strokeWeight(random(3));
    stroke(#1e50a2,a);
    a = int(random(75,255));
    fill(#19448e,a);
    r = (x-mouseX)/2;
    ellipse(mouseX,mouseY,r,r);
  }
  //if (x==mouseX){
  
}

