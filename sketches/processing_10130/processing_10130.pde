
void draw()
{  
  background(66);
  stroke(200);
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }
  stroke(0,255,255);
  fill(0,160,130);
  rect(xx,yy,xxyy,xxyy);
  fill(200);
  text("Move mouse over the square to sound.\nClick mouse or push key 'q', 'w' ,'s' to change wave form.\nq = square    w = saw    s = sine"
  ,20,541);
}

