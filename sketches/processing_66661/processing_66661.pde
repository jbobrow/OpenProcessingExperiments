

void setup(){
  size(400,400);
  noStroke();
  smooth();
  background(255);
  frameRate(1000);
  noFill();
  
}

void draw() {

drawCircle(40,35,30);
fill(random(50,255),random(40,200),random(70,250));

drawCircle(40,35,20);
fill(random(0,200),random(40,80),random(70,150));
drawCircle(40,35,10);
fill(random(100,255),random(50,100),random(150,250));
            }

void drawCircle(int circX, int circY, int diameter){

for (int i=0; i<width; i++){
  for(int j=0;j<height;j++){  
  
  ellipse(circX * i, circY*j, diameter, diameter);}
    }
    

}



