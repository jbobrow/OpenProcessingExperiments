
import toxi.geom.*;

ArrayList <Line> lineSeq;

float radius = 300;
int pop = 200;

void setup() {
  size(800,800);
  smooth();

 lineSeq = new ArrayList<Line>();

  for(int i = 0; i < 200; i++) {
    
    float r = random(180);
    float rVal1 = radians(r);
    float rVal2 = radians(180+r);
    Vec3D a = new Vec3D(radius*cos(rVal1) + width/2,radius*sin(rVal1)+ height/2,0);
    Vec3D b = new Vec3D(radius*cos(rVal2)+ width/2,radius*sin(rVal2)+ height/2,0);
    
    Line ln = new Line(a, b, i);
     lineSeq.add(ln);
  }
}




void draw() {
  background(0);
  
   for(Line ln : lineSeq){
  ln.run(); 
 }
 
     if(keyPressed) {
    saveFrame("im-####.png");
  }
 
 
 
 //line(400,200,400,600);
 //line(200,400,600,400);
}


