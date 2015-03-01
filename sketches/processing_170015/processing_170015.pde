
float r;


float theta;
float theta_vel;
float theta_acc;
float x,x2,y,y2;

void setup() {
  size(1000, 800);
  
  
  r = height * 0.45;
  theta = 0;
  theta_vel = random(5);
  theta_acc = random(4);
   x = 0;
  x2 = 0;
  y = random(height/2);
  y2 = y+random(height/2);
}

void draw() {
  
  background(125,61,81);
  
  stroke(0,50);
noFill();
for(int i = 0;i <1500;i++)
{
 x+=noise(x*.01)*4-1;
 x2+=noise(x2*.01,y2*.01)*4-1;
y+=noise( x*.01,y*.01)*8-4;
y2+=noise(x2*.01,y2*.01)*8-4;
line(x,y,x2,y2);
 bezier(x,y,  x+250,y,  x2+250, y2,x2,y2); 
}

  
  translate(width/3, height/2);
  

  float x = r * cos(theta);
  float y = r * sin(theta);
  
  
  ellipseMode(CENTER);
  noStroke();
  fill(200);
  ellipse(x, y, 32, 32);
  
  
  theta_vel += theta_acc;
  theta += theta_vel;

for (int j=0; j<500; j++)
  {
    pushMatrix();
    translate(width/2, height/0.9);
    float l =random(.5,5);
    rotate (random(180));
    
    beginShape();
      for (int i=0; i<500; i++)
      {
        float n= noise (i*.01, j)*110;
        vertex ( i*l, n);
      }
      
      endShape();
      
      popMatrix();
      
  }

}

