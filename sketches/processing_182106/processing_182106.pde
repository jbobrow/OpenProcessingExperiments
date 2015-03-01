

size(600, 600);

fill(#7E0C98);//only runs once up here instead of multiple in the for loop
for(int i = 0; i < 101; i++)
{
  for(int j = 0; j < 101; j++){
    
    ellipse(10*i, 10*j, 30, 30);
  }
}
//ellipse(20, 20, 10, 10);


