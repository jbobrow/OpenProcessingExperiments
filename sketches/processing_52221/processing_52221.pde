
float circleSpeed;
float rotSpeed;
int numRot = 10;
float [][] lightColors = {{255, 0, 0}, {255, 0, 0}, {0, 255, 0}, {0, 0, 255}};

int row1Y= 30;
int row2Y= 560;
int lightRad= 5;

PFont font;

void setup() {
  
  size(600, 600, P3D);
  lights();
  font = loadFont("AndaleMono-100.vlw");
  
  
}



void draw() {
  background(0);
  
  strokeWeight(100);
  stroke(78);
  line(250, -400, -300, 250, height+400, -300);
  strokeWeight(1);
  
  pointLight(lightColors[0][0], lightColors[0][1], lightColors[0][2], 0, 0, 600);
  pointLight(lightColors[1][0], lightColors[1][1], lightColors[1][2], 300, 0, 600);
  pointLight(lightColors[2][0], lightColors[2][1], lightColors[2][2], -300, 0, 400);
  pointLight(lightColors[3][0], lightColors[3][1], lightColors[3][2], 300, 0, -400);
 
  circleSpeed += .4;
  rotSpeed= .2;
  translate(250, -50, -100);
  rotateY(PI*radians(circleSpeed));
  
  
  for(int i=0; i < numRot; i++) {
  pushMatrix();
  
  translate(width/2, height/2);
  rotateY(rotSpeed);
  box(150);
  stroke(78);
  strokeWeight(20);
  line(0,0, 0, -290, -50, -100);
  strokeWeight(1);
  popMatrix();
  
  }
  
  
  
  if (mousePressed==true) {
    
    
  
    
    for (int a=0; a<3; a++) {
      for(int b=0; b<3; b++){
      lightColors[a][b] = random(0,200);
      }}
   
   for(int i=0; i < numRot; i++) {
      pushMatrix();
      background(0);
      translate(width/2, height/2);
      rotateY(5*frameCount);
      rotateX(.75*frameCount);
      rotateZ(2*frameCount);
      box(150);
      popMatrix();
 
      }
      
  textFont(font);
  fill(255);
  text("FUN!", 0, 600, 0); 

  }
}

