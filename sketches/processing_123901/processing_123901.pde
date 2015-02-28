
void setup(){
  MethodA();
  MethodB();
  MethodC();
  MethodD();
  MethodE();
}


void MethodA(){
  int sum=0;
  for(int z = 100; z<301; z=z+1){
    sum=sum+z;
    println(z);
   }
  println("The sum of the numbers from 100 to 300 is " + sum);
}


void MethodB(){
  int sum=0;
  for(int z = 100; z<301; z=z+2){
    sum=sum+z;
    if(z%2==0){
      println(z);
    }
  }
  println("The sum of the even numbers from 100 to 300 is " + sum);
}


void MethodC(){
    for(int a = 100; a<201; a=a+7){
    println(a);
    }
  }


void  MethodD(){
  int x = int(random(1,1000));
  int y=1;
  while(x!=500){
  x = int(random(1,1000));
  y++;
  }
  println("It took "+y +" tries to pick the number 500.");
}


void  MethodE(){
  int a = int(random(1,100));
  int b = int(random(1,100));
  int c = int(random(1,100));
  if(a<b&&b<c)
  println(a+","+b+","+c);  
  if(a<c&&c<b) 
  println(a+","+c+","+b); 
  if(b<a&&a<c)
  println(b+","+a+","+c); 
  if(b<c&&c<a)
  println(b+","+c+","+a); 
  if(c<a&&a<b)
  println(c+","+a+","+b); 
  if(c<b&&b<a)
  println(c+","+b+","+a); 
  
}
