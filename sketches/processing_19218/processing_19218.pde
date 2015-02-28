
int dis;
void setup(){
  size(500,500);
  noFill();
  smooth();
  frameRate(30);

}
void draw(){


  background(128);
  strokeWeight(1);

  if (keyPressed)  {
    if (key == 'a') {
      dis=dis+10;      
    }
  }
    if (keyPressed)  {
    if (key == 'd') {
      dis=dis-10;      
    }
  }
  for(int i=10;i<dis;i=i+5){
    stroke(0,random(255),random(255));

    ellipse(width/2,height/2,i,i);

  }




  strokeWeight(3);
  for(int a=50; a<500;a=a+50){
    stroke(255,random(60),0);
    line(0,a,500,a);
  }
  for(int b=50; b<500;b=b+50){
    stroke(255,random(60),0);
    line(b,0,b,500);
  }


}




//a= aumenta
//d= diminui                
