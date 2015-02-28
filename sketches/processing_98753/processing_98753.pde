
float theta = radians(60);
float x,y;
float dia;

void setup() {
  size(1000,800);
 
  background(0);
  translate(width/2,height/2);
  smooth();
 
  drawTriangle(x,y,width/2);
  drawtree(width,height/2,width);
// branch1(120);
  
}



void draw() {
  frameRate(10);
 
  //stroke(250,100,frameRate);
   
  drawtree(x-dia,y,dia);
  
  drawTriangle(x-dia,y,dia/2);
  //background(0);
   strokeWeight(4);
 translate(width/2,height);
// rotate(50);
  //fill(200,100,200);
  branch(200,radians(20));


}

void drawTriangle(float x, float y, float dia){
  noStroke();
  x *= 0.90+ (.9);
  y *= 0.8*noise(x*10);
 // dia *= 1.5; 
  //ellipse(x, (y*PI/4),dia/2,dia/2);

}
void drawtree(float x1, float y1, float dia1){
  noStroke();
  x1 *= 0.6+ (.9);
  y1 *= 0.8*x;
 dia1 *= 4; 
  ellipse(x1, (y1*4),dia1/2,dia1);

}
void branch(float len, float len2) {
 // float a =(mouseX/(float)width);
  //theta =  radians(a);
  len *= 0.7+random(.4);
    len2 *= 0.66;
    
   fill(random(220),random(100),120,150);  
   ellipse(x*100, (y*PI/4),len/2,len/2);  
  stroke(0,50,120);
  strokeWeight(len2*30);
  //rotate(90);
  fill(0,0,20);
  line(0,0,0,-len);
  translate(0,-len);
  //rotate(theta*180);
  
  
 
  if (len > 10) { // no inf. loop

    strokeWeight(len2*2);
    pushMatrix();
    rotate(-theta);
    branch(len*.65,len2*.4);
    popMatrix();

    pushMatrix();
    rotate(theta/1.25);
    branch(len*.75,len2*.2);
    popMatrix();
    
     pushMatrix();
    rotate(random(-theta*20));
    stroke(len,200,0);
    branch(len*.20,len2*.3);
    popMatrix();
    
     pushMatrix();
    rotate(20);
    stroke(len,200,0);
    branch(len*.20,len2*.2);
    popMatrix();
    
     pushMatrix();
    rotate(0);
    stroke(len,200,300);
    branch(len*.4,len2*.5);
    popMatrix();
  }
}
 
