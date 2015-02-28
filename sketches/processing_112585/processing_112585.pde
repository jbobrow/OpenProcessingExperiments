
void setup(){
size(1000,500);
}

void draw(){
 
float r;
float g;
float b;

r = map(mouseX,0,width,0,255);
g = map(mouseY,0,height,0,255);
//b = random(255); //versao eplepsia
b = 0;

stroke(r,g,b);
background(255-r,255-g,255-b);

//float i = 0; //opcao externa do 'for'

for ( float i=0; i<=height; i=i+10){
  line(0,i,mouseX,mouseY);
  line(width,i,mouseX,mouseY); 
}
for ( float i=0; i<=width; i=i+10){
  line(i,0,mouseX,mouseY);
  line(i,height,mouseX,mouseY);
}
redraw();
}


