
//variables
int x = 285;
int y = 330;
int radius = 270;
int eyeradius=45;

void setup(){
  size(570,660);
  smooth();
    //background
  noFill();
  background(222,156,83);
  stroke(222,211,140);
  strokeWeight(20);
  for (int i=10;i<=900;i=i+90){
    ellipse(x,y-30,i,i);
  }
   
   //body
  noStroke();
  fill(137,190,178);
  ellipseMode(CENTER);
  ellipse(x/2+15,y/2+60,radius,radius);
  ellipse(x*3/2-15,y/2+60,radius,radius);
  arc(x,y/2+45,radius*2-25,radius*2+20, radians(0),radians(180));
  
  //left eye
  fill(130,57,53);
  ellipse(x/2+15,y-20,eyeradius,eyeradius);
   
//right eye
  fill(130,57,53);
  ellipse(x+x/2-15,y-20,eyeradius,eyeradius);
 
  //nose
  fill(130,57,53);
  ellipse(x,y+45,eyeradius+50,eyeradius);
  }
 
void draw(){
  float d = dist(mouseX,mouseY,x+x/2-15,y-20);
  float e = dist(mouseX,mouseY,x/2+15,y-20); 
  
  
  if (d<eyeradius) {
    if (mousePressed) {
      fill(130,57,53, 10);
      ellipse(mouseX,mouseY,15,15);
    }
  }
  
    if(e<eyeradius+30){
    if(mousePressed){
      for(int i =10 ; i>0; i-=10){
        for(int j = 0;j<100;j+=30){
          smooth();
          fill(130,57,53, i);
          ellipse(mouseX,mouseY,j,j);
        }
      }
    }
  }
      
}


