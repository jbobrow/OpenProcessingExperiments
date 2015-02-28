
void setup(){
size (500,400);
noStroke();
smooth();
//noFill();
 fill(255,random(50,60));
 background(0);



}

void draw(){
  background(0);
  for(int i=mouseX+50;i<=250;i++){
   

    float mario=frameCount/1000.0;
    bezier(width/2,height,
  noise(1,i,mario)*mouseX,noise(2,i,mario)*mouseY,
  noise(3,i,mario)*width, noise(4,i,mario)*height/2,
  noise(5,i,mario)*width, noise(6,i,mario)*height);


  }
}
