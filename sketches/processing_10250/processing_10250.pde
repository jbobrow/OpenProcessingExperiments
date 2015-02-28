
// geometric subdivion 1
// 
// Matthew Conroy, June 2010
//
//
// inspired by 
// stained glass look by steven kay, May 2010
//
//

import processing.pdf.*; 
 
int subCut=2; 
int frameCount=0;
 
void setup() {
  size(700,600);
 // size(700,600,PDF,"gubgub1.pdf");
  frameRate(0.3);
  strokeWeight(1);
  strokeJoin(BEVEL);
  smooth(); 
}

 
void draw() {
  background(255);  
  
  subCut=int(random(5,10));
  rectangle1(width*0.05,height*0.05,width*0.9,height*0.9,12);
  
 // PGraphicsPDF pdf = (PGraphicsPDF) g;  // Get the renderer
 // pdf.nextPage();  // Tell it to go to the next page

  ++frameCount;
 // if (frameCount>10) {
 //     exit();
 // }
 

}



float aspect(float ww, float hh) { // return the aspect ration of the rectangle 
  return(max(hh/ww,ww/hh));
}

void rectangle1(float x1,float y1,float ww,float hh, int level) {
  if ((level<1) || (min(ww,hh)<10)) {
    stroke(0);
    rect(x1,y1,ww,hh);
    return;
  }
  
  if (aspect(ww,hh)<3) { // if the rectangle is not too skinny.
    if (random(1)<0.2) {
        rectangle1(x1,y1,ww,hh/2,level-1);
        rectangle1(x1,y1+hh/2,ww,hh/2,level-1);
        return;
    }
    if (random(1)<0.2) {
      rectangle1(x1,y1,ww/2,hh,level-1);
      rectangle1(x1+ww/2,y1,ww/2,hh,level-1);
      return;
    }
    
    if (random(1)<0.4) { // put a circle in the rectangle
       rectangle1(x1,y1,ww,hh,0);
       circle1(x1+ww/2,y1+hh/2,0.5*min(ww,hh),level-1);
       return;
    }
    
    if (random(1)<0.5) {
      rectangle1(x1,y1,ww,hh,0);
      if ((ww>4+2*subCut) && (hh>4+2*subCut)) {
        rectangle1(x1+subCut,y1+subCut,ww-2*subCut,hh-2*subCut,level-1);
      }
      return;
      }
    
    else {  // cut the rectangle into 6 triangles
      rectangle1(x1,y1,ww,hh,0);
      float rat1=random(0.2,0.8);
       float rat2=random(0.2,0.8);
      float rat3=random(0.2,0.8);
      float rat4=random(0.2,0.8);
      triangle1(x1+rat2*ww,y1,x1,y1+rat1*hh,x1+ww,y1+rat3*hh,level-1);
      triangle1(x1,y1,x1,y1+rat1*hh,x1+rat2*ww,y1,level-1);
      triangle1(x1+rat2*ww,y1,x1+ww,y1,x1+ww,y1+rat3*hh,level-1);
      triangle1(x1,y1+rat1*hh,x1+ww,y1+rat3*hh,x1+rat4*ww,y1+hh,level-1);
      triangle1(x1,y1+rat1*hh,x1,y1+hh,x1+rat4*ww,y1+hh,level-1);
      triangle1(x1+rat4*ww,y1+hh,x1+ww,y1+hh,x1+ww,y1+rat3*hh,level-1);
      return;
    }
  } // if the rectangle is too skinny...
  if (hh>ww) { // cut the rectangle into 2 rectangles horizontally
    rectangle1(x1,y1,ww,hh/2,level-1);
    rectangle1(x1,y1+hh/2,ww,hh/2,level-1);
  }
  else if (hh<ww) { // cut the rectangle into 2 rectangles vertically
    rectangle1(x1,y1,ww/2,hh,level-1);
    rectangle1(x1+ww/2,y1,ww/2,hh,level-1);
  }
  else {
     rectangle1(x1,y1,ww,hh,0);
  }
  
}
   
float triangleSize(float x1, float y1,float x2,float y2,float x3,float y3) {
    // returns the length of the shortest side of the trianlge 
    return(min(dist(x1,y1,x2,y2),dist(x1,y1,x3,y3),dist(x2,y2,x3,y3)));
}
  
void triangle1(float x1, float y1,float x2,float y2,float x3,float y3,int level) {
    if ((level<1) || (triangleSize(x1,y1,x2,y2,x3,y3)<15)) {
        stroke(0);
        if (triangleSize(x1,y1,x2,y2,x3,y3)>6) {
          triangle(x1,y1,x2,y2,x3,y3);
        }
        return;
    }
    
    float xx1=(x1+x2)/2;
    float yy1=(y1+y2)/2;
    float xx2=(x1+x3)/2;
    float yy2=(y1+y3)/2;
    float xx3=(x2+x3)/2;
    float yy3=(y2+y3)/2;
    
    if ((random(1)<0.2) && (triangleSize(x1,y1,x2,y2,x3,y3)>15)) { // cut the triangle into four smaller ones
      triangle1(x1,y1,xx1,yy1,xx2,yy2,level-1);
      triangle1(x2,y2,xx1,yy1,xx3,yy3,level-1);
      triangle1(xx1,yy1,xx2,yy2,xx3,yy3,level-1);
      triangle1(xx2,yy2,xx3,yy3,x3,y3,level-1);
    }
    else { // inscribe a circle
      triangle1(x1,y1,x2,y2,x3,y3,0);
      float len1=dist(x3,y3,x2,y2);
      float len2=dist(x1,y1,x3,y3);
      float len3=dist(x2,y2,x1,y1);
      float s=(len1+len2+len3)/2.;
      float circRad=sqrt((s-len1)*(s-len2)*(s-len3)/s);
      float xCen = (len1*x1+len2*x2+len3*x3)/(len1+len2+len3);
      float yCen = (len1*y1+len2*y2+len3*y3)/(len1+len2+len3);
      
      circle1(xCen,yCen,circRad,level-1);
    }
}

void circle1(float xc, float yc, float circRad, int level) { 
  if ((level<1) || (circRad<5)) {
     stroke(0);
     ellipseMode(CENTER);
     if (circRad>1) {
         ellipse(xc,yc,circRad*2,circRad*2);
     }
     return;
  }
  if (random(1)<0.2) {
    circle1(xc,yc,circRad,0);
    circle1(xc,yc,circRad-subCut,level-1);
    return;
    }
  if ((random(1)<0.3) && (circRad>25)) {
    circle1(xc,yc,circRad,0);
    float ang=random(TWO_PI);
    float ratio=random(0.3,0.7);
    circle1(xc+(circRad-ratio*circRad)*cos(ang),yc+(circRad-ratio*circRad)*sin(ang),circRad*ratio,level-1);
    circle1(xc+(circRad-(1-ratio)*circRad)*cos(ang+PI),yc+(circRad-(1-ratio)*circRad)*sin(ang-PI),circRad*(1-ratio),level-1);
    return;
  }
  
  if (random(1)<0.4) { // inscribe a triangle
     float spread=0.3;
     float rot=random(0,TWO_PI);
     float ang1=random(-spread,spread)+rot;
     float ang2=random(TWO_PI/3-spread,TWO_PI/3+spread)+rot;
     float ang3=random(2*TWO_PI/3-spread,2*TWO_PI/3+spread)+rot;
     //stroke(255,0,0);
     //triangle(xc+circRad*cos(ang1),yc+circRad*sin(ang1),xc+circRad*cos(ang2),yc+circRad*sin(ang2),xc+circRad*cos(ang3),yc+circRad*sin(ang3));
     circle1(xc,yc,circRad,0);
     triangle1(xc+circRad*cos(ang1),yc+circRad*sin(ang1),xc+circRad*cos(ang2),yc+circRad*sin(ang2),xc+circRad*cos(ang3),yc+circRad*sin(ang3),level-1);
     return;
  }
  else { // put a rectangle in the circle
    float ang1=random(PI/4-0.3,PI/3+0.3);
    circle1(xc,yc,circRad,0);
    rectangle1(xc-circRad*cos(ang1),yc-circRad*sin(ang1),2*circRad*cos(ang1),2*circRad*sin(ang1),level-1);
  }
  
}
   
   


