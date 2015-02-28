
/*Recursion 
 *por Dennys Regalado Diaz
 *
 *Fractal de piramides inscritas (24 nov 2008)
 */
int EPS  = 5; //define longitud del lado del triangulo mas pequeño
boolean flag = true;
Timer timer;
void setup(){
  size(500,500,P3D);  //ventan de 200 x 200 pixeles
  background(255);    //fondo negro
  noStroke(); 
  timer = new Timer(100);  
}
float teta =0;
void draw(){
  teta+=0.009;
  background(45);
  translate(width/4,-height/3);
  rotateY(teta);
//  rotateX(teta);
  timer.start();
  punto3D poly[] = new punto3D[4];
  //inicializa arreglo de puntos
  for(int i=0;i<4;poly[i]=new punto3D(),i++);
  int lado = (width-100)/2;
  poly[0].x = -lado;
  poly[0].y = 0;
  poly[0].z = 0;
  
  poly[1].x = lado;
  poly[1].y = 0;
  poly[1].z = 0;

  poly[2].x = 0;
  poly[2].y = (int) (sqrt(3.0)*-lado);
  poly[2].z = 0;

  poly[3].x = 0;
  poly[3].y = poly[2].y/2;
  poly[3].z = (int) (sqrt(3.0)*-lado);

  translate(width/2,height-10);
  rotateZ(radians(-45));
 // drawPyramid(poly[0],poly[1],poly[2],poly[3]);
  tri(poly[0],poly[1],poly[2],poly[3]);
}
void tri(punto3D p0,punto3D p1,punto3D p2, punto3D p3){
    float level,tt;  

    punto3D a=new punto3D(),b=new punto3D(),c=new punto3D(), d = new punto3D(),
           aa=new punto3D(),bb=new punto3D(),cc=new punto3D(),dd=new punto3D();
    if((level=dist(p0.x,p0.y,p1.x,p1.y)) < EPS)
      return;
    //punto medio del segmento p0,p3
    a.x = (p0.x + p3.x)/2;
    a.y = (p0.y + p3.y)/2;
    a.z = (p0.z + p3.z)/2;
    //punto medio del segmento p1,p3
    b.x = (p1.x + p3.x)/2;
    b.y = (p1.y + p3.y)/2;
    b.z = (p1.z + p3.z)/2;
    //punto medio del segmento p2,p3
    c.x = (p2.x + p3.x)/2;
    c.y = (p2.y + p3.y)/2;
    c.z = (p2.z + p3.z)/2;
    //
    d.x = p3.x;
    d.y = p3.y;
    d.z = p0.z;
    
    ///
    //punto medio del segmento pop1
    aa.x = (p0.x + p1.x)/2;
    aa.y = (p0.y + p1.y)/2;
    cc.z = p0.z;
    //punto medio del segmento p1p2
    bb.x = (p1.x + p2.x)/2;
    bb.y = (p1.y + p2.y)/2;
    bb.z = p0.z;
    //punto medio del segmento p2p1
    cc.x = (p2.x + p0.x)/2;
    cc.y = (p2.y + p0.y)/2;
    cc.z = p0.z;
    ////
    drawPyramid(a,b,c,p3);


     tri(a,b,c,p3);  
     tri(p0,aa,cc,a);
     tri(aa,p1,bb,b);
     tri(cc,bb,p2,c);   

}
class Timer{
  int t_inicial;
  int lapso;
  Timer(int milisegundos){
    lapso = milisegundos;
  }
  void start(){
    t_inicial = millis();
  }
  boolean terminado(){
    return (millis()-t_inicial >= lapso);      
  }

}
void drawPyramid(punto3D a, punto3D b, punto3D c, punto3D d){

  beginShape(TRIANGLES);

//  fill(150,0,0,127);//rojo
  fill(0,255,0,127);//rojo  
  vertex(a.x,a.y,a.z);
  vertex(b.x,b.y,b.z);
  vertex(d.x,d.y,d.z);
  
  fill(0,150,0,127);//verde
  vertex( b.x,b.y,b.z);
  vertex( c.x,c.y,c.z);
  vertex( d.x,d.y,d.z);
  
//  fill(0,0,150,127);//azul
    fill(0,23,0,127);//azul
  vertex( c.x,c.y,c.z);
  vertex( a.x,a.y,a.z);
  vertex( d.x,d.y,d.z);
  
  endShape();
}
class punto{
    public int x,y;
    punto(){
      this.x=this.y=0;
    }
    punto(int x, int y){
      this.x = x;
      this.y = y;
    }
}

void mousePressed()
{
  if(flag){
     noLoop();
     flag=false;
  }
  else{
    loop();
    flag= true;    
  }
}

class punto3D{
   public int x,y,z;
   punto3D(){
       x = y = z = 0;
   }
   punto3D(int x,int y,int z){
       this.x = x;
       this.y = y;
       this.z = z;
   }
}


