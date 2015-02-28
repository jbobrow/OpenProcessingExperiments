
void setup(){
size(1000,1000);
}
float x=500; // Try changing these if curlicue 
float y=500; // hits edge of canvas
float x1;
float y1;
float n;
float a = random(2,10);
float b = random(100,2000);

float funky (float n) {
  return pow(n,a)/b; // change the bit after the return to experiment with different patterns. See http://books.google.co.uk/books?id=ZfK7AQAAQBAJ&lpg=PT199&ots=kLueXq6JqF&dq=the%20analogy%20bears%20interesting%20fruit.%20The%20entropy%20of%20a%20curve&pg=PT190#v=onepage&q&f=false for more ideas.
}

void draw(){
n=n+1;
x1 = x+5*cos(10*PI*funky(n));
y1 = y+5*sin(10*PI*funky(n));
line (x,y,x1,y1);
x=x1;
y=y1;
}







