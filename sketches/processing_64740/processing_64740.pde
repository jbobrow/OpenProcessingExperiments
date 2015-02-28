
//-- 
float [] posX = new float [126];//guarda los datos de cada posicion para que luego gire en circulo y no se deforme con el movimiento del mouse
float [] posY = new float [126];
// para el recorrido circular
float angle = 0.0;
float speed = 0.05; 
float radius = 100.0; 
//para usar en la rotacion en el draw.
float angulo = 0.0;
//-- 
float angulo2 = 0.0; // para el cuadrado
//----------------------------
//----------------------------
void setup()
{
size(400, 400);
background(0);
smooth();
for(int i = 0; i < posX.length; i++)//con este for guardo las posiciones en el array
   {    
     angle += speed; 
     float sinval = sin(angle);
     float cosval = cos(angle);
     float x = 50 + (cosval * radius);
     float y = 50 + (sinval * radius);
    posX[i] = x; 
    posY[i] = y; 
   };
//------
}
//----------------------------
//----------------------------
void draw()
{
  fill(0, 50);
  noStroke();
  rect(0, 0, width, height);//para transparencia
//--  
int x = int (random(width/1.75));//genera los circulitos aleatoriamente
int y = int (random(height/1.75)); 
//-------------------------
/* aca estan los circulitos aleatoreos, las lienas q los unen con el cuadrado 
central que sigue al mouse, y el cuadrado
*/
  pushMatrix();
     angulo2 = angulo2 - 0.05;
     translate(mouseX, mouseY);
     rotate(angulo2); 
     stroke(255, 0, 0);
     strokeWeight(2);
     line(-15, -15, x, y);
     fill(255, 0, 0);
     rect(-15, -15, 30, 30);
     fill(0, 255, 0);
     ellipse(x, y, 10, 10);
  popMatrix();
//-- 
/* con este for hago que la elipse recorra las posiciones del array para generar el efecto de 
que gira alrededor del mouse mientras gira.
*/
  pushMatrix();
     translate(mouseX, mouseY);
     angulo += 0.1;
     rotate(angulo);
     for(int a = 0; a < posX.length-90; a++)
        {
         stroke(0, 255, 0, a);
         fill(0, 255, 0, a);
         ellipse(posX[a]-50, posY[a]-50, 25, 25);
         }
  popMatrix();
//----------------------------
//----------------------------
}

