
void setup(){
  size(800,400);
}

void draw(){
  
 
  //sun
  stroke(255,255,0);
  println(mouseX);
  if(mouseX<=200){
    background(20,120,200);
    fill(255,255,0);
    ellipse(400,100,70,70);
  }else if(mouseX>200 && mouseX<=400){
    background(50,120,200);
    fill(220,220,0);
    ellipse(400,100,60,60);
  }else if(mouseX>400 && mouseX<=600){
    background(100,70,130);
    fill(190,190,0);
    ellipse(400,100,50,50);
  }else{
    background(50,50,50);
    fill(100,100,0);
    ellipse(400,100,40,40);
  }
  
  //sand
  fill(255,255,250);
  rect(0,300,800,100);
  
  //purple
  noStroke();
  fill(100,20,200);
  triangle(0,300,50,200,100,300);
  triangle(100,300,200,150,300,300);
  triangle(300,300,350,200,400,300);
  triangle(400,300,450,200,500,300);
  triangle(500,300,600,150,700,300);
  triangle(700,300,750,200,800,300);
  triangle(800,300,850,200,900,300);
  

}

