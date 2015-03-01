
//float r = random(100);  Yields a random number between 0-100
//println(r);
size(260,400);
background(255);

for (int i=10; i<=100; i+=10)
  {
    for (int j=10; j<=100; j+=10)
      {
        float m = random(255);
        float n = random(255);
        float k = random(255);
        stroke(m,150,k,n);
        quad(60,70,i,j,100,100,i+30,j-10);
      }
    }
    
 for (int i=10; i<=400; i+=30)
  {
    for (int j=10; j<=400; j+=30)
      {
        float m = random(255);
        float n = random(255);
        float k = random(255);
        stroke(m,150,k,n);
        line(m,400,k,n);
      }
  }

