
float a, incA;
float cX, cY;

//______________
void setup (){
  size (500,500);
  background (0);
  a = 0;
  incA = radians (1);   // es igual decir radians que (TWO_PI)/360;
  cX = width/2;
  cY = height/2;
  
}

//----------------
void draw (){
fill (0); //el último número es la transparencia. si declaro aquí un color es para que las figuras dejen un rastro
noStroke();  // evita que se dibuje el perímetro de la sig figura
rect (0,0, width, height);

float fase = 0;


//llamo a la función que declaré abajo; utilizamos "a" xq es la que está declarada arriba
for (int j =25; j < height; j +=50){
for (int i = 25; i< width; i += 50){
  
  fill(0);  
  circular(i, j,15,a+fase);
  fase += radians(5);

}
}
//fill(0);
//text ("fase =" +fase, 100,100);
a = a+incA;

}

//----------------

void circular (float centroX, float centroY, float radio, float angulo){
float x = centroX + radio*cos(angulo);  //usamos la palabra completa angulo
float y = centroY + radio*sin(angulo);

stroke (21,206,22);
//line(x,y,mouseX,mouseY);
ellipse(x,y,mouseX,mouseY);

noStroke();
ellipse (x,y,15,15);

}






