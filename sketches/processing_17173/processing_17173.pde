
void setup() {
  size(800,800);
  background(0);
  smooth();
}

void draw() {
  background(0);
  float dimX=20;
  float dimY=20;
  
  //2d array
  for(int i=0;i<dimX;i++) {
    for(int j=0;j<dimY;j++) {

      float cx=(width/dimX/2)+i*(width/dimX);
      float cy=(width/dimY/2)+j*(width/dimY);
      float dx=mouseX-cx;
      float dy=mouseY-cy;
      float dis=sqrt(pow(dx,2)+pow(dy,2));
      float r=height*5/(dis+20);

      color col=color(i*j,1*dis,255-1*dis,50);
      
      // do if distance from mouse is larger than
      if (cos(dis)>0) {
      //if (dis>200) {
        //noStroke();
        drawDiamond(col,0.01*r,cx,cy,r);
        //line((width/20/2)+(i-1)*(width/20),(width/20/2)+(j-1)*(width/20),cx,cy);
        
        stroke(255);
        strokeWeight(dis/100);
        // for every even row and column
        if (j%2==0 && i%2==0) {
          noFill();
          float c1x=cx+0.5*(width/dimX);
          float c1y=cy;
          float c2x=cx+(width/dimX);
          float c2y=cy+0.5*(width/dimY);
          float c3x=cx+(width/dimX);
          float c3y=cy+(width/dimY);
          beginShape();
          vertex(cx, cy); // first point
          bezierVertex(c1x,c1y,c2x,c2y,c3x,c3y);
          endShape();
        }
        // for every odd row and column
        else if(j%2!=0 && i%2!=0){
          noFill();
          float c1x=cx;
          float c1y=cy+0.5*(width/dimY);
          float c2x=cx+0.5*(width/dimX);
          float c2y=cy+1*(width/dimY);
          float c3x=cx+(width/dimX);
          float c3y=cy+(width/dimY);
          beginShape();
          vertex(cx, cy); // first point
          bezierVertex(c1x,c1y,c2x,c2y,c3x,c3y);
          endShape();
        }
        strokeWeight(1);
        
        //noFill();
        //beginShape();
        //curveVertex(cx,cy); // the first control point
        //curveVertex(cx,cy); // is also the start point of curve
        //curveVertex((width/20/2)+(i+1)*(width/20),(width/20/2)+(j)*(width/20));
        //curveVertex((width/20/2)+(i+1)*(width/20),(width/20/2)+(j+1)*(width/20));// the last point of curve
        //curveVertex((width/20/2)+(i+1)*(width/20),(width/20/2)+(j+1)*(width/20)); // is also the last control point
        //endShape();
      }
      else {
        //noStroke();
        fill(255-1*dis,1*dis,i*j,125);
        ellipse(cx,cy,1.5*r,1.5*r);
      }
    }
  }
}




void drawDiamond(color col,float a, float ox,float oy,float r) {
  fill(col);
  stroke(255);
  drawDiamond(a,ox,oy,r);
}

void drawDiamond(float a, float ox,float oy,float r) {
  float x1=ox+r*cos(a);
  float y1=oy+r*sin(a);
  float x2=ox+r*cos(a+PI/2);
  float y2=oy+r*sin(a+PI/2);
  float x3=ox+r*cos(a+PI);
  float y3=oy+r*sin(a+PI);
  float x4=ox+r*cos(a+PI*3/2);
  float y4=oy+r*sin(a+PI*3/2);
  //noStroke();
  quad(x1,y1,x2,y2,x3,y3,x4,y4);
  //stroke(0);
}


