
//Assignment # 3
//Tara Chatterjee
//tchatterje@brynmawr.edu
//9/23/10

float x,y,h,w;

void setup(){
  background(0);
  smooth();
  size(500,500);
  
  for(int a=0; a < 50; a++){
    drawBat(random(400), random(450), random(75)+20);
  }

}

void draw(){}

void drawBat(float x, float y, float h){
  w = 2*h;
  noStroke();
  fill(random(255),random(255),random(255),random(255)); 
    beginShape();
      curveVertex (0+x,h+y);
      curveVertex (0+x,h+y);               //bottom of left wing
      curveVertex ((w/20)+x,(h/5)+y);
      curveVertex ((w*7)/20+x,(h/2)+y);
      curveVertex ((2*w)/5+x, ((h*3)/20)+y);
      curveVertex (w*0.42+x,(h*0.07)+y);    // left ear
      curveVertex (w/2+x,((h*3)/10)+y);
      curveVertex (w*0.57+x,(h*0.07)+y);    // right ear
      curveVertex ((3*w)/5+x,(h*0.15)+y);
      curveVertex ((w*13/20)+x,(h/2)+y);
      curveVertex ((19*w)/20+x,(h/5)+y);
      curveVertex (w+x,h+y);                //bottom right wing
      curveVertex ((4*w)/5+x,((7* h)/10)+y);
      curveVertex ((7*w)/10+x,((4*h)/5)+y);
      curveVertex ((3*w)/5+x,((7*h)/10)+y);
      curveVertex (w/2+x,((9*h)/10)+y);      // middle bump on bottom
      curveVertex ((2*w)/5+x,((7*h)/10)+y);
      curveVertex ((3*w)/10+x,((4*h)/5)+y);
      curveVertex (w/5+x,((7*h)/10)+y);
      curveVertex (0+x,h+y);
      curveVertex (0+x,h+y);
      endShape(CLOSE);
}

void mousePressed(){
  for(int b=0; b<25; b++){
    drawBat(random(400), random(450), random(75)+20);
  }
}

