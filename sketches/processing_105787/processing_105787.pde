
void setup(){
  size(800,800);
}

void draw(){
  background(0);
fill(255,0,0);
for (int farmingham = 1; farmingham <=200; farmingham++){ ellipse(random(farmingham),random(farmingham),200,200);
}  

for (int wookie = 5; wookie<=200;wookie++){ellipse(20,random(wookie),100,100);
  
  
}
}
