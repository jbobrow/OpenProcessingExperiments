
void rectangle(int x, int y)
{

  rect(x, y + 0, 50, 50);
  fill(0);
  
  

int a = 0;
for(int i = 0; i < 400; i += 50) {
  a = (i < 0) ? 0 : 255;
  stroke(a);
  line(i, 0, i, 400);
}

int b = 0;
for (int i = 0; i < 400; i += 50) {
  b = (i < 0) ? 0 : 255;
  stroke(b);
  line(0, i, 400, i);
}
}
void setup()
{
  size(400, 400);
  background(255);
  for (int i = 50; i < 450; i = i + 100)
  {
    fill(0);
    rectangle(i, 0);
    
    fill(0);
    rectangle(i, 100);
    
    fill(0);
    rectangle(i, 200);
    
    fill(0);
    rectangle(i, 300);
    
    fill(0);
    rectangle(i, 400);
    
    fill(0);
     rectangle(0, i);
     
     fill(0);
     rectangle(100, i);
     
     fill(0);
     rectangle(200, i);
     
     fill(0);
     rectangle(300, i);
    
  }
}





