
void drawLine()
{
      prob = mouseX/float(width);
      println(prob);
      r1=random(0, 1);
      println(r1);
      
      if(r1 < prob)
      {
          if(value==1)
          {
              stroke(225, 225, 225, 10);
          }
          else
          {
              stroke(255);
          }
      }
      
      else
      {
          if(value==1)
          {  
              stroke(225, 54, 100, 10);
          }
          else
          {
              stroke(225, 54, 100);
          }
          println("red");
      }
      
      res=random(0, height);
      sum+=res;
      count++;
      res=sum/count;
      line(count, pres, count+1, res);
      pres = res;
      if(value2==1)
      {
          if(count>width)
          {
              background(52);
          }
      }
      if(count>width)
      {
          reset();
      }
}

void reset()
{
    sum = 0;
    count = 0;
}
         

