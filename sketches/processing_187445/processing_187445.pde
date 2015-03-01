
//float a = random(255);

void setup(){
size(1600,900);
//background(255);
noFill();
}
void draw(){
  float a= random(20,25);
  background(255);
for(int i=5;i < width; i= i+30){
  for(int j=10; j<height; j= j+40){
    strokeWeight(4);
    stroke(random(38,40),random(40,255),random(40,200));
    ellipse(i,j,50,50);
  }
}
for(int k= 0; k < width; k= k+10){
  for(int l= 0; l< height; l= l+10){
    strokeWeight(.5);
    stroke(0);
    ellipse(k,l,a,a);
    
  }
}
    
}


