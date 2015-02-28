
int num=150;
int[] x= new int[num];
int[] y= new int[num];
int indexPosition=0;
color colores[];



void setup(){
  size(600,800);
  noStroke();
  smooth();
  fill(200,120);
  colores= new color[num];
}
void draw(){
  for (int i=0; i<num; i++){
    colores[i]= color(random(10,190),random(10,255),random(80,255));}
  
  background(mouseX,100,550);
  x[indexPosition]=mouseX;
  y[indexPosition]=mouseY;
  indexPosition=(indexPosition +1)%num;
  
  for(int i=0; i<num; i++){
  int pos=(indexPosition+i)% num;
  float radius=(num-i)/1000;
  fill(colores[i],100);
  ellipse(x[pos], y[pos], (radius+x[pos])/2, (radius+y[pos])/2);
  
  smooth();
 line(x[pos],y[pos], x[pos]+(random(-1,1)*(radius+x[pos])/2)/2,y[pos]+(random(-1,1)*(radius+y[pos])/2)/2);
  stroke(colores[i]+10);
   
  
  
  }
  }


