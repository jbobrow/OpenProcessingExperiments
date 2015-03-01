
//void setup(){
  //size(500,500);}
//void draw(){
  //background(255);
   //stroke(255);
  //for (float i=500;i>0;i=i-50){
    //fill(random(100),random(100),200);
    //ellipse(width/2, height/2,i,i);//}//} 
 
 
 void setup() {size(600,600);
 colorMode(HSB);
  }
 void draw() {
 background(random(80),random(100),200);
   
for (float a=0;a<mouseX;a=a+2){
  fill(0,0,random(100));
  ellipse(a*6,200,a,a);
  fill(0,random(100),random(100));
  ellipse(a*7,50,a,a);
  fill(255);
  ellipse(a*7,100,a,a);
   }
  for (int a=width;a>mouseX;a=a-5){
  stroke(random(100));
  fill(random(100),random(100),100,50);
  ellipse(a*2,400,a,a); 
  fill(255);
  ellipse(a*2,500,a,a);
  }
  
  for (float b= 0;b<1000; b=b+1){
    strokeWeight(random(5));
    point(random(width), random(height));     
 }
}


 
