
float theta = 0.0;

void setup(){
size(500,500);
smooth();
}

void draw(){
background(0,0,255);

float a = (sin(theta)+1)*12.5;
float b = (sin(theta)+1)*12.5;


 theta += 0.05; 
 
for(int x = 25 ; x < width; x+=25){
  for(int y = 25; y < height; y+=25){
    fill(255,0,0);
    ellipse(x,y,a,b);
    noStroke();
    fill(100,0,0);
    ellipse(x,y,a/2,b/2);
  }
}
}


