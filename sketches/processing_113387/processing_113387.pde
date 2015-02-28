
int a =-99999;
int b =99999;

int [] x = new int[1000];

for (int i=0;i<1000;i++){
  x[i]=round(random(-9999,9999));
}

  for(int i=0;i<1000;i++){
    if(a<=x[i]){
      a = x[i];
    }
  }
  
  for(int i=0;i<1000;i++){
    if(b>=x[i]){
      b = x[i];
    } 
  }
   
  
  print("largest:");
  println(a);
  
  print("smallest:");
  println(b);

