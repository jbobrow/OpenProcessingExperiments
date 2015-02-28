
/*Geometría computacional
 *por Dennys Regalado Diaz
 *
 *Intersección de Segmentos (02 dic 2008)
 */
segmento new_seg,
         Seg[];
punto anterior;
boolean flag_inter;
int cont,
    num_pts,
    lastX,
    lastY;
color fondo,azul,blanco,opaco;

class punto{
  int x,y;
  punto(){
    x=y=0;
  }
  punto(int new_x,int new_y){
    x= new_x;
    y= new_y;
  }    
}

class segmento{
  punto p0,p1;
  segmento(punto p0,punto p1){
    this.p0 = p0;
    this.p1 = p1;
  }   
}
void setup(){
  Seg = new segmento[1000];
  num_pts = 0;
  cont = 0;
  fondo = color(200,200,196);
  azul = color(13,74,142);
  blanco = color(255);
  opaco = color(179,178,179);
  ///
  size(200,200);
  background(fondo);
  fill(azul);  
  smooth();
  
}
double Cross(punto a, punto b,punto c){
  return (b.x-a.x)*(c.y-a.y) - (b.y-a.y)*(c.x-a.x);
}

boolean on_segment(punto a, punto b, punto test){
  return (test.x>=min(a.x,b.x)-6 && test.x<=max(a.x,b.x)+6 &&
    test.y>=min(a.y,b.y)-6 && test.y<=max(a.y,b.y)+6);
}
boolean intersectan(segmento a, segmento b){
  double d1,d2,d3,d4;
  d1 = Cross(b.p0,b.p1,a.p0);
  d2 = Cross(b.p0,b.p1,a.p1);
  d3 = Cross(a.p0,a.p1,b.p0);
  d4 = Cross(a.p0,a.p1,b.p1);
  if(((d1>0 && d2<0) || (d1<0 && d2>0)) &&
    ((d3>0 && d4<0) || (d3<0 && d4>0)))
    return true;

  if(d1==0 && on_segment(b.p0,b.p1,a.p0))
    return true;
  if(d2==0 && on_segment(b.p0,b.p1,a.p1))
    return true;    
  if(d3==0 && on_segment(a.p0,a.p1,b.p0))
    return true;
  if(d4==0 && on_segment(a.p0,a.p1,b.p1))
    return true;

  return false;
}
void pinta_linea(segmento seg, color borde, color relleno){
    stroke(borde);    
    fill(relleno);      
    ellipse(seg.p0.x,seg.p0.y,6,6);
    ellipse(seg.p1.x,seg.p1.y,6,6);
    stroke(relleno);
    line(seg.p0.x,seg.p0.y,seg.p1.x,seg.p1.y);
}
void draw(){
  new_seg = null;
  if(mousePressed){
    if(mouseButton==LEFT && mouseX!=lastX && mouseY!=lastY) {
    //pinta solo un punto
      stroke(blanco);       
      ellipse(mouseX,mouseY,6,6);
    
      lastX=mouseX; lastY=mouseY;
      num_pts++;    

      punto nuevo = new punto(mouseX,mouseY);
      if(num_pts==2 && anterior!=nuevo){          
        num_pts=0;
        new_seg = new segmento(anterior,nuevo);
        int i;
        flag_inter=false;
        for(i=0; i<cont;i++){
          if((flag_inter=intersectan(new_seg,Seg[i]) )){
            break;
          }
        }
        if(!flag_inter)
          Seg[cont++]=new_seg;
        else{ //opaca linea que intersecto
          pinta_linea(new_seg,fondo,opaco);
          pinta_linea(Seg[i],blanco,azul);//repinta linea intersectada
        }
      }    
      anterior = nuevo;    
    }else if (mouseButton==RIGHT){
      cont=0;
      num_pts=0;
      anterior=null;
      background(fondo);
    }
  }

  if(new_seg!=null && !flag_inter)
    pinta_linea(new_seg,blanco,azul);
}


