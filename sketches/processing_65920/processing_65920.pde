
void setup(){
size(800,800);

background(0);

for(int a=600; a<width; a=a+12){
noStroke();

//fill(14,250,3,15);
//ellipse(0,0,a+100,a+100);

//fill(14,250,3,15);
//ellipse(800,700,a+80,a+80);

//fill(9,3,250,15);
//ellipse(100,800,a+1,a+1);

fill(255,3,3,40);
ellipse(400,400,a-600,a-600);//ROJO  centro


fill(255,3,3,40);
ellipse(100,100,a-700,a-700);//ROJO izq

fill(255,3,3,40);
ellipse(100,700,a-700,a-700);//ROJO izq abj



fill(255,3,3,40);
ellipse(700,700,a-700,a-700);//ROJO

fill(255,3,3,40);
ellipse(700,98,a-700,a-700);//ROJO


fill(9,3,250,15);
ellipse(400,700,a-500,a-500);//aZUL

fill(9,3,250,15);
ellipse(400,100,a-500,a-500);//AZUL

fill(9,3,250,15);
ellipse(100,400,a-500,a-500);// AZUl

fill(9,3,250,15);
ellipse(700,400,a-500,a-500);// AZUl


}
}

