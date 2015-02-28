
int iterations=0;
int depth;
color WalkerColor;
RandomWalker2d[] myWalkers= new RandomWalker2d[iterations];
//RandomWalker3d[] myWalkers= new RandomWalker3d[iterations];
 
void setup(){
  colorMode(RGB, 100,255,255,1024);
  size(1400,800,P3D);
  //smooth();
  background(0);
  depth=(int)sqrt(width*height);
  for(int i=0;i<iterations;i++){
    WalkerColor=color(100,100+random(155),100+random(155),200);
    myWalkers[i]=new RandomWalker2d(width/2,height/2,(int)random(5)+1,WalkerColor);
//    myWalkers[i]=new RandomWalker3d(width/2 ,height/2 ,depth/2 ,(int)random(2)+1, WalkerColor);
 
  }
}
 
void draw(){
  //background(0);
   
  //float theta=mouseX*TWO_PI/width;
  //float phi=mouseY*TWO_PI/height;
 
  //camera(sin(theta)*width+150, sin(phi)*width+150, cos(theta)*width+150,
  //300.0, 300.0, 300.0,
  //0.0, 1.0, 0.0);
 
  for(int i=0;i<myWalkers.length;i++){
 
    myWalkers[i].walk();
  }
  noStroke();
  fill(0,20);
  rect(0,0,width,height);
 
}
 
void mouseDragged(){
 
  WalkerColor=color(100,100+random(155),100+random(155),200);
  float distance=sqrt(sq(mouseX-pmouseX)+sq(mouseY-pmouseY));
   RandomWalker2d myWalker= new RandomWalker2d(mouseX,mouseY,(int)random(distance)+1,WalkerColor);
  //RandomWalker3d myWalker= new RandomWalker3d(mouseX,mouseY,10,(int)random(distance)+1,WalkerColor);
  myWalkers=(RandomWalker2d[])append(myWalkers,myWalker );
//  myWalkers=(RandomWalker3d[])append(myWalkers,myWalker );
}


