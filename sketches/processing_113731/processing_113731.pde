
void setup(){
  
 size (1300,700); 
}

void draw (){
frameRate(3);
strokeWeight (mouseX);
fill (random(0,255));
ellipse (random(0,1300),random(0,1300),mouseX,mouseX);

stroke(random(0,255),random(0,255));

line (random(0,700),random(0,700),random(100,555),random(100,555));
}


