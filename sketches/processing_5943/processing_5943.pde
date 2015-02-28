
int x;
int y;

void setup (){
size (570,570);
}


void draw(){
background(255);

y = 0;

while(y < 600){
x = 0;
while (x < 600){
  fill(random(255),random(255), random(255));
rect(x,y,25,25);
x = x + 60;
}
y = y + 60;
}
 if (mouseY > 100) 

 
  {
background(0);

y = 0;

while(y < 600){
x = 0;
while (x < 600){

rect(x,y,25,25);
x = x + 60;
}
y = y + 60;
}
 
  }
}

