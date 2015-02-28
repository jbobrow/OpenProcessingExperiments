
int [] odd;
int [] even;
int sum;
int sum2;

void setup() {
  /* numbers = new int[1001];
   for (int i= 1; i<= 1000; i++) {
   numbers[i] = i;
   }
   
   for (int j= 1; j < numbers.length; j++) {
   // println(numbers[j]);
   }
   
   for (int k= 0; k < numbers.length; k= k+3) {
   println(k);
   }
   */
  odd = new int[1001];
  even = new int[1001];

  for (int i= 0; i <1000; i +=3) {
    //println(i);
    odd[i] = i;
  }

  for (int j=0; j <1000; j +=5) {
    println(j);
    even[j] = j;
  }
  
  for (int k=0; k <odd.length; k++){
   sum += k;   
  }
  for (int l=0; l <even.length; l++){
   sum2 += l;   
  }
  
  //println(numbers);
  println(sum);
  println(sum2);


 // println(numbers);
}

void draw() {
}



