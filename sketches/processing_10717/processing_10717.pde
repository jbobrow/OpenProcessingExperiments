
/**
 * Studienarbeit Generatives Design
 * Thema: Zufall
 * Titel der Studienarbeit: (Don't) Stop & Stare
 * Stimulates Neuron Wave Patterns (and drives people slightly nuts)
 * 
 * Concocted 26 June 2010 by Andreas Augustin
 */

int unit = 40;
int count;
PVector[] stars;

float cubeNum = 25;
float gutter = 10;
float cubeW;
int starCount=1000;
color oColA;
color oColB;
color oColC;
color oColD;

void setup() {
  size(800, 600,P3D);
  background(176);
  noStroke();

  cubeW=(width/cubeNum)-gutter;

  int wideCount = width*4 / unit;
  int highCount = height*4 / unit;
  count = wideCount * highCount;
  stars = new PVector[starCount];

  for (int index=0;index<starCount;index++){
    stars[index]=new PVector(random(width*4)-width*2,random(height*2)-height,random(width*2)-width*2);
  }

  oColA=color(random(255),random(255),random(255));
  oColB=color(random(255),random(255),random(255));
  oColC=color(random(255),random(255),random(255));
  oColD=color(random(255),random(255),random(255));
}

void board()
{
  translate(((cubeW+gutter)*cubeNum-gutter)/2,((cubeW+gutter)*cubeNum-gutter)/2);
  rotate(PI*((float)mouseX/width));
  translate(gutter/2,gutter/2);
  translate(0,-((cubeW+gutter)*cubeNum-gutter)/2,0);
  oColA=lerpColor(oColA,color(random(255),random(255),random(255)),0.05);
  oColB=lerpColor(oColB,color(random(255),random(255),random(255)),0.05);
  oColC=lerpColor(oColC,color(random(255),random(255),random(255)),0.05);
  oColD=lerpColor(oColD,color(random(255),random(255),random(255)),0.05);

  fill(255);
  noStroke();
  for (int z=0;z<cubeNum;z++){
    color rowColA=lerpColor(oColA,oColC,(float)z/cubeNum);
    color rowColB=lerpColor(oColB,oColD,(float)z/cubeNum);    
    pushMatrix();
    translate(-((cubeW+gutter)*cubeNum-gutter)/2,0,0);
    for (int x=0;x<cubeNum;x++){
      pushMatrix();
      float amp=(float)(2 * cos((float)(x * x + z * z - millis()%6000/1000.0) )*10);
      translate(0,0, amp);
      translate(0,0,sin(2*PI/((float)cubeNum/x)*millis()%6000/1000)*5+cos(2*PI/((float)cubeNum/z)*millis()%6000/1000)*5);
      fill(lerpColor(rowColA,rowColB,(float)(2 * cos((float)(x * x + z * z - millis()%1024/1000.0) ))));
      box(cubeW);
      popMatrix();
      translate(cubeW+gutter, 0, 0); 

    }
    popMatrix();
    translate (0,cubeW+gutter,0);
  } 
}

void drawStars(){
  noFill();
  for (int i=0;i<starCount;i++){
    point( stars[i].x,stars[i].y,stars[i].z);
  } 
}


void draw() {
  background(10,10,10,180);
  directionalLight(255,255, 255, 0, 10, -10);
  stroke(100,100,100);
  ambientLight(brightness(oColA)/8,brightness(oColA)/8,brightness(oColA)/8);

  drawStars();
  fill(200);
  translate(0,0,-300);

//Top
  pushMatrix();
  rotateX(PI*((float)mouseY/height));
  translate(0,-height/2,0);
  rotateX(-PI/2.0);
  stroke(255);
  drawStars();
  board();
  popMatrix();


//Left
  pushMatrix();
  rotateX(PI*((float)mouseY/height));
  translate(0,-height/2,0);
  rotateY(PI/2.0);
  board();
  popMatrix();
  

//Right
  pushMatrix();
  rotateX(PI*((float)mouseY/height));
  translate(width,-height/2,0);
  rotateY(PI/2.0);
  board();
  popMatrix();
  
//Middle
  pushMatrix();
  rotateX(-PI*((float)mouseY/height));
  translate(0,height/2,0);
  rotateX(-PI/2.0);
  board();
  popMatrix();
  
}



