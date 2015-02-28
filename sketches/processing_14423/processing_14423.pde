

// setup global unit size for scalability and simplicity
int   unit=20;

color norm_stroke = color(30,30,30,255);
color norm_fill = color(30,30,30,255);
color crossfill = norm_fill;

int   norm_strokeweight = 0;

int transx=0,transy=0,radius=31*unit,incdec=5, normcross=7*unit,normcrossposX=5*unit,normcrossposY=5*unit;
boolean move=false;

int v1X=20*unit, v1Y=10*unit;
  int v2X=25*unit, v2Y=5*unit;
  int v3X=30*unit, v3Y=10*unit;

void setup(){
  // main setup routines
  size(600,600);
  smooth();
  cursor(CROSS);
  
}

void draw(){
background(240);
  
  // setup a grid in the background
  if(keyPressed){
    if(key=='g'){
      drawGrid();
    }
    if(key=='r'){
      transy=0;
      radius=31*unit;
    }
    if(key=='t'){
      if(incdec==5){
        incdec=-5;
      } else {
        incdec=5;
      }
    }
    if(key=='q'){
      normcross++;
    }
    if(key=='w'){
      normcross--;
    }
  }
  
  resetColors();
  if(crossposition()==1){
  cursor(HAND);
  } else if(isInside(mouseX, mouseY)==true){
      cursor(HAND);
      if (mousePressed&&move==false){
        move=true;
      } else if (mousePressed&&move==true){
      move=false;
      }
  } else {
      cursor(CROSS);
  }
  
  if(move==true){
    transy=transy-5;
    radius=radius+incdec;
  }
  
  // draw the circle in bottom left corner
  drawCircle(radius,0, height);
  
  // draw 45 degree cross in top left corner
  fill(crossfill);
  drawCross(normcross, normcrossposX,normcrossposY, 45);
  
  noStroke();
  
  // Draw the first rect  
  // from the circle to the top crossing the cross
  beginShape();
  vertex(4*unit,15*unit);
  vertex(5*unit,15*unit);
  vertex(20*unit, 0);
  vertex(19*unit, 0);
  endShape(CLOSE);
  
  drawsecrect(transx,transy);
  
  drawthirdrect(transx,transy);
}

// Reset colors & weights
void resetColors(){
   fill(norm_fill);
   stroke(norm_stroke);
   strokeWeight(norm_strokeweight);
}

void drawGrid() {
  noFill();
  stroke(200);
  strokeWeight(1);
  
  int num=height/unit;
  for(int i=1; i<num; i++) {
      if(i*unit%100==0){
        strokeWeight(2);
      }else {
        strokeWeight(1);
      }
      line(0,i*unit,width,i*unit);
      line(i*unit,0,i*unit,height);
    }
   ellipse(width/2,height/2,5,5);
}

void drawCircle(int radius, int x, int y){
   noFill();
   strokeWeight(unit);
   
   ellipse(x,y,radius,radius);
   resetColors();
}

void drawCross(int a, int coordX, int coordY, int rotation) {
  
  noStroke();
  
  translate(coordX, coordY);
  rotate(radians(rotation));

  beginShape();

    int posx = 0;
    int posy = 0;
    int x = posx-(a*3/2);
    int y = posy+(a/2);

    vertex(x,y);
    vertex(x+a,y);
    vertex(x+a,y+a);
    vertex(x+2*a,y+a);
    vertex(x+2*a,y);
    vertex(x+3*a,y);
    vertex(x+3*a,y-a);
    vertex(x+2*a,y-a);
    vertex(x+2*a,y-2*a);
    vertex(x+a,y-2*a);
    vertex(x+a,y-a);
    vertex(x,y-a);
    vertex(x,y);

  endShape(CLOSE);
  resetMatrix();
  resetColors();
}

void drawsecrect(int transx, int transy){
  // Draw the second rect which ends in a triangular shape
  // Bottom left to upper right
  translate(transx,transy);
  beginShape();
  vertex(0,26*unit);
  vertex(0,25*unit);
  vertex(5*unit, 25*unit);
  vertex(20*unit, 10*unit);
  vertex(21*unit, 10*unit);
  vertex(5*unit, 26*unit);
  endShape(CLOSE);
  
  
  
  triangle(v1X, v1Y, v2X, v2Y,v3X, v3Y);
  resetMatrix();
}

void drawthirdrect(int transx, int transy){
  translate(transx,transy);
  // Draw the third rect
  // starts in cross goes straight and ends on the right side
  rect(10*unit,13*unit,20*unit,unit);
  
  // Draw the outlined triangle
  // below triangle number 1
  beginShape();
  vertex(22*unit,13*unit);
  vertex(25*unit,10*unit);
  vertex(27*unit, 10*unit);
  vertex(30*unit, 13*unit);
  vertex(29*unit, 13*unit);
  vertex(26*unit, 10*unit);
  vertex(23*unit, 13*unit);
  endShape(CLOSE);  
  resetMatrix();
}

void mouseDragged(){
    if(crossposition()==1){
    normcrossposX=mouseX;
    normcrossposY=mouseY;
    crossfill = color(0,100);
    }
}

void mousePressed(){
    if(crossposition()==1){
    
    }
}

int crossposition(){
    if(mouseX<=normcrossposX+(normcross*3/2)
    &&mouseX>=normcrossposX-(normcross*3/2)
    &&mouseY<=normcrossposY+(normcross*3/2)
    &&mouseY>=normcrossposY-(normcross*3/2)){
      return 1;
    } else return 0;
    
    
    /*mouseX<=normcrossposX+(normcross/2)
    mouseX>=normcrossposX-(normcross/2)
    mouseX<=normcrossposX+(normcross*3/2)
    mouseX>=normcrossposX-(normcross*3/2)
    mouseX<=normcrossposX+(normcross/2)
    mouseX>=normcrossposX-(normcross/2)
    
    mouseY<=normcrossposY+(normcross/2)
    mouseY>=normcrossposY-(normcross/2)
    mouseY<=normcrossposY+(normcross*3/2)
    mouseY>=normcrossposY-(normcross*3/2)
    mouseY<=normcrossposY+(normcross/2)
    mouseY>=normcrossposY-(normcross/2)*/
    
    
}

int x=0,y=0;

boolean isInside(int x, int y)
  {
    float b0, b1, b2, b3;
    
      
      // if inside, check triangle
      b0 =  (v2X - v1X) * (v3Y - v1Y) - (v3X - v1X) * (v2Y - v1Y);
      b1 = ((v2X - x) * (v3Y - y) - (v3X - x) * (v2Y - y)) / b0;
      b2 = ((v3X - x) * (v1Y - y) - (v1X - x) * (v3Y - y)) / b0;
      b3 = ((v1X - x) * (v2Y - y) - (v2X - x) * (v1Y - y)) / b0;

      if((b1 > 0) && (b2 > 0) && (b3 > 0)) {
        return true;
        // println("b0=" + b0);
        // println(b1 + " " + b2 + " " + b3);
      } else {
        return false;
      }  
  }

void mouseReleased(){
  crossfill = norm_fill;
}


