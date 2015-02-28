
//HW#9-Arrays
//Joshua Chang
//jmc1 Copyright 2012


//Global
 int[] Numeros ={19,100,12,23,23,34,63,78,4,35,6,8,7,9};
 float Sum =ArraySum();
 float Number=Numeros.length;
 float Average=Sum/Number;

void setup()
{
  textSize(20);
 textAlign(CENTER);
 size(400,400); 
 background(110,130,210);
 
}

void draw()
{
 ArrayLength();
//line(0,width/2,width,width/2);
//line(width/2,0,width/2,width);
text("Array Sum: "+ArraySum(),width/2,2*height/5);
Average();
Compute();
//saveFrame("HW9_Array.jpg");
}

void ArrayLength()
{
text("Number of Elements in Array: "+Numeros.length,width/2,height/5);
}

int ArraySum()
{
  int sum=0;
  for(int i=0;i<Numeros.length;i++)
  {
  sum+= Numeros[i];
  }
  return sum; 
}

void Average()
{
 text ("Array Average: "+Average,width/2,3*height/5);
}

void Compute()
{
  int ComputeAdd =0;
 
 for (int i=0; i<Numeros.length;i++)
 {   
  if (Numeros[i]>=Average)
 {
  ComputeAdd+=Numeros[i];
 }
 }

 text("Numbers Greater Than Average Sum: "+ComputeAdd,width/8,5*height/7,3*width/4,height/3);
}



