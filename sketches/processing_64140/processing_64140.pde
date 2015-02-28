
//Este ejemplo utiliza los arrays de la misma forma que en el
//anterior, solo que produce un determinado efecto.
int num = 50;
//Arrays de las coordenadas x e y 
float[] x = new float[num]; 
float[] y = new float[num]; 
// variables transparencia y colores
int t;
int r;
int g;
int b;
//-------------------------------------
void setup() 
{ 
 size(500, 500);
 noStroke();
 smooth();
 rectMode(CENTER);
 t = 160;
 r = 0;
 g = 0;
 b = 0;
}
//-------------------------------------  
void draw() 
{ 
 background(g, b, r); 
// Agrego el primer valor según las coordenadas x e y
// en el primer elemento de cada array 
  x[0] = random((width-100)/15, (width-100)/0.9); 
  y[0] = random((height-100)/8, (height-100)/0.9); 
// Corro los valores hacia la derecha para actualizar
// los valores del array en cada frame
  for (int i = num-1; i > 0; i--) 
      { 
       x[i] = x[i-1];
       y[i] = y[i-1];
      }; 
  //------------
  if ( keyPressed == true )
     {
      if(key >= 97 && key <= 99)
        { r = 255; g = 0; b = 0;};
      if(key >= 100 && key <= 102)
        { r = 255; g = 128; b = 0;};   
      if(key == 103 || key == 104)
        { r = 255; g = 255; b = 0;};     
      if(key == 105 || key == 106)
        { r = 128; g = 255; b = 0;};   
      if(key == 107 || key == 108)
        { r = 0; g = 255; b = 0;};   
      if(key == 109 || key == 110)
        { r = 0; g = 255; b = 128;};    
      if(key == 111 || key == 112)
        { r = 0; g = 255; b = 255;};    
      if(key == 113 || key == 114)
        { r = 0; g = 128; b = 255;};   
      if(key == 115 || key == 116)
        { r = 0; g = 0; b = 255;};   
      if(key == 117 || key == 118)
        { r = 128; g = 0; b = 255;};  
      if(key == 119 || key == 120)
        { r = 255; g = 0; b = 255;};  
      if(key == 121 || key == 122)
        { r = 255; g = 0; b = 128;};     
      //------------
      for (int i = 0; i < num; i++) 
          {
           strokeWeight(2);
           stroke(g, b, r, t/3);
           line(x[i]-10, y[i]-10, x[i]+10, y[i]+10);
           line(x[i]-10, y[i]+10, x[i]+10, y[i]-10);          
           noStroke(); 
           fill(r, g, b, t/6);
           ellipse(x[i], y[i], i/0.5, i/0.5); 
           fill(g, b, r, t/3);
           ellipse(x[i], y[i], i/1, i/1); 
           fill(r, g, b, t);
           ellipse(x[i], y[i], i/2.0, i/2.0); 
          };    
      //------------   
     }else{
           for (int i = 0; i < num; i++) 
               {
                strokeWeight(2);
                stroke(r, g, b, t/3);
                line(x[i]-10, y[i]-10, x[i]+10, y[i]+10);
                line(x[i]-10, y[i]+10, x[i]+10, y[i]-10);          
                noStroke(); 
                fill( g, b, r, t/6);
                rect(x[i], y[i], i/0.5, i/0.5); 
                fill(r, g, b, t/3);
                rect(x[i], y[i], i/1, i/1); 
                fill(g, b, r, t);
                rect(x[i], y[i], i/2.0, i/2.0); 
               }; 
              //------------
           };
//----------------------------------------------
}

