
PFont font;

void setup() {
  size(950, 820, P3D);
  noCursor();
  
  font = createFont("Helvetica", 60);
  textFont(font);
  smooth();
}

void draw() {
//  background(0);
fill(151,200,0,60);
rect(width,height,width,height);
   pushMatrix();
  noStroke();
// camera(360, height/2, (width/2) / tan(PI/4.5), mouseX, mouseY, 2, height/2, 1, 1);

directionalLight(126, 106, 200, 0, 0, -1);
ambientLight(mouseX, 102, 102);
camera(mouseX, mouseY, mouseX, width/3, height/2, 2.0,
       1.0, 1.0, 1.0);
  
translate(300, 400, 0); //pink rectangle
rotateY(1);
rotateX(5);
fill(mouseX, 50, 190);
box(width/2, 200, 200);
  shininess(5.0);

translate(500, 700, 1); //orange box1
//rotateY(1);
//rotateX(3);
 rotateX(frameCount*PI/185);
  rotateY(frameCount*PI/-200);
fill(mouseX,mouseY,10);
box(width/2, 300, 200);
 
translate(500, 425, 12);//box2
rotateY(1);
rotateX(5);
fill(mouseY,mouseX+1,255);
box(width/2, 500, 200);
  shininess(5.0);
  
translate(270, 600, 0);
fill(mouseY,31,255);
sphere(300);

 rotateX(frameCount*PI/150);
 rotateY(frameCount*PI/-180);
fill(26, 255, 238);
  text("I had something to say",200,300);
  
   rotateX(frameCount*PI/390);
  rotateY(frameCount*PI/-100);
  fill(256, 113, mouseX);
  text("But it left me as soon as it came",400,700);
  popMatrix();
}


