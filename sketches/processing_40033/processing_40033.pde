
smooth();
size(800, 800);
background(255);
//scale(1);

for (int x=0; x<500; x += 10)
{
//  float mx = constrain(mouseX, 30, 70);
// point(x, 5);
  
  for (int y=0; y<500; y += 10)
{

  if(x % 10 == 0)
  {
  translate(40, 20);
  rect(50, y, 100, 10);
  rect(x, 50, 10, 100);
  
  }
  else{
    strokeWeight(3);
    rect(10, 10, x, y);
    
//    rotate(x-10);
  
  }
  //point(i, y);
  //line(i,y, width/3,height/3);
  strokeWeight(1);
  rect(60, 40, x, y-6);
  rect(x, y+6, x-6, y);
  //translate(-2, 4);

}
rotate(-10);
}

