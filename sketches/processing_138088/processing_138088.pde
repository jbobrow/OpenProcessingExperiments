
float r=random(10);
  int x=0;
  int speed=5;
  int y=0;
  
  void setup(){
  size(800,400);
  smooth();
  noStroke();

  background(135,206,250);
  
}  
  void draw(){

  
  //sun
  frameRate(15);
  noStroke();
  smooth();
  background(135,206,250);
  fill(255,255,r);
   ellipse(x+20,120,110,110);
  x=x+speed;
    if ((x<0)||(x>=800)){
    speed=speed*-1;
    }
 if (mousePressed==true){
   for (int i=0; i<400;i=i+20){
      fill(255);
      background(0);
      ellipse(x+20,100,40,40);
     
      
      

   }  
   }
     //mountains
  fill(255);
  triangle(-100,400,200,200,400,400);
  triangle(200,400,450,250,700,400);
  triangle(500,400,700,200,900,400);
   }

