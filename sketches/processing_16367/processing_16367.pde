
int a=20;
int direccion= 37;
void setup(){
  size(700,800);
  background(255);
}
void draw(){
for(int x =10;x<=width;x=x+40){
  for(int y=10;y<=width;y=y+40){
    fill(random(0,290),random(0,100),random(8));
    rect(a,a,6,a,56,a);
    rect(a,a,6,a,56,a);
    rect(a,a,6,a,56,a);
    rect(a,a,6,a,56,a);
    rect(a,a,560,a,56,a);
    ellipse(198,98,a,90);
  ellipse(398,198,a,90);
  ellipse(498,298,a,90);
  ellipse(598,398,a,90);
  ellipse(98,98,a,90);
    a=a+direccion;
//para que el cuadrado vuelva se necesita: y sirve para que aumente etc//
//variable de direccion//
if(a>800|| a<=0){
  direccion=direccion*-1;
}
    
    
}
}
}

