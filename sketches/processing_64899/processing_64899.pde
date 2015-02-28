
//guardo las posiciones de la circunsferencia
float [] posX = new float [255];
float [] posY = new float [255];
float angulo = 0.0;
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
  background(0);
  translate(width/2, height/2); 
  strokeWeight(2);
//------------------------
 for (int a = 0; a < posX.length-2; a++)
     {
        angulo += 0.0000008;
         rotate(angulo);   
           
           
           noFill();
           stroke(a-25, 255, 255, 100);
           ellipse(posX[a], posY[a], posX[a], posY[a]);
           
           stroke(a-55, 255, 255, 200);
           fill(a-55, 255, 255, 50);
           ellipse(posX[a+1], posY[a+1], posX[a]/2, posX[a]/2);
     };
//------------------------ 
}

