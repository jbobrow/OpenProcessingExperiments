
//Nicholas Tang
//1/27/11
public void setup() {
  smooth();
  size(500,500);
  noStroke();
  colorMode(HSB, 360);
  //radial gradient background
  for(int i=height*3/2; i>0; i--){
    stroke(219, i/4, 360);
    strokeWeight(5);
    ellipse(width/2,height/2,i,i);
  }
  strokeWeight(1);
  stroke(0,175);
  noLoop();
}

public void draw() {
  int r = 50;
  int cw = width/2;
  int ch = height/2;
  //center hexagon triangle coordinates
  int dw = int(r*cos(radians(30)));
  int dh = int(r*sin(radians(30)));
  int trans = 70;
  fill(30,180,360,trans);
  triangle(cw,ch,cw,ch-r,cw-dw,ch-dh);
  fill(90,180,360,trans);
  triangle(cw,ch,cw-dw,ch-dh,cw-dw,ch+dh);
  fill(150,180,360,trans);
  triangle(cw,ch,cw-dw,ch+dh,cw,ch+r);
  fill(210,180,360,trans);
  triangle(cw,ch,cw+dw,ch+dh,cw,ch+r);
  fill(270,180,360,trans);
  triangle(cw,ch,cw+dw,ch+dh,cw+dw,ch-dh);
  fill(330,180,360,trans);
  triangle(cw,ch,cw,ch-r,cw+dw,ch-dh);
  //second level of hexagons
  fill(234,180,360,6);
  //hexagon side lengths
  int side = 50;
  //radius of hexagon
  int radi = 2*r/3;
  //length, value used to calculate seed positions
  int side2 = int(side/2+r+radi*(1-cos(radians(60)))/2);
  int sw = int(side2*cos(radians(30)));
  int sh = int(side2*sin(radians(30)));
  //level of recursion
  int level = 3;
  drawHex(0,side,radi,0,-side2,level);
  drawHex(60,side,radi,sw,-sh,level);
  drawHex(120,side,radi,sw,sh,level);
  drawHex(180,side,radi,0,side2,level);
  drawHex(240,side,radi,-sw,sh,level);
  drawHex(300,side,radi,-sw,-sh,level);
}

public void drawHex(int orient,int side, int radi, int sx, int sy, int level){
  //create hexagon, translate, and rotate
  pushMatrix();
  translate(width/2+sx, height/2+sy);
  rotate(radians(orient));
  int dw = int(radi*cos(radians(30)));
  int dh = int(radi*sin(radians(30)));
  fill(360-orient,180,360,70);
  stroke(0);
  beginShape();
  vertex(0,-side/2-radi*(1-cos(radians(60))));
  vertex(-dw,-side/2); 
  vertex(-dw,side/2); 
  vertex(0,side/2+radi*(1-cos(radians(60))));
  vertex(dw,side/2);
  vertex(dw,-side/2);
  vertex(0,-side/2-radi*(1-cos(radians(60))));
  endShape();
  stroke(orient,200,200);
  line(0,-side/2,0,side/2);
  //highlight-line
  stroke(233,360,360);
  line(dw*.8,-side/2,dw*.8,side/2);
  popMatrix();
  int newradi = 2*radi/3;
  int newside = max(2*side/3,int(newradi*sin(radians(30)))*2);
  int newside2 = int(newside/2+(side/2+radi*(1-cos(radians(60))))+newradi*(1-cos(radians(60)))/2);
  //seed positions, distance from center of previous hexagon
  int dsx = int((int(sx<width/2)-int(sx>width/2))*newside2*sin(radians(orient)));
  int dsy = int((int(sy>height/2)-int(sy<height/2))*newside2*cos(radians(orient)));
  //center of radius
  int cx = int((int(sx<width/2)-int(sx>width/2))*(side/2-radi/2)*sin(radians(orient)));
  int cy = int((int(sy>height/2)-int(sy<height/2))*(side/2-radi/2)*cos(radians(orient)));
  int dsx2 = int((int(sx<width/2)-int(sx>width/2))*(dsx-cx)*cos(radians(-60))-(dsy-cy)*sin(radians(-60)));
  int dsy2 = int((int(sx<width/2)-int(sx>width/2))*(dsx-cx)*sin(radians(-60))+(dsy-cy)*cos(radians(-60)));
  int dsx3 = int((int(sx<width/2)-int(sx>width/2))*(dsx-cx)*cos(radians(60))-(dsy-cy)*sin(radians(60)));
  int dsy3 = int((int(sx<width/2)-int(sx>width/2))*(dsx-cx)*sin(radians(60))+(dsy-cy)*cos(radians(60)));
  //recursion
  if(level > 1) {
    level = level - 1;
    drawHex(orient+0,newside,newradi,sx+dsx,sy+dsy,level);
    drawHex(int(orient-40),newside,newradi,sx+dsx2+cx,sy+dsy2+cy,level);
    drawHex(int(orient+40),newside,newradi,sx+dsx3+cx,sy+dsy3+cy,level);
  }
}

