
PVector a;
PVector b;
int iterations = 1;
  
final int MAXITERACION  = 8;
 
void setup(){
  size(480,480,P2D);
  a = new PVector(0,240);
  b = new PVector(480,240);
  stroke(0,10)
  noLoop();
}
 
void draw(){
  //fill(200,100);
  //rect(0,0,width,height);
  a.set(0,240);
  b.set(480,240);
  recurse(a,b,0,random(0.5,0.8),random(0.8,1));
  noLoop();
}
void keyPressed(){
    switch(key){
        case 'e':background(200);break;
        default: stroke(0,map(mouseX,0,480,0,100));
                  loop();
    }
}
void recurse(PVector a,PVector b, int iteracion,float largo,float vari){
  //stop recursion
  if(iteracion>MAXITERACION)
    return;
     
  iteracion++;
  line(a.x,a.y,b.x,b.y);
   
  //se consigue la perpendicular
  float lineLength = dist(a.x,a.y,b.x,b.y);
  float dx = (b.x - a.x) /2;
  float dy = (b.y - a.y) /2;
  float px = a.x + dx * 1;
  float py = a.y + dy * 1;
  
   //line(px + dy * FACTOR, py - dx * FACTOR, px - dy * FACTOR, py + dx * FACTOR);
 
  PVector puntoArriba= new PVector(px + dy * largo, py - dx * largo);
  PVector puntoAbajo= new PVector(px - dy * largo, py + dx * largo);
  largo *= vari;
  if(random(0,1)>0.5){
     
    line(a.x,a.y,puntoArriba.x,puntoArriba.y);
    line(b.x,b.y,puntoArriba.x,puntoArriba.y);
    recurse(a,puntoArriba,iteracion,largo,vari);
    recurse(b,puntoArriba,iteracion,largo,vari);
 
  }else{
     
    
    line(a.x,a.y,puntoAbajo.x,puntoAbajo.y);
    line(b.x,b.y,puntoAbajo.x,puntoAbajo.y);
    recurse(a,puntoAbajo,iteracion,largo,vari);
    recurse(b,puntoAbajo,iteracion,largo,vari);
 
   
  }
   
   
 
}
