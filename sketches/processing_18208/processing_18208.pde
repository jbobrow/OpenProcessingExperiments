
int a = 0;      // moving lines 
int c = 10;  // variable couleur de fond

void setup()
{
  size(1600,900);
  stroke(0);
}

void draw()
{
  background(c);
  
a = a + 10;
c = c + 25;

  
for(int i=0; i<1600;i = i + a )
  line(i,0,i,1600); // ligne verticale
  
  for(int i=0; i<1600;i = i + a )
  line(0,i,1600,i);  // ligne horizontale
  
  
  if(a > 100) {
    a = 0;
  }
  }
  
  
