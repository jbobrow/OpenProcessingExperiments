
int count = 0;

void setup() {
  size(500,500);
  smooth();
  background(255);
  frameRate(20);
}

void draw() { 

  noStroke();
  fill(255, 255, 255, 50);
  rect(0, 0, width, height);
translate(width/2,height/2);
rotate(count);
  for(int i = 0;i <height;i+=80){
   for(int j = 0;j <width;j+=80){
    bullshit(5,5,20,random(0,255),random(0,255),random(0,255),i,j);
   } 
  }
count++;

}

  // bullshit
  void bullshit(float circle, float thickness, float spacing, 
  float color1, float color2, float color3, 
  float xPos, float yPos) {
    
    stroke(color1,color2,color3);
    strokeWeight(thickness);
    noFill();
    for(int i=0;i<=circle;i++){
     ellipse(xPos,yPos,i*spacing,i*spacing); 
    }
  }

