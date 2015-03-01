
float x,y;
float angle;
float amplitude;

void setup() {
 
size(200,200);
background(255);

int [] a = fibonacciArray(width);

for(int i = 0; i < width; i++) {
amplitude = height * .1;
y = height/2 + (sin(angle) * amplitude);
angle += .1;
stroke(100);
ellipse(x,y,i,i);
x = x + 1;
}

}

int [] fibonacciArray(int maxVal) { 
  
int num1 = 0;
int num2 = 1; 
int sto; 
int [] a = new int [maxVal+1];

for (int i=0; i <= maxVal; i++) {
a[i] += num2;
sto = num1 + num2; 
num1 = num2;
num2 = sto;
}
return a;
}
