
float inicio,fin;
void setup()
{
 size(500,500); 
noFill();
 smooth();
}

void draw(){
  
background(255);
strokeWeight(4);
fill(255,0,0);
arc(90,90,150,150,0,0+fin);
fill(0,255,0);
arc(200,200,100,100,0,0+fin);
fill(0,0,255);
arc(300,300,70,70,0,0+fin);
inicio+=.01;
fin+=.02;
}

