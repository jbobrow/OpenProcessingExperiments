
void setup(){
  size(640, 640);
  background(#FFFFFF);
  strokeWeight(2);//width in pixels of stroke
}

void draw(){ 
 background(mouseX,mouseY,mouseX-mouseY);//always change colors
 fill(#FFFFFF);
 ellipse(320,320,600,600);//face
 ellipse(200,300,200,200);//Left, r1=100
 ellipse(460,300,200,200);//Right
//(200-Mx):(x-Mx)=(300-My):(y-My)=d1:d2
 fill(#000000); 
 float d1l=dist(200,300,mouseX,mouseY);
 float d2l=d1l-75;//r1-r2
 float xl= mouseX+(200-mouseX)*d2l/d1l;
 float yl= mouseY+(300-mouseY)*d2l/d1l;
 float d1r=dist(460,300,mouseX,mouseY);
 float d2r=d1r-75;
 float xr= mouseX+(460-mouseX)*d2r/d1r;
 float yr= mouseY+(300-mouseY)*d2r/d1r;
 ellipse(xl,yl,50,50);//r2=25
 ellipse(xr,yr,50,50);
 noFill();
 arc(320,320,480,450,QUARTER_PI,HALF_PI+QUARTER_PI);
 println(d1l);
 println(d1r);
}
