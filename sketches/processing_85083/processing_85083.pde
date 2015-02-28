
//Pierre MARZIN
ArrayList  P;
float step;

void setup(){
  size(800,800,P3D);
  smooth();
  background(255);
  strokeWeight(1);
  stroke(0);
  frameRate(200);
  P=new ArrayList();
  step=.1;
}

void draw(){
  if(mousePressed){
    P.add(new PVector(mouseX,mouseY,0));
    strokeWeight(1);
    stroke(0);
    point(mouseX,mouseY);
  }
}
 void mouseReleased(){
   
   strokeWeight(.5);
   color c0= color(random(255),random(255),random(255),60);
   color c1= color(random(255),random(255),random(255),150);
   stroke(c0,30);
   translate(mouseX,mouseY);
    for(int i=0;i<P.size()-1;i++){
      PVector v=(PVector)P.get(i);
      PVector w=(PVector)P.get(i+1);
      for(float a=0;a<2*PI;a+=step){
       fill(lerpColor(c0,c1,abs(cos(a))));
       beginShape();
       vertex((v.x-mouseX)*cos(a),v.y-mouseY,-(v.x-mouseX)*sin(a));
       vertex((w.x-mouseX)*cos(a),w.y-mouseY,-(w.x-mouseX)*sin(a));
       vertex((w.x-mouseX)*cos(a+step),w.y-mouseY,-(w.x-mouseX)*sin(a+step));
       vertex((v.x-mouseX)*cos(a+step),v.y-mouseY,-(v.x-mouseX)*sin(a+step));
       endShape();
       }
    }
   P=new ArrayList();
 }
 void keyPressed(){
   if(keyCode==32)background(255);
 }

