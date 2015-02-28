
//2 variables and 5 shapes 

size(400,400);

background(255);

int a;
int b;

a=100; 
b=100;

/*
rect(50,0,a,b);

ellipse(100,0,b,a);

rect(100,0,a,b);

ellipse(150,0,b,a);

rect(150,0,a,b);

ellipse(200,0,b,a);




//(the four loop)(the four loop)(the four loop)(the four loop)



rect(50,0,a,b);

ellipse(100,0,b,a);

rect(100,0,a,b);

ellipse(150,0,b,a);

rect(150,0,a,b);

ellipse(200,0,b,a);

*/

for(int i =50 ; i<=200;i+=50){
  
  for(int c =50 ; c<=400;c+=50){
  rect(c,i,a,b);
  fill(25);
}
  
 // rect(0,i,a,a);
  
}







