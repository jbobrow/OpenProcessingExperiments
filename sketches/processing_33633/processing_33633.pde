
float a= 0;

void setup(){
size(700,400);
smooth();
}

void draw(){
a+=0.1;
translate(mouseX,mouseY);
rotate(a);
ellipse(0,0,100,20);
}
                
                
