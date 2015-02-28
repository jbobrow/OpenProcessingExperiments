
private Map<Integer, Integer> fiboMap= new HashMap<Integer,Integer>();
void setup()
{
  final int opacity_coefficient = 12;
  size(400,400);
  background(255,105,180);
  stroke(255,0,0);
  for (int k=1; k<20; k++){
    fill(0,255,255, 255-k*opacity_coefficient);
    quad(0,0,0,fibo(k)/10, fibo(k)/10,fibo(k)/10,fibo(k)/10,0);
  }
  
  for (int k=1; k<20; k++){
    fill(255,205,0, 255-k*opacity_coefficient);
    quad(400,400,400,400-fibo(k)/10, 400-fibo(k)/10,400-fibo(k)/10,
      400-fibo(k)/10,400);
  }
  
  for (int k=1; k<20; k++){
    fill(255,0,255, 255-k*opacity_coefficient);
    quad(0,400,0,400-fibo(k)/10, fibo(k)/10,400-fibo(k)/10,
      fibo(k)/10,400);
  }
  for (int k=1; k<20; k++){
  fill(0,0,0, 255-k*opacity_coefficient);
  quad(400,0,400-fibo(k)/10,0, 400-fibo(k)/10,fibo(k)/10,
    400,fibo(k)/10);
  }
    
}
/*
@return the nth fibonacci number
*/
int fibo(int n)
{
  if (n==1)
    return 1;
  if (n==2)
    return 1;
  if (fiboMap.containsKey(n)){
    return fiboMap.get(n);  
  }
  fiboMap.put(n, fibo(n-1)+fibo(n-2));  
  return fibo(n-1)+fibo(n-2); 
  
}

