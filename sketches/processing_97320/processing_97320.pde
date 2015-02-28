
void setup(){
  size(1000,400);
  background(255);
}
void draw(){
   background(255);
  noStroke();
  
  if(key=='3')
  {
   fill(300,100,200,80);
     strokeWeight(20);
  }
  rect(mouseX,mouseY,200,50);
  noStroke();


// triangulo
 if(key==' ')
  {
  
  }
  if(key=='4')
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
  if(key=='1')
  {
   fill(100,100,200,80);
     strokeWeight(20);
  }
   
  ellipse(mouseY+100,100,mouseX,200);
}




