
int angulo;
int nombre= 0;

void setup(){
size (1300,700);
background(30);
smooth();
noStroke();
frameRate(20);
}


void draw (){
  
girar();
  fill(random(247),155,226,random(255));
ellipse(20,20,random(10),angulo);  
angulo++;

fill(random(250),227,50,random(255));
ellipse(50,50,random(10),angulo);  
angulo++;

fill(random(8),random(252),164,random(255));
ellipse(80,80,random(10),angulo);  
angulo++;

fill(252,random(159),8,random(255));
ellipse(110,110,random(10),angulo);  
angulo++;

fill(183,random(50),250,random(255));
ellipse(140,140,random(10),angulo);  
angulo++;
}


void girar(){
  translate(width/2, height/2);
  rotate(radians(angulo));
}

void keyPressed(){
  nombre = nombre +1;
  save("capturas/"+nombre+"palitosChinos.png");
}
void mousePressed(){
  background(30);
}
                
                                
