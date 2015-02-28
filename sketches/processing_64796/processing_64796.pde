
//guardo las posiciones de la circunsferencia
float [] posX = new float [126];
float [] posY = new float [126];
int [] col = new int [126];
float angle = 0.0;
float speed = 0.05; 
float radius = 100.0; 
//--
float angulo = 0.0;
float angulo2 = 0.0;
//----------------------------
void setup()
{
  size(400, 400);
  background(0);
  smooth();
  noStroke();
  //con este for lleno el array
  for (int i = 0; i < posX.length; i++)
      {    
        angle += speed; 
        float sinval = sin(angle);
        float cosval = cos(angle);
        float x = 50 + (cosval * radius);
        float y = 50 + (sinval * radius); 
        posX[i] = x; 
        posY[i] = y;
        col[i] = i;
      };
 //------
}
//----------------------------
void draw()
{
  background(0);
  translate(width/2, height/2); 
//-------------------------
pushMatrix();
  for (int a = 0; a < posX.length; a++)
      {
        angulo += 0.000003;   
        fill(col[a]*a, col[a]+a, a);
        rotate(angulo);  
        //con el mouse se agranda o se achica un poco
        ellipse(posX[a] + mouseX/3, posY[a] + mouseY/3, 5, 5);
      }; 
popMatrix();
//--
pushMatrix();
  for (int a = posX.length-1; a > 0; a--)
      {
        angulo2 -= 0.000003;   
        rotate(angulo2);      
        fill(col[a]*a, col[a]+a, a);
        ellipse(posX[a] + mouseX/3, posY[a] + mouseY/3, 5, 5);
      };
popMatrix();
//----------------------------
}

