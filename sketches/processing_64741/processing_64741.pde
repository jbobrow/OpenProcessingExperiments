
//-- 
float [] posX = new float [126];//guardo las posiciones de la circunsferencia
float [] posY = new float [126];
float angle = 0.0;
float speed = 0.05; 
float radius = 100.0; 
float angulo = 0.0;
//----------------------------
//----------------------------
void setup()
{
size(400, 400);
background(0);
smooth();
  noStroke();
//con este for lleno el array
for(int i = 0; i < posX.length; i++)
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
  rect(0, 0, width, height);
//-------------------------
//colores aleatoreos
fill(random(0, 255), random(0, 255), random(0, 255));
//posiciono en el centro 
translate(width/2, height/2); 
for(int a = 0; a < posX.length; a+=2)
     {
      angulo += 0.00002;   
      rotate(angulo);  
      //con el mouse se agranda o se achica un poco
      ellipse(posX[a] + mouseX/3, posY[a] + mouseY/3, 5, 5);
     };

//----------------------------
//----------------------------
}

