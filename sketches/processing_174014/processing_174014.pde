
int[] prime;
int n = 100000;
int max = 1;
boolean r = true;

void setup(){
  size(450,150);
  background(0);
  
  prime = new int[n];
  prime[0] = 2;
  for(int i=1; i<n; i++){
    prime[i] = 3;
  }
  
  for (int i=3; prime[n-1]<4; i+=2){
    for(int m=1; m<sqrt(max)+1; m++){
      if ( (i%prime[m] == 0) && (r)){
        r = false;
      }
    }
    if(r){
      prime[max+1] = i;
      max++;
    }
    if(max<n-1){
      r=true;
    }
  }
  
  
  //printArray(prime);
  //println("these are the first "+n+" Prime Numbers: ");
/* for (int i = 0; i < n; i++){
    //print( prime[i] + ", ");
  }
  for(int i=3; i<100; i++){
    print(i + "(");
    for(int j=int(sqrt(i)+i/6); j>=0; j--){
      if (i%prime[j] == 0){
        print(" " + prime[j] + "," );
      }
    }
    println(")");
  }*/
  
}
int numberIn = 0;
void draw(){
  int f = 0;
  int[] rock = new int[10];
  background(0);
  fill(255);
  textSize(15);
  text("please choose a number less than 600,000\nClick to reset",width/2,15);
  textSize(100);
  textAlign(CENTER);
  text(numberIn, width/2, height/2+40);
  
  textSize(20);
  for(int j=int(sqrt(numberIn)+numberIn/6); j>=0; j--){//using the prime elements
    if (numberIn%prime[j] == 0){//does it accept division
      rock[f] = prime[j];
      f++;
      //print(f);
    }
    
  }
   for(int i=f; i>0; i--){
    text(rock[f-1],50*i,height-10);
    f--;
  }
  //rock = new int[f];
  //printArray(rock);
  f=0;
}
void keyPressed(){
   numberIn = numberIn * 10 + (key - 48);
   if(numberIn > 600000){
   numberIn = 600000;
   }
}
void mousePressed(){
  numberIn = 0;
}
