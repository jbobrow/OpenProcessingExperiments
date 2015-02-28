
cube[] cubes;

void setup(){
  size(500,500,P3D);
  cubes=new cube[0];
  for(int a=0;a<25;a++){
    for(int b=0;b<25;b++){
      cubes= (cube[]) append(cubes, new cube(20*a+10,20*b+10));
    }
  }
  print(cubes.length);
 // smooth();
}


void draw(){
  background(50,50,200); 
  directionalLight(252, 212, 102, 0, 1, -100);
  boolean stoppe=false;
  if(mouseX==pmouseX&&mouseY==pmouseY){stoppe=true;}
  for(int a=0;a<cubes.length;a++){
    cubes[a].dessine(stoppe); 
  }
}

class cube{
  float x,y,h,an,v;
  color c=color(random(220,255),random(150,200),0); 
  cube(float _x, float _y){
    x=_x;
    y=_y;
    an=0;
    v=0; 
  }
  void dessine(boolean stoppe){
    fill(c);
    pushMatrix();  
    translate(x,y );
    rotateX(an);
    rotateY(an); 
    box(14 );
    popMatrix();  
    an+=v;
    float d=dist(mouseX,mouseY,x,y);
    if(d<80 && !stoppe){
      d=(80-d)*0.0001;
      v = constrain(v+d,0,0.05); 
    } 
    else {
      v =v*0.99; 
      if(v<0.001) an=an+(0-an)*0.01; 
    }
  }

}



