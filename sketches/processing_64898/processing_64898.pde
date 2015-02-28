
//guardo las posiciones de la circunsferencia
float [] posX = new float [255];
float [] posY = new float [255];
float angulo = 0.0;
float angulo2 = 0.0;
//----------------------------
void setup()
{
  size(400, 400);
  background(0);
  //smooth();
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
  for (int a = 0; a < posX.length-12; a++)
     {
       
         pushMatrix();
             angulo += 0.00004;
             rotate(angulo);  
             stroke(a-50, 255, 255);
             line(posX[a], posY[a], posX[a+1], posY[a+1]);
             line(posX[a], posY[a], posX[a+12], posY[a+12]);   
             fill(a-60, 255, 255);
             noStroke();
             ellipse(posX[a], posY[a], a/10, a/10);
         popMatrix();  
         pushMatrix();
             angulo2 -= 0.00004;
             rotate(angulo2);  
             stroke(a-50, 255, 255);
             line(posX[a], posY[a], posX[a+1], posY[a+1]);
             line(posX[a], posY[a], posX[a+12], posY[a+12]);   
             fill(a-60, 255, 255);
             noStroke();
             ellipse(posX[a], posY[a], a/10, a/10);
         popMatrix(); 
     };
//------------------------ 
}

