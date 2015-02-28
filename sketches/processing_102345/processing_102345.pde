
// Simple 3ds max obj loader.. having bugs, but works fine for 
// small detail object files and supports face & vertes detail only
// by, jubin jose
// .exe demo: http://teamPixFx.com/downloads/processing_sketches/obj_loader_test1.rar
ArrayList<VerticesData> vertex;
String lines[] = loadStrings("http://teamPixFx.com/downloads/processing_sketches/hello.obj");
float scale=2;
String ver[],fac[]; 
float ox=0, oy=0, oz=0, nx=0, ny=0, nz=0, fx=0,fy=0,fz=0;

void setup(){
  size(1000, 500, P3D);
  background(#000000);
  stroke(#00c6ff,50);
vertex = new ArrayList<VerticesData>();
//frameRate(5);
  ox=width/2;
  oy=height/2;
//noLoop();
int counter = 0;
//String lines[] = loadStrings("hello.obj");
for(int j=0; j < lines.length; j++){
  if(lines[j].contains("v ")){
vertex.add(new VerticesData(lines[j]));
counter++;
  }
}
}

void draw(){
  background(#000000);

//String lines[] = loadStrings("hello.obj");
  for(int i=0;i<lines.length;i++){
    if( lines[i].contains("f ")){
  fac = lines[i].split(" ");
//  println(fac[1]+","+fac[2]+","+fac[3]);

  for(int j=0; j<fac.length-1; j++){
 // for(int k=0; k < linesv.length; k++){
   VerticesData v = vertex.get(int(fac[j+1])-1);
    ver = v.getVertex().split(" ");
    nx=float(ver[2])*scale;
    ny=float(ver[3])*scale;
    nz=float(ver[4])*scale; 
 //   println(nx+","+ny+","+nz);
 
 pushMatrix();
 translate(width/2,height/1.5);
  rotateX(radians(mouseY)+radians(90));
  rotateY(radians(mouseX));
  line(ox,oy,oz,nx,ny,nz);
  popMatrix();
  
  println("running  "+ i);
      ox=nx;
    oy=ny;
    oz=nz;
//  }
  } 
 
    }
  } 
}
void mouseClicked(){
 background(#000000); 
 stroke(random(255),random(255),random(255),100);
}
void mouseDragged() 
{
 scale++;
}
void mouseReleased() {
  scale=2;
}

class VerticesData{
   String vertex;
   VerticesData(String a){
    vertex = a;
   } 
   String getVertex(){
     return vertex;
   }
}
