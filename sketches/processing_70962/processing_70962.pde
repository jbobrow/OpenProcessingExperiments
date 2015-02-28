
float myNum; 
float myNum2;


void setup(){
  smooth();
  size(800,800);

  

}


void draw(){
  println("x: "+mouseX+"y: "+mouseY);
  background(myNum/2,115,125);
  myNum++;
  myNum2++;
  noStroke();
  
  fill(150,myNum2,myNum2,20);
  quad(400,0,800,400,400,800,0,400);
  quad(400,100,700,400,400,700,100,400);
  quad(400,200,600,400,400,600,200,400);
  
  fill(random(350),myNum/2,126,35);
  ellipse(width/2,height/2,myNum,myNum);
  ellipse(0,400,myNum,myNum);
  ellipse(800,400,myNum,myNum);
  ellipse(400,0,myNum,myNum);
  ellipse(400,800,myNum,myNum);
  ellipse(800,0,myNum,myNum);
  ellipse(0,0,myNum,myNum);
  ellipse(0,800,myNum,myNum);
  ellipse(800,800,myNum,myNum);
  
  
  if(myNum > 1200){
    myNum=0;

  }
  
  
    
}
  


  

