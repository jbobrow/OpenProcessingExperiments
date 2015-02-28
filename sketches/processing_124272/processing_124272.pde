
int ballCount = 30;
float[] x = new float[ballCount];
float[] y = new float[ballCount];

float[] speedX = new float[ballCount];
float[] speedY = new float[ballCount];

void setup(){
size(600,600);
frameRate(100);
  

  for (int i = 0; i<ballCount; i++) {
    x[i] = random(10, width);
    y[i] = random(10, height);
    speedX[i] = random(-2,2);
    speedY[i] = random(-2,2);
  }

}



void draw(){
background(255);

fill(0);
ellipse(300,300,200,200);

if (mousePressed) {   
for (int i = 0; i<ballCount; i++) {

   strokeWeight(2);
   randomSeed(i);
    ellipse(x[i], y[i], 10, 10);
    stroke(random(255),random(255),random(255),10);
    for(int j = 0; j<ballCount; j++){
       float d = dist(300,300,x[j],y[j]);
      stroke(0);
      line(x[i],y[i],x[j],y[j]);
      
  }

    x[i] = x[i]+speedX[i];
    y[i] = y[i]+speedY[i];

    if (x[i]>width)speedX[i] = speedX[i]*-1;
    if (x[i]<0)speedX[i] = speedX[i]*-1;
    if (y[i]>height)speedY[i] = speedY[i]*-1; 
    if (y[i]<0)speedY[i] = speedY[i]*-1;
  } 
  fill(255);
  rect(260, 340, 80, 30, 7);
  
  fill(0);
  triangle(260,300,300,300,280,355);
  triangle(280,300,320,300,300,355);
  triangle(300,300,340,300,320,355);
  
  triangle(250,400,290,400,270,355);
  triangle(270,400,310,400,290,355);
  triangle(290,400,330,400,310,355);
  triangle(310,400,350,400,330,355);
}






fill (255);
ellipse (250,300, 70,40);
ellipse (350,300, 70,40);
fill (0);
ellipse (map(mouseX,0,width,227,273), map(mouseY,0,width,287,313), 30,17);
ellipse (map(mouseX,0,width,327,373), map(mouseY,0,width,287,313), 30,17);





}
