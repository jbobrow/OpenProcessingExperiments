
ArrayList primes = new ArrayList();
int current = 5;

void setup(){
  size(400, 400);
  background(color(255,255,255));
  primes.add(2);
  point(2%width, 2/width);
  primes.add(3);
  point(3%width, 3/width);
}

void draw(){
  if(isPrime(current)){
    point(current%width, current/width);
    primes.add(current);
    current += 2;
    if(isPrime(current)){
      point(current%width, current/width);
      primes.add(current);
      current += 4;
    }else{
      current += 2;
    }
  }else{
    current += 2;
  }
}

boolean isPrime(int x){
  for(int i=0; i<primes.size() && ((Integer)(primes.get(i))) <= sqrt(current); i++){
    if(current % ((Integer)(primes.get(i))) == 0){
      return false;
    }
  }
  return true;
}

