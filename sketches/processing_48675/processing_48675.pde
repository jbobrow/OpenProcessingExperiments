
/*
* Yet another tunnel effect, with a "christmas" twist ;)
* A much better example (made byte luis2048), can be found at:
* http://processing.org/learning/topics/tunnel.html
*
* Coded by @ramayac
*/

int RES_W = 600;
int RES_H = 600;
int TEXTUREWIDTH;
int TEXTUREHEIGHT;

PImage textura;
PImage buffer;


int[][] distances = new int[RES_W][RES_H];
int[][] angles = new int[RES_W][RES_H];

void setup(){
  size(600, 600);
  textura = loadImage("textura.jpg");
  textura.resize(width, height);
  
  TEXTUREWIDTH = textura.width;
  TEXTUREHEIGHT = textura.height;
  
  buffer = createImage(width, height, RGB);
  pre();
}

//Pregenerar el mapa de coordenadas/pixeles
void pre(){
  for(int x=0; x < width; x++){
    for(int y=0; y < height; y++){
      distances[x][y] = 
        (int) ( ( 30.0 * TEXTUREHEIGHT / sqrt( 
        (x - width/2.0) * ( x - width/2.0 ) + ( y - height/2.0 ) * (y - height/2.0)
        )) % TEXTUREHEIGHT) ;
        
      angles[x][y] = (int) (0.5 * TEXTUREWIDTH * atan2( y - height/2.0, x - width/2.0) / PI);
    }
  }
}

double movement = 0.1;
double animation = 0;

void tunnel(){
    animation += 3;        
    movement += 1;
  
    //calculate the shift values out of the animation value
     int shiftX = (int)(TEXTUREWIDTH  + animation);
     int shiftY = (int)(TEXTUREHEIGHT + movement);// / rotation);
 
     textura.loadPixels();

     //favor de notar el "cursor" trick, y la inversion de y a x.
     for(int y = 0, cursor = 0; y < height; y++){
          for(int x = 0; x < width; x++, cursor++){ 
               int c_x = (distances[x][y] + shiftX) % TEXTUREWIDTH;
               int c_y = (angles[x][y] + shiftY) % TEXTUREHEIGHT;
               buffer.pixels[cursor] = textura.pixels[c_x + c_y * TEXTUREWIDTH] ;
          }
     }
     
     buffer.updatePixels();
}

void draw(){
  tunnel();
  image(buffer, 0, 0);
}

