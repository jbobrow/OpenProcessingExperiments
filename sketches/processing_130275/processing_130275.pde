
int maxaltura = 40;
int minaltura = 20;
int alturaletra = maxaltura; 
int ancholetra = 20;          
int x = - ancholetra;          
int y = 0;                      
boolean nuevaletra;              
int numletras = 26; //Hay 26 letras en el alfabeto.     
color[] colores = new color[numletras];

void setup()
{
  size(640, 360);
  noStroke();
  colorMode(HSB, numletras);
  background(numletras/2);

  for(int i = 0; i < numletras; i++) {
    colores[i] = color(i, numletras, numletras);    
  }
}

void draw()
{
  if(nuevaletra == true) {
    int y_pos;
    if (alturaletra == maxaltura) {
      y_pos = y;
      ellipse( x, y_pos, ancholetra, alturaletra );
    } else {
      y_pos = y + minaltura;
      ellipse( x, y_pos, ancholetra, alturaletra );
      fill(numletras/2);
      ellipse( x, y_pos-minaltura, ancholetra, alturaletra );
    }
    nuevaletra = false;
  }
}

void keyPressed()
{
  if((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')) {
    int keyIndex;
    if(key <= 'Z') {
      keyIndex = key-'A';
      alturaletra = maxaltura;
      fill(colores[key-'A']);
    } else {
      keyIndex = key-'a';
      alturaletra = minaltura;
      fill(colores[key-'a']);
    }
  } else {
    fill(0);
    alturaletra = 10;
  }
  nuevaletra = true;
  x = (x + ancholetra); 

  if (x > width - ancholetra) {
    x = 0;
    y+= maxaltura;
  }

  if(y > height - alturaletra) {
    y = 0;
  }
}


