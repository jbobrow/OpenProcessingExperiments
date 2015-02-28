
//guardo las posiciones de la circunsferencia
float [] posX = new float [255];
float [] posY = new float [255];
float angulo = 0.0;
float angulo2 = 0.0;
int col = 0;
//----------------------------
void setup()
{
  size(400, 400);
  background(0);
  colorMode(HSB);
  noStroke(); 
  //con este for lleno el array
  for (int i = 0; i < posX.length; i++)
      {    
        float x = pow(1.1, i/1.95) * cos(i/1.95);//funcion para espiral
        float y = pow(1.1, i/1.95) * sin(i/1.95); 
        posX[i] = x; 
        posY[i] = y;
      };
//------
}
//----------------------------
void draw()
{
  translate(width/2, height/2); 
  strokeWeight(2);
  col = (col + 1) % 256;
//------------------------
 for (int a = 0; a < posX.length-43; a++)
     {
         pushMatrix();
           angulo2 -= 0.0001; 
           rotate(angulo2);
           stroke(col-a, 255, 255, 10);
           line(posX[a], posY[a], posX[a+10], posY[a+10]);
           stroke(col-(a+2), 255, 255, 10);
           line(posX[a+11], posY[a+11], posX[a+21], posY[a+21]);
           stroke(col-(a+4), 255, 255, 10);
           line(posX[a+22], posY[a+22], posX[a+32], posY[a+32]);
           stroke(col-(a+8), 255, 255, 10);
           line(posX[a+33], posY[a+33], posX[a+43], posY[a+43]);
         popMatrix(); 
     };
//------------------------ 
}

