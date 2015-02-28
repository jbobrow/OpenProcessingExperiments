
import fisica.*;

FWorld world;

void setup(){
  size(500,500);
  
  Fisica.init(this);
  
  world = new FWorld();
  world.setEdges(0,0,width,height);
  
  FPoly myPoly = new FPoly();
  String lines[] = loadStrings("dog.txt");
  for(int i = 0; i<lines.length; i++){
    float each[] = float(split(lines[i],','));
    myPoly.vertex(each[0]+200,each[1]);
  }
    //myPoly.setDamping(15);
    myPoly.setRestitution(2);
    myPoly.setFillColor(color(230,0,0));
    world.add(myPoly);
    
  FPoly myPoly2 = new FPoly();
  String lines2[] = loadStrings("dog.txt");
  for(int i = 0; i<lines2.length; i++){
    float each[] = float(split(lines2[i],','));
    myPoly2.vertex(each[0],each[1]);
  }
  myPoly2.setDamping(15);
  myPoly2.setFillColor(color(150));
  world.add(myPoly2);
  
   FPoly myPoly3 = new FPoly();
  String lines3[] = loadStrings("dog.txt");
  for(int i = 0; i<lines3.length; i++){
    float each[] = float(split(lines3[i],','));
    myPoly3.vertex(each[0],each[1]+50);
  }
  myPoly3.setDamping(15);
  myPoly3.setFillColor(color(150));
  world.add(myPoly3);
}

void draw(){
  background(255);
  
  world.step();
  world.draw();
}

