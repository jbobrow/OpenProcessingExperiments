
//PROYECTO 01 SESION 2 : dinamico

float r; //declaramos variable tipo decimal r 
float g;//declaramos variable tipo decimal g 
float b;//declaramos variable tipo decimal b 
float a;//declaramos variable tipo decimal a 
 
float diam;//declaramos variable tipo decimal diam 
float x;//declaramos variable tipo decimal x 
float y;//declaramos variable tipo decimal y
float s;


 void setup(){
 
size(504,700); 
background(255);
smooth(); 
noStroke(); 
s = 105;

 }

void draw() { 
  //Cada vez que se ejecuta draw() nuevos numero aleatorios son introducidos en las variables 
  r = random (255); 
  g = random(255); 
  b = random (255); 
  a = random(255); 
  diam = random(90, 160); 
  x = (100); 
  y = (110); 
 
 
  
  // usamos variables para dibujar la elipse 
  noStroke(); //quitamos el borde 
  fill(r,g,b,a);//rellenamos con el valor de las variables 
  ellipse(x,y,diam,diam);//dibujamos la elipse y la animamos
  
  pushMatrix(); //animamos el cuadrado
  if(s <= 700){
s = s + 4;
}
translate(270,s); 
rotate(PI/6.6);  
fill(r,0,0,a); 
rect(0,0,170,170); 
popMatrix();



fill(#e8b009); 
quad(25,295,391,254,392,294,29,330); 

fill(#e8b009); 
quad(173,449,197,450,115,699,92,700);

fill(#CB0A0A); 
quad(209,424,248,423,170,632,137,633);

fill(#F2DADA); 
quad(261,441,316,437,258,603,202,602);

fill(#CB0A0A); 
quad(316,656,447,581,451,610,328,676);

fill(#e8b009); 
quad(384,658,488,606,490,623,382,676); 

fill(#131b8f); 
beginShape(); //formas complejas 
vertex(206, 132); 
vertex(202, 123); 
vertex(223, 117); 
vertex(222, 94); 
vertex(233, 94); 
vertex(236, 113); 
vertex(258, 104); 
vertex(262, 114); 
vertex(238, 124); 
vertex(324, 615); 
vertex(312, 624); 
vertex(226, 127); 
endShape(CLOSE);

pushMatrix(); //reservado 
translate(270,105); 
rotate(PI/6.6);  
fill(#151313); 
rect(0,0,170,170); 
popMatrix();

}




