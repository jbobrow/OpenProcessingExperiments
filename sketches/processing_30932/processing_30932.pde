
import fisica.*;

FWorld world;

void setup(){
  size(500,500);
  
  Fisica.init(this);
  
  world = new FWorld();
  world.setEdges(0,0,width,height);
  
  FPoly myPoly = new FPoly();
  String lines[] = loadStrings("poly.txt");
  for(int i = 0; i<lines.length; i++){
    float each[] = float(split(lines[i],','));
    myPoly.vertex(each[0]+120,each[1]);
  }
    //myPoly.setDamping(15);
    myPoly.setRestitution(3);
    myPoly.setFillColor(color(200,255,255));
    world.add(myPoly);
    
  FPoly myPoly2 = new FPoly();
  String lines2[] = loadStrings("poly.txt");
  for(int i = 0; i<lines2.length; i++){
    float each[] = float(split(lines2[i],','));
    myPoly2.vertex(each[0]+200,each[1]+200);
  }
  myPoly2.setDamping(5);
  myPoly2.setFillColor(color(0,220,255));
  world.add(myPoly2);
  
   FPoly myPoly3 = new FPoly();
  String lines3[] = loadStrings("poly.txt");
  for(int i = 0; i<lines3.length; i++){
    float each[] = float(split(lines3[i],','));
    myPoly3.vertex(each[0],each[1]+200);
  }
  myPoly3.setDamping(5);
  myPoly3.setFillColor(color(0,250,255));
  world.add(myPoly3);
  
   FPoly myPoly4 = new FPoly();
  String lines4[] = loadStrings("poly.txt");
  for(int i = 0; i<lines4.length; i++){
    float each[] = float(split(lines4[i],','));
    myPoly4.vertex(each[0]+60,each[1]+100);
  }
  myPoly4.setDamping(15);
  myPoly4.setFillColor(color(220,100,255));
  world.add(myPoly4);
  
   FPoly myPoly5 = new FPoly();
  String lines5[] = loadStrings("poly.txt");
  for(int i = 0; i<lines5.length; i++){
    float each[] = float(split(lines5[i],','));
    myPoly5.vertex(each[0]+200,each[1]+300);
  }
  myPoly5.setDamping(25);
  myPoly5.setFillColor(color(175,255,255));
  world.add(myPoly5);
  
  FPoly myPoly6 = new FPoly();
  String lines6[] = loadStrings("poly.txt");
  for(int i = 0; i<lines6.length; i++){
    float each[] = float(split(lines6[i],','));
    myPoly6.vertex(each[0]+300,each[1]+100);
  }
  myPoly6.setDamping(50);
  myPoly6.setFillColor(color(120,100,255));
  world.add(myPoly6);
  
  
}

void draw(){
  background(255);
  
  world.step();
  world.draw();
}

