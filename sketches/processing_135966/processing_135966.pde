

int x = 10;
float y = 5.5;

void setup(){
  size(500, 500);
  background(100, 50, 0);
}

void draw(){  
  
  line (x, x+20, Y-3.5, y+0.3);

x=x+5;
y=y+0.5;

if (x>500){
  x=x-500;

println(x);
}
}





