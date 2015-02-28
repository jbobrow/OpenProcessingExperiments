
void setup(){
  size(500,500);
  background(0);
}
void draw(){
   background(0);
  noStroke();
   
  if(key=='1')
  {
   fill(300,0,200,80);
     strokeWeight(20);
  }
 ellipse(mouseX,mouseY,150,50);
  noStroke();
 
 
// triangulo
 if(key==' ')
  {
   
  }
  if(key=='2')
  {
    if(mouseX <= 300)
    {
      fill(80,60,200,80);
       triangle(30, 75, 58, 20, 86, 75);
    }
    else
    {
     fill(0,100,200,80);
     strokeWeight(20);
     triangle(mouseY,20,mouseX,300,-mouseX,-mouseY);
   
    }
  }
 
// 
  if(key==' ')
  {
     fill(255,255,255);
       strokeWeight(10);
  }
  if(key=='3')
  {
   fill(50,75,200,200);
     strokeWeight(5);
  }
    
  rect(mouseY+25,10,mouseX,200);
}


