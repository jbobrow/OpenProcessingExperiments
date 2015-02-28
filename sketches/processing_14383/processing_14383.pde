
int col;
int f;
int offset = 10;
float x;
void setup() {
 size(600,600);
 background(255);
  x =width/2;
 //quad(120,200,200,120,280,200,200,280);
 smooth();
 fill(220);
 quad(120,200,200,120,280,200,200,280);
  //straightline
  smooth();
  line(0,280,200,280);
strokeWeight(1);
 line(400,120,520,0);
 line(200,340,100,440);
strokeWeight(5);
  line(0,500,500,0);
  strokeWeight(3);
  line(200,100,500,400);
  strokeWeight(1);
smooth();
noFill();
}
void draw(){ 
background(255); 
fill(220);
quad(120,200,200,120,280,200,200,280);


 //straightline
smooth();
line(0,280,200,280);
strokeWeight(1);
line(400,120,520,0);
line(200,340,100,440);
strokeWeight(5);
line(0,500,500,0);
strokeWeight(3);
line(200,100,500,400);
strokeWeight(2);

//cross view
if (mousePressed && insideQuad (200,340,300,240,380,320,280,420)) 
 {  fill(255);
 strokeWeight(4);
 stroke(255,234,0);
   beginShape();
vertex(500,400);
vertex(500,380);
vertex(520,380);
vertex(520,400);
vertex(540,400);
vertex(540,420);
vertex(520,420);
vertex(520,440);
vertex(500,440);
vertex(500,420);
vertex(480,420);
vertex(480,400);
vertex(500,400);
endShape();}
fill(70);
strokeWeight(0.5);
quad(200,340,300,240,380,320,280,420);

 //triangle key operation 
if (keyPressed == true) 
{fill(220);smooth();fill(237,20,23); quad(120,200,200,120,280,200,200,280);}
else{fill(255);stroke(0);smooth(); ellipse(200,200,110,110);}
  
//triangle mouse operation
fill(150);
if (mousePressed && insideTriangle(240,80,420,60,320,160)) 
  fill(0,81,255);
triangle(240,80,420,60,320,160);
  smooth();
//quad mouse operation
if (mousePressed && insideQuad (320,200,400,120,540,260,460,340)) {f = 255;}
  else { f= 200; }
  fill(f);
  quad(320,200,400,120,540,260,460,340);
  //find the cursor  
  if (mouseX > x) {
    x += 0.5;
    offset = -10;
  }
  if (mouseX < x) {
    x -=0.5;
    offset =10;
  }
  line(x, 0,x,height);
  line(mouseX,mouseY,mouseX + offset, mouseY - 10);
  line(mouseX,mouseY,mouseX + offset, mouseY + 10);
  line(mouseX,mouseY,mouseX + offset*3,mouseY);
}

boolean insideQuad(float a0, float b0, float a1, float b1, float a2, float b2, float a3, float b3) {
return insideTriangle(a0, b0, a1, b1, a2, b2) || insideTriangle(a2, b2, a3, b3, a0, b0);}
boolean insideTriangle(float a0, float b0, float a1, float b1, float a2, float b2) {

  // Compute vectors        
  float da0 = a1 - a0;
  float db0 = b1 - b0;

  float da1 = a2 - a0;
  float db1 = b2 - b0;

  float da2 = mouseX - a0;
  float db2 = mouseY - b0;

  // Compute dot products
  float dt00 = da0 * da0 + db0 * db0;
  float dt01 = da0 * da1 + db0 * db1;
  float dt02 = da0 * da2 + db0 * db2;
  float dt11 = da1 * da1 + db1 * db1;
  float dt12 = da1 * da2 + db1 * db2;

  // Compute barycentric coordinates
  float invDenom = 1.0f / (dt00 * dt11 - dt01 * dt01);
  float w = (dt11 * dt02 - dt01 * dt12) * invDenom;
  float z = (dt00 * dt12 - dt01 * dt02) * invDenom;

  // Check if point is in triangle
  return (w > 0) && (z > 0) && (w + z < 1);
}



