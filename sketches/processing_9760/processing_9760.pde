
int index = 10;
int[] data = new int[index+1];

void setup () {
  size(600,600);
  background(0);
  int answer = two_power(index);
  /*
  print (data[0]);
  print (data[1]);
  print (data[2]);
  print (data[3]);
  print (data[4]);
  print (data[5]);
  print (data[6]);
  print (data[7]);
  print (data[8]);
  print (data[9]);
  print (data[10]);
  */
  
  println("2^" +index+ "=" +answer);
  noLoop();
}

void draw () {
  for(int i = 0; i < index+1; i++){
    noStroke();
    fill(255,150);
    rect(0+i*60,0,80,data[i]);
    fill(255,0,0);
    rect(20+i*60,600-data[i],5,data[i]);
  }
}

int two_power (int n) {
  if (n == 0){
    data[0] = 1; 
    return data[0];    
  }
  else{
    data[n] = 2 * two_power(n-1);
    return data[n];
  }
}





