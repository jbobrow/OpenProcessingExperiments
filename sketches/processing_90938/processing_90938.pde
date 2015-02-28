
int [] CustomArray = {30,50,70,90,110};

void setup()
{size(200,200);
}

void draw()
{
   BorderLines();
  for(int i = 0; i < CustomArray.length; i++) // for loop!
{
  fill(CustomArray[i],255 - CustomArray[i],0);
  rect(CustomArray[i], height/2, 10,15);
  if(mouseX <= 20)
  { fill(CustomArray[i],0,0);
    rect(CustomArray[i], height/2, 10,15);
  }
  else if(mouseX >= 180)
  { fill(CustomArray[i],0,255 - CustomArray[i]);
    rect(CustomArray[i], height/2, 10,15);
  }
  else if(mouseY >= 180)
  { fill(0,0,CustomArray[i]);
    rect(CustomArray[i], height/2, 10,15);
  }
  else
  { fill(255);
    rect(CustomArray[i], height/2, 10,15);
  }

}
}

void BorderLines()
{
  fill(0);
  rect(0,0,width/10,height); //left border
  rect(180,0,width/10,height); //right border
  rect(0,180, width, width/10);
}
