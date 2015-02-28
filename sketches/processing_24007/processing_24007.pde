
void answer()
{
  if(choiceOrder==1)
  {
    if (p1Ca==true)
    {
      pScore += 1000;
      pSpeed += 0.7;
      screenSpeed += 0.2;
      den1=(int)random(2,6);
      den2=(int)random(2,6);
      getNum1 = (int)random(1,5);
      getNum2 = (int)random(1,5);
      choiceOrder = (int)random(0,3)+1;
      err1=(int)random(-3,5);
      err2=(int)random(-3,5);
      if(finishyMove)
      {
        finishy+=3000;
      }
      p1Ca=false;
    }
    else if(p1Cb==true)
    {
      pScore -=500;
      pSpeed -=2.0;
      finishy-=1500;
      p1Cb = false;
    }
    else if(p1Cc==true)
    {
      pScore -=500;
      pSpeed -=2.0;
      finishy-=1500;
      p1Cc = false;
    }
  }

  if(choiceOrder==2 && p1Cb==true)
  {
    if(p1Cb==true)
    {      
      pScore += 1000;
      pSpeed += 0.7;
      screenSpeed += 0.2;
      den1=(int)random(2,6);
      den2=(int)random(2,6);
      getNum1 = (int)random(1,5);
      getNum2 = (int)random(1,5);
      choiceOrder = (int)random(0,3)+1;
      err1=(int)random(-3,5);
      err2=(int)random(-3,5);
      if(finishyMove)
      {
        finishy+=3000;
      }
      p1Cb=false;
    }
    else if(p1Ca==true)
    {      
      pScore -=500;
      pSpeed -=2.0;
      finishy-=1500;
      p1Ca = false;
    }
    else if(p1Cc==true)
    {     
      pScore -=500;
      pSpeed -=2.0;
      finishy-=1500;
      p1Cc = false;
    }
  }

  if(choiceOrder==3)
  {
    if(p1Cc==true)
    {
      pScore += 1000;
      pSpeed += 0.7;
      screenSpeed += 0.2;
      den1=(int)random(2,6);
      den2=(int)random(2,6);
      getNum1 = (int)random(1,5);
      getNum2 = (int)random(1,5);
      choiceOrder = (int)random(0,3)+1;
      err1=(int)random(-3,5);
      err2=(int)random(-3,5);
      if(finishyMove)
      {
        finishy+=3000;
      }
      p1Cc=false;
    }
    else if(p1Ca==true)
    {
      pScore -=500;
      pSpeed -=2.0;
      finishy-=1500;
      p1Ca= false;
    }
    else if(p1Cb==true)
    {
      pScore -=500;
      pSpeed -=2.0;
      finishy-=1500;
      p1Cb= false;
    }
  }

  if(choiceOrder==1)
  {
    if(p2Ca==true)
    {
      p2Score += 1000;
      p2Speed += 0.7;
      screenSpeed += 0.2;
      den1=(int)random(2,6);
      den2=(int)random(2,6);
      getNum1 = (int)random(1,5);
      getNum2 = (int)random(1,5);
      choiceOrder = (int)random(0,3)+1;
      err1=(int)random(-3,5);
      err2=(int)random(-3,5);
      if(finishyMove)
      {
        finishy+=3000;
      }
      p2Ca=false;
    }
    else if(p2Cb==true)
    {
      p2Score -=500;
      p2Speed -= 2.0;
      finishy-=1500;
      p2Cb =false;
    }
    else if(p2Cc==true)
    {
      p2Score -=500;
      p2Speed -=2.0;
      finishy-=1500;
      p2Cc = false;
    }
  }

  if(choiceOrder==2)
  {
    if(p2Cb==true)
    {
      p2Score+=1000;
      p2Speed += 0.7;
      screenSpeed += 0.2;
      den1=(int)random(2,6);
      den2=(int)random(2,6);
      getNum1 = (int)random(1,5);
      getNum2 = (int)random(1,5);
      choiceOrder = (int)random(0,3)+1;
      err1=(int)random(-3,5);
      err2=(int)random(-3,5);
      if(finishyMove)
      {
        finishy+=3000;
      }
      p2Cb=false;
    }
    else if(p2Ca==true)
    {
      p2Score -=500;
      p2Speed -=2.0;
      finishy-=1500;
      p2Ca = false;
    }
    else if(p2Cc==true)
    {
      p2Score -=500;
      p2Speed -=2.0;
      finishy-=1500;
      p2Cc = false;
    }
  }

  if(choiceOrder==3)
  {
    if(p2Cc==true)
    {
      p2Score += 1000;
      p2Speed += 0.7;
      screenSpeed += 0.2;
      den1=(int)random(2,6);
      den2=(int)random(2,6);
      getNum1 = (int)random(1,5);
      getNum2 = (int)random(1,5);
      choiceOrder = (int)random(0,3)+1;
      err1=(int)random(-3,5);
      err2=(int)random(-3,5);
      if(finishyMove)
      {
        finishy+=3000;
      }
      p2Cc=false;
    }
    else if(p2Ca==true)
    {
      p2Score -=500;
      p2Speed -=2.0;
      finishy-=1500;
      p2Ca = false;
    }
    else if(p2Cb==true)
    {
      p2Score -=500;
      p2Speed -= 2.0;
      finishy-=1500;
      p2Cb =false;
    }
  }
}


