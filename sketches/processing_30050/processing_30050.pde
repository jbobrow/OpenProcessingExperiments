
// comments go here
long a = 600851475143;
long b;
long c;
void setup()
{
  size(200,200);
  background(125);
  fill(255);
  noLoop();
  PFont fontA = loadFont("courier");
  textFont(fontA, 14);  
}

void draw(){  
  while(b<600851475143){
    c=a/b
    println(b + c);
    b++;
  }

}

