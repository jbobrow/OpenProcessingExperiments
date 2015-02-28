
float angulo=0.0;
float value;
void setup(){
size(429,420);
smooth();
frameRate(90);
fill (random(255),random(3),random(11));
 
}

void draw(){
  
   value=random(118);
 fill (random(255),random(3),random(11));

  translate(random(600),random(600));
  rotate(angulo);
  curve(5, 26, 5, 26, 73, 24, 73, 61);
curve(5, 26, 73, 24, 73, 61, 15, 65); 
curve(73, 24, 73, 61, 15, 65, 15, 65);
  angulo=angulo+0.1;
}


