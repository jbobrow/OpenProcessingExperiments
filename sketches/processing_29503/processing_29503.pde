
//Approximate Center of a triangle using only lines


int wd=255;
int ht=255;
int r(){

  return  color(wd-random(255),ht-random(255),255);
}
color n;
void mousePressed(){
  setup();
}

void draw(){

}
void setup(){
  size(wd,ht,JAVA2D);
  smooth();
  background(-1);
  //  point1= r();
  // point2= r();
  // point3= r();
  point1=color(random(wd),25,255);
  point2=color(random(wd)-25,random(ht));
  point3=color(25,random(ht),255);
  stroke(0,0,255);
  point(cr(point1),cg(point1));
  point(cr(point2),cg(point2));
  point(cr(point3),cg(point3));
  makeline(point1,point2);
  makeline(point2,point3);
  makeline(point3,point1);
  strokeWeight(1);
  //stroke(0,85,0,85);
  stroke(0,85,0);
  ln="one";
  midline(point1,point2,point3);
  ln="two";
  midline(point2,point3,point1);
  ln="three";
  midline(point3,point1,point2);
  n=get(1,1);
  //putcircle();
  color paw = segIntersection3(p1, p2, p3, p4, p5, p6, p7, p8);

}
String ln="one";
color p1;
color p2;
color p3;
color p4;
color p5;
color p6;
color p7;
color p8;

void putcircle(){
  for (int x =0;x<wd;x++){
    for (int y=0;y<ht;y++){
      color c = get(x,y);
      float R = cr(c);
      float G = cg(c);
      float B= cb(c);
      float A = ca(c);
      float maxcol = min(R,G,B);
      // if (maxcol==G ){
      if (G> R && G > B && G> 85*2){
        noFill();
        //noStroke();
        strokeWeight(1);
        // fill(-1);
        //  ellipse(x,y,10,10);
        stroke(85,0,0);
        ellipse(x,y,5,5);
      } 
      //}

    }
  } 
}

void makeline(color col1,color col2){
  strokeWeight(3);
  //stroke(blendColor(col1,col2,ADD));
  line(cr(col1),cg(col1),cr(col2),cg(col2));
}
void midline(color src,color left,color right){
  color mid= color((cr(left)+cr(right))/2,(cg(left)+cg(right))/2,255);
  makeline(src,mid);
  if(ln=="one"){
    p1=cr(src);
    p2=cg(src);
    p3=cr(mid);
    p4=cg(mid);

  }
  if(ln=="two"){
    p5=cr(src);
    p6=cg(src);
    p7=cr(mid);
    p8=cg(mid);
  }
}


color point1;
color point2;
color point3;

int ca(color col){
  return col >> 24 & 0xff;
}
int cr(color col){
  return col >> 16 & 0xff;
}
int cg(color col){
  return col >> 8 & 0xff;
}
int cb(color col){ 
  return  col  & 0xff;
}

color segIntersection2(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4)
{
  float bx = x2 - x1;
  float by = y2 - y1;
  float dx = x4 - x3;
  float dy = y4 - y3; 
  float b_dot_d_perp = bx*dy - by*dx;
  if(b_dot_d_perp == 0) {
    return 0;
  }
  float cx = x3-x1; 
  float cy = y3-y1;
  float t = (cx*dy - cy*dx) / b_dot_d_perp; 
  stroke(255,0,0);
  noFill();
  ellipse(x1+t*bx,y1+t*by,10,10);
  return color(x1+t*bx, y1+t*by,255); 
}


// Line Segment Intersection

color segIntersection(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) 
{ 
  float bx = x2 - x1; 
  float by = y2 - y1; 
  float dx = x4 - x3; 
  float dy = y4 - y3;
  float b_dot_d_perp = bx * dy - by * dx;
  if(b_dot_d_perp == 0) {
    return 0;
  }
  float cx = x3 - x1;
  float cy = y3 - y1;
  float t = (cx * dy - cy * dx) / b_dot_d_perp;
  if(t < 0 || t > 1) {
    return 0;
  }
  float u = (cx * by - cy * bx) / b_dot_d_perp;
  if(u < 0 || u > 1) { 
    return 0;
  }
  noFill();
  stroke(255,0,0);
  ellipse(x1+t*bx, y1+t*by,10,10);
  return color(x1+t*bx, y1+t*by,255);
}

color segIntersection3(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) 
{ 
  color retval = 0;

  float p1=0;
  float p2 = 0;
  float p3 = 0;
  float p4=0;

  float p5=0;
  float  p6=0;
  float p7=0;

  float p8=0;
  p1 =(((x1*y2)-(y1*x2))*(x3-x4));
  p2=((x1-x2)*((x3*y4)-(y3*x4)));
  p3=((x1-x2)*(y3-y4));
  p4=((y1-y2)*(x3-x4));
  p5=(((x1*y2)-(y1*x2))*(y3-y4));
  p6=(y1-y2)*((x3*y4)-(y3*x4));
  p7=((x1-x2)*(y3-y4));
  p8=((y1-y2)*(x3-x4));
  // 
  retval = color(((p1-p2)/(p3-p4)),
  ((p5-p6)/(p7-p8)),
  255); 
  boolean overt=false;
  if (overt){
    float retvala=(((((x1*y2)-(y1*x2))*(x3-x4)))-(((x1-x2)*((x3*y4)-(y3*x4)))))/
      (((((x1-x2)*(y3-y4)))-(((y1-y2)*(x3-x4) ))));

    float retvalb=(((((x1*y2)-(y1*x2))*(y3-y4)))-(((y1-y2)*((x3*y4)-(y3*x4)))))/
      (((x1-x2)*(y3-y4))-((y1-y2)*(x3-x4)));
    retval=color(retvala,retvalb,255);
  }
  noFill();
  stroke(255,0,0);
  ellipse(cr(retval),cg(retval),10,10);
  return retval; 
}

void keyPressed(){
  setup(); 
}


