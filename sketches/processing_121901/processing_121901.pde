

float mean(float data[])
{
  float S = 0;
for(float n : data) S += n;
float avg = (S/data.length);
return avg;

  }
  
float test[] = {1,2,3,4,5,6,7,8,9};

void setup()
{
  println("mean "+mean(test));
  
}

void draw()
{
  text(str(mean(test)),10,50);
}


