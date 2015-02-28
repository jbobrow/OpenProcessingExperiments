
size(600, 600);
background(50);
strokeWeight(2);
int sides = 100;
int radiand = width/4 - 20;
float rotation = 0;

//top right to middle fill
noStroke();
fill(200);
beginShape();
vertex(width, 0);
  vertex(0,0);
bezierVertex(width-width/20, 0, width-width/20, height, width, height);

endShape(CLOSE);

  //back straight lines
for (int i = width/10; i<width*height; i+=(width+height)/100) {
  strokeCap(SQUARE);
  stroke(175);
      line(i+i, 0, i, i);
}


//almond shape
fill(100);
stroke(0);
beginShape();
vertex(0,0);
bezierVertex(width-width/20, 0, width-width/20, height, width, height);
vertex(width, height);
bezierVertex(width/5, height,width/5, 0, 0,0);
endShape(CLOSE);

//secondary curves
beginShape();
for (int h = 0; h<width/1.3; h+=15) {
  noFill();
bezier(0,0, width-h-width/20, 0, width-h-width/20, width, width, height);
}
endShape();
/************************************/




//Mesh curves
for (int i = 1; i<width*height; i+=(width+height)/100) {

  //Top Curve mesh
  for (int strokeColor = 0; strokeColor>=0 && strokeColor <=255; strokeColor+=10) {
    stroke(strokeColor);
  } 
      line(0, i, i, width);
stroke(0);      
  for (int strokeColor2 = 255; strokeColor2>=0 && strokeColor2 <=255; strokeColor2-=10) {
    stroke(strokeColor2);
  } 
      line(0, i, i, width);
stroke(255);  
//bottom curve mesh

    for (int strokeColor4 = 255; strokeColor4>=0 && strokeColor4 <=255; strokeColor4-=10) {
    stroke(strokeColor4);
  } 
      line(width, i, i, 0);
stroke(0);
      
  for (int strokeColor3 = 0; strokeColor3>=0 && strokeColor3 <=255; strokeColor3+=10) {
    stroke(strokeColor3);
  } 
      line(i, 0, width, i);
stroke(255);
              

}

//star in center2
stroke(0);
fill(30);
beginShape(TRIANGLE_FAN);
vertex(width/9,height-height/9);
  for (int x = 0; x < sides; x++) {
      float rf= 1;
  if(x%2==0) {
    rf = 1.0;
  } else {
    rf = 0.5;
  }
    float theta = TWO_PI*x/sides;
    float w = rf * radiand * sin(theta+rotation) + width/2;
    float y = rf * radiand * cos(theta+rotation) + height/2;
    vertex(w, y);
  }

endShape();

//star in center
stroke(0);
fill(30);
beginShape(TRIANGLE_FAN);
vertex(width/9, height-height/9);
  for (int x = 0; x < sides/2.7; x++) {
      float rf= 1;
  if(x%2==0) {
    rf = 1.0;
  } else {
    rf = 0.5;
  }
    float theta = TWO_PI*x/sides;
    float w = rf * radiand * cos(theta+rotation) + width/2;
    float y = rf * radiand * sin(theta+rotation) + height/2;
    vertex(w, y);
  }

endShape();





