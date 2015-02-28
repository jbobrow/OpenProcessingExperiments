
Point center;
float tamReloj = 550;
float tamSeg = 250; float ancSeg = 3;
float tamMin = 200; float ancMin = 8;
float tamHor = 140; float ancHor = 15;

void setup (){
 
 size(800,600);
 center = new Point(width/2, height/2);
    println(second());
   println(minute());
   println(hour());
}

void draw(){
   background(208);
   stroke(23, 23,180);
   ellipse(iX(0), iY(0), tamReloj, tamReloj);

   stroke(0);
   strokeWeight(ancHor);   
   Point hora = Rotar(new Point(0, tamHor), -2 * Math.PI * hour() / 12);
   line( iX(0), iY(0), iX(hora.x), iY(hora.y));
   
   strokeWeight(ancMin);
   Point min = Rotar(new Point(0, tamMin), -2 * Math.PI * minute() / 60);
   line( iX(0), iY(0), iX(min.x), iY(min.y));   
   
   strokeWeight(ancSeg);
   Point seg = Rotar(new Point(0, tamSeg),- 2 * Math.PI * second() / 60);
   line( iX(0), iY(0), iX(seg.x), iY(seg.y));
   
   strokeWeight(1.5 * ancHor);
   stroke(180, 23,23);
   point(iX(0), iY(0));
   
   
}

Point[] Rotar(Point[] p, double angulo){
  double r11,r12,r21,r22;
  r11=Math.cos(angulo);
  r12=Math.sin(angulo);
  r21=-Math.sin(angulo);
  r22=Math.cos(angulo);
  
  Point[] pfinal = new Point[p.length];
  
  for(int i=0; i<p.length; i++)
  {
    double x = p[i].x*r11+p[i].y*r21;
    double y = p[i].x*r12+p[i].y*r22;
    pfinal[i]= new Point(x,y);
  }
  return pfinal;
}

Point Rotar(Point p, double angulo){
  double r11,r12,r21,r22;
  r11=Math.cos(angulo);
  r12=Math.sin(angulo);
  r21=-Math.sin(angulo);
  r22=Math.cos(angulo);
  
  double x = p.x*r11+p.y*r21;
  double y = p.x*r12+p.y*r22;
  
  return new Point(x, y);
}

float iX(float x){  return (x + center.x); }
float iY(float y){  return (center.y - y); }

class Point{
   float x,y;
  
   Point(float x, float y){
     this.x = x;
     this.y = y;
   } 
   
   Point(double x, double y){
     this.x = (float)x;
     this.y = (float)y;
   } 
}
