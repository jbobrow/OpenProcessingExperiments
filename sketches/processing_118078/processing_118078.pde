
float angle = 0;
float xnoise = random(15);
float ynoise = random(15);

void setup() {
  
  size(450,450);
  frameRate(8);
  
}

void draw() {
  background(0);
  
  for(float i =1; i<250;i++) {
    pushMatrix();
    translate(width/2,height/2);
   float col = (noise(ynoise)*i)/2;
   float rad = noise(xnoise)*angle*0.5;
    scale(1/(i/angle*180),1/(i/angle*180));
    rotate(radians(i*rad));
    strokeWeight(0.25);
    stroke(255);
    
   fill(col+i,col+5*i,col+140,45);
   ellipse(0,0,2*i,3*i);
   triangle(0,0,20,10,25,50);
   rect(200,100,25,50);
   stroke(255,70);
   line(rad,col,250,500);
   
    popMatrix();
    angle+=0.2;
  }

}
