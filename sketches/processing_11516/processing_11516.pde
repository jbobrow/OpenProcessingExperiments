
// geometric subdivion 1
// 
// Matthew Conroy, started June 2010
//
// august 2010: added "subinscribed" circles inside triangles
//
// inspired by 
// stained glass look by steven kay, May 2010
//
//

// uncomment this line and change pdf below to 1 to generate pdfs 
// also uncomment the two pdf lines in draw()

//import processing.pdf.*;  
int pdf=0;

int fillSwitch=0; // change this to 1 for color instead of line drawing

int subCut=2; 
int frameCount=0;


void setup() {
  
 // size(800,800);
  if (pdf==1) {
    size(700,600,PDF,"gubgub1.pdf");
  }
  else {
    size(700,700);
  }
  
  if (pdf==0) {
  frameRate(0.2);
  }
  strokeWeight(1);
  strokeJoin(BEVEL);
  smooth(); 
}

 
void draw() {
  background(255);  
  
  subCut=int(random(5,10));
  rectangle1(width*0.05,height*0.05,width*0.9,height*0.9,12);
  
  if (pdf==1) {
    //PGraphicsPDF pdf = (PGraphicsPDF) g;  // Get the renderer
    //pdf.nextPage();  // Tell it to go to the next page

    ++frameCount;
    println(frameCount);
    if (frameCount>3) {
        exit();
    }
  }

}



float aspect(float ww, float hh) { // return the aspect ration of the rectangle 
  return(max(hh/ww,ww/hh));
}

void rectangle1(float x1,float y1,float ww,float hh, int level) {
  if ((level<1) || (min(ww,hh)<10)) {
    stroke(0);
    noFill();
    if (fillSwitch==1) {
      fill(randColor());
      noStroke();
    }
    rect(x1,y1,ww,hh);
    return;
  }
  
  if (aspect(ww,hh)<3) { // if the rectangle is not too skinny.
    if (random(1)<0.2) { // cut the rectangle into two vertically
        rectangle1(x1,y1,ww,hh/2,level-1);
        rectangle1(x1,y1+hh/2,ww,hh/2,level-1);
        return;
    }
    if (random(1)<0.2) { // cut the rectangle in two horizontally
      rectangle1(x1,y1,ww/2,hh,level-1);
      rectangle1(x1+ww/2,y1,ww/2,hh,level-1);
      return;
    }
    
    if (random(1)<0.4) { // put three circles in the rectangle
       rectangle1(x1,y1,ww,hh,0);
       circle1(x1+ww/2,y1+hh/2,0.5*min(ww,hh),level-1);
       if (ww<hh) {
         float rad=(hh-min(ww,hh))*0.25;
         circle1(x1+ww/2,y1+hh/2-0.5*min(ww,hh)-rad,rad,level-1);
         circle1(x1+ww/2,y1+hh/2+0.5*min(ww,hh)+rad,rad,level-1);
       }
       else {
         float rad=(ww-min(ww,hh))*0.25;
         circle1(x1+ww/2+0.5*min(ww,hh)+rad,y1+hh/2,rad,level-1);
         circle1(x1+ww/2-0.5*min(ww,hh)-rad,y1+hh/2,rad,level-1);
       }
       return;
    }
    
    if (random(1)<0.5) { // make a "sub" rectangle 
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
        noFill();
        if (fillSwitch==1) {
          fill(randColor());
          noStroke();
        }
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
      float r1=sqrt((s-len1)*(s-len2)*(s-len3)/s); // inscribed circle radius
      float xCen = (len1*x1+len2*x2+len3*x3)/(len1+len2+len3); // inscribed circle center x
      float yCen = (len1*y1+len2*y2+len3*y3)/(len1+len2+len3); // inscribed circle center y
      
      circle1(xCen,yCen,r1,level-1); // the inscribed circle
      
      float d1=dist(x1,y1,xCen,yCen);
      float r2=(r1*(d1-r1))/(d1+r1);
      float weight=(d1-r1-r2)/d1;
      float xCen2 = xCen*weight+x1*(1-weight);
      float yCen2 = yCen*weight+y1*(1-weight);
      
      circle1(xCen2,yCen2,r2,level-1);
      
      d1=dist(x2,y2,xCen,yCen);
      r2=(r1*(d1-r1))/(d1+r1);
      weight=(d1-r1-r2)/d1;
      xCen2 = xCen*weight+x2*(1-weight);
      yCen2 = yCen*weight+y2*(1-weight);
      
      circle1(xCen2,yCen2,r2,level-1);
      
      d1=dist(x3,y3,xCen,yCen);
      r2=(r1*(d1-r1))/(d1+r1);
      weight=(d1-r1-r2)/d1;
      xCen2 = xCen*weight+x3*(1-weight);
      yCen2 = yCen*weight+y3*(1-weight);
      
      circle1(xCen2,yCen2,r2,level-1);
    }
}

void circle1(float xc, float yc, float circRad, int level) { 
  float choiceMaker=random(1);
  if ((level<1) || (circRad<5)) {
     stroke(0);
     if (fillSwitch==1) {
       fill(randColor());
       noStroke();
     }
     ellipseMode(CENTER);
     if (circRad>3) {
         ellipse(xc,yc,circRad*2,circRad*2);
     }
     return;
  }
  if (choiceMaker<0.15) { // add a "sub" circle concentrically
    circle1(xc,yc,circRad,0);
    circle1(xc,yc,circRad-subCut,level-1);
    return;
    }
  if ((choiceMaker<0.3) && (circRad>25)) { // create two tangential inscribed circles
    circle1(xc,yc,circRad,0);
    float ang=random(TWO_PI);
    float ratio=random(0.3,0.7);
    circle1(xc+(circRad-ratio*circRad)*cos(ang),yc+(circRad-ratio*circRad)*sin(ang),circRad*ratio,level-1);
    circle1(xc+(circRad-(1-ratio)*circRad)*cos(ang+PI),yc+(circRad-(1-ratio)*circRad)*sin(ang-PI),circRad*(1-ratio),level-1);
    return;
  }
  
  if (choiceMaker<0.4) { // inscribe a triangle
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
  if (choiceMaker<0.6) { // put a rectangle in the circle, with two smaller circles
    float ang1=random(PI/4-0.3,PI/3+0.3);
    circle1(xc,yc,circRad,0);
    rectangle1(xc-circRad*cos(ang1),yc-circRad*sin(ang1),2*circRad*cos(ang1),2*circRad*sin(ang1),level-1);
    float rad2=0.5*(circRad-circRad*cos(ang1));
    circle1(xc+circRad*cos(ang1)+rad2,yc,rad2,level-1);
    circle1(xc-circRad*cos(ang1)-rad2,yc,rad2,level-1);
    float rad3=0.5*(circRad-circRad*sin(ang1));
    circle1(xc,yc+circRad*sin(ang1)+rad3,rad3,level-1);
    circle1(xc,yc-circRad*sin(ang1)-rad3,rad3,level-1);
    return;
  }
  if (choiceMaker<0.8) { // annular steiner chain
     circle1(xc,yc,circRad,0);
     float randtemp=random(0,1);
     int n = int(3+12*randtemp*randtemp);
     float theta = PI/(1.0*n);
     float temp=(1/cos(theta)+tan(theta));
     float littleR=circRad/(temp*temp);
     float rho=littleR*sin(theta)/(1-sin(theta));
     for(int i=0; i<n; ++i) {
       stroke(255,0,255);
       circle1(xc+(rho+littleR)*cos(theta*i*2),yc+(rho+littleR)*sin(theta*i*2),rho,level-1);
     }
     circle1(xc,yc,littleR,level-1);
     return;
  }
  if (choiceMaker<0.9) { //Pappus chain
     circle1(xc,yc,circRad,0);
     float rf=random(0.2,0.8);
     int n=int(random(4,10));
     float rot=random(TWO_PI);
     for(int i=0; i<n; ++i) {
       float xx=rf*(1+rf)/(2*(i*i*(1-rf)*(1-rf)+rf));
       float yy=i*rf*(1-rf)/(i*i*(1-rf)*(1-rf)+rf);
       float rad=((1-rf)*rf/(1.0*(i*i*(1-rf)*(1-rf)+rf)));
       xx=2*(xx-0.5);
       yy=2*yy;
       float xt=xx*cos(rot)-yy*sin(rot);
       float yt=xx*sin(rot)+yy*cos(rot);   
       circle1(xc+xt*circRad,yc+yt*circRad,rad*circRad,level-1);
       if (i>0) {
         yy=-yy;
          xt=xx*cos(rot)-yy*sin(rot);
          yt=xx*sin(rot)+yy*cos(rot);
          circle1(xc+xt*circRad,yc+yt*circRad,rad*circRad,level-1);
       }
       //println(xx+" "+yy+" "+rad);
     }
     
     float xx=rf-1;
     float yy=0;
     float xt=xx*cos(rot)-yy*sin(rot);
     float yt=xx*sin(rot)+yy*cos(rot);
     circle1(xc+xt*circRad,yc+yt*circRad,rf*circRad,level-1);
   return; 
  }
  
 else { // "octagon" 
    circle1(xc,yc,circRad,0);
    float shift=2*circRad/sqrt(10.);
    rectangle1(xc-shift*0.5,yc-shift*0.5,shift,shift,level-1);
    rectangle1(xc-1.5*shift,yc-shift*0.5,shift,shift,level-1);
    rectangle1(xc-shift*0.5,yc-1.5*shift,shift,shift,level-1);
    rectangle1(xc+shift*0.5,yc-shift*0.5,shift,shift,level-1);
    rectangle1(xc-shift*0.5,yc+shift*0.5,shift,shift,level-1);
    triangle1(xc-shift*0.5,yc-shift*0.5,xc-shift*1.5,yc-shift*0.5,xc-shift*0.5,yc-shift*1.5,level-1);
    triangle1(xc-shift*0.5,yc+shift*0.5,xc-shift*1.5,yc+shift*0.5,xc-shift*0.5,yc+shift*1.5,level-1);
    triangle1(xc+shift*0.5,yc-shift*0.5,xc+shift*0.5,yc-shift*1.5,xc+shift*1.5,yc-shift*0.5,level-1);
    triangle1(xc+shift*0.5,yc+shift*0.5,xc+shift*0.5,yc+shift*1.5,xc+shift*1.5,yc+shift*0.5,level-1);
    return;
 }
  
  
}
   

color randColor() {
 return color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
} 


