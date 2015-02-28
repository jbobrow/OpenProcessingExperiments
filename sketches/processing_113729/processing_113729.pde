
void setup(){
  
 size (1300,700); 
}

void draw (){
//background(random(0,255),random(0,255),random(0,255));
stroke(random(0,255),random(0,255),random(0,255));
strokeWeight (mouseX);
fill (random(0,255),random(0,255),random(0,255));
ellipse (random(0,1300),random(0,1300),mouseX,mouseX);

stroke(random(0,255),random(0,255),random(0,255));

line (random(0,1200),random(0,1200),random(0,150),random(0,150));
}


