
WindMill[] windmill;


void setup(){
size(700, 700, P3D);
windmill = new WindMill[0];
}
 
void draw() {
  background(227, 250, 250);
  noStroke();
  if (windmill != null) {
  for(int i=0; i<windmill.length; i++){
  windmill[i].move();  
  windmill[i].display();
  }
  }
}
  
void mouseClicked() { 
noStroke();
   
WindMill myWindMill = new WindMill(mouseX, mouseY);
windmill = (WindMill[]) append(windmill, myWindMill);
}


class  WindMill {
 
int cx; //center point for x
int cy; //center point for y
int cxShadow;
int cyShadow;
int shadow;
int howMany;
float critterSize;
float theta1;
float theta2;
float theta3;


 WindMill(int centerX, int centerY) {
    cx = centerX;
    cy = centerY;
    cxShadow = 5;
    cyShadow = 8;
    shadow = color(150, 100);
    critterSize=random(.6,1);
    theta1 = 0;
    theta2 = 0;
    theta3 = 0;
    
    
}
 
    
void display() {

//WINDMILL
  
  pushMatrix();
  translate(cx, cy); //center point
  scale(critterSize);
  //stroke(shadow);
  //strokeWeight(3);


rotate(theta3);
fill(89, 91, 124); //bottom purple layer
howMany = int(1);
  for (int i = 0; i < howMany; i++) {
triangle(0, 0, 0-40, 0-60, 0, 0-40);
triangle(0, 0, 0+40, 0-80, 0+30, 0-10);
triangle(0, 0, 0+40, 0+60, 0, 0+40);
triangle(0, 0, 0-60, 0+60, 0-40, 0); 
}

rotate(theta3);
fill(shadow); //bottom purple layer SHADOW
howMany = int(1);
  for (int i = 0; i < howMany; i++) {
triangle(5, 8, 0-35, 0-52, 5, 0-32);
triangle(5, 8, 0+45, 0-72, 0+35, 0-2);
triangle(5, 8, 0+45, 0+68, 5, 0+48);
triangle(5, 8, 0-55, 0+68, 0-35, 8); 
}

fill(244, 116, 71, 200); //middle orange layer
rotate(theta2);
howMany = int(1);
  for (int i = 0; i < howMany; i++) {
triangle(0, 0, 0-60, 0-65, 0-5, 0-30);
triangle(0, 0, 0+30, 0-70, 0+40, 0-25);
triangle(0, 0, 0+50, 0+55, 0-10, 0+30);
triangle(0, 0, 0-45, 0+55, 0-30, 0-5);
}

fill(shadow); //middle orange layer SHADOW
rotate(theta2);
howMany = int(1);
  for (int i = 0; i < howMany; i++) {
triangle(5, 8, 0-50, 0-52, 5, 0-17);
triangle(5, 8, 0+35, 0-62, 0+45, 0-17);
triangle(5, 8, 0+55, 0+63, 0-5, 0+38);
triangle(5, 8, 0-40, 0+63, 0-25, 3);
}


rotate(theta1);
fill(234, 237, 108, 120); //yellow top layer
howMany = int(1);
  for (int i = 0; i < howMany; i++) {
triangle(0, 0, 0-45, 0-25, 0-10, 0-23);
triangle(0, 0, 0+37, 0+27, 0+5, 0+25);
}

rotate(theta1);
fill(shadow); //yellow top layer SHADOW
howMany = int(1);
  for (int i = 0; i < howMany; i++) {
triangle(5, 8, 0-40, 0-17, 0-5, 0-15);
triangle(5, 8, 0+42, 0+35, 0+10, 0+33);
}


translate(-cx,-cy);
popMatrix();

theta1 += 0.03; //speed for yellow
theta2 += 0.01; //speed for orange
theta3 += 0.02; //speed for purple

}

void move() {
if (cx < width+65) {
  cx++;

}
else {
  cx = 0;
}
}
}



