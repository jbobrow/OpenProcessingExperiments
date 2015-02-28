
float [][] puntos = { {3,1},{7,1},{7,8},{3,3},{3,1} };
float sz= 50.0;;
float y;

void setup(){
  size(600,400);
}

void draw(){
  //trazamos las lineas
  for(int linea=0;linea<3;linea++){
    line(puntos[linea][0]*sz,puntos[linea][1]*sz,puntos[linea+1][0]*sz,puntos[linea+1][1]*sz);
  }
  line(puntos[3][0]*sz,puntos[3][1]*sz,puntos[0][0]*sz,puntos[0][1]*sz);
  
  float lineas=6;
  for(float i=1;i<lineas+1;i++){
   line(puntos[1][0]*sz,puntos[1][1]*sz,3*sz,(puntos[0][1]+  ( (puntos[3][1]-puntos[0][1]) / lineas *i)  ) *sz );  
  }
    lineas=30;
  for(float i=1;i<lineas+1;i++){
    y = (puntos[3][1]+  ( (puntos[2][1]-puntos[3][1]) / lineas *i)  ) ;
   line(puntos[1][0]*sz,puntos[1][1]*sz, ((y*4 + 3)/5)*sz,y *sz ); 
  }
}
