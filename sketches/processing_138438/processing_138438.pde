
void setup() {

 size(1000,900);
 background(105,155,133);
 
 for(int i = 0; i< 5; i+=1){
   casa(i*200, 200, 250, 275);
  
  }
}

void casa (int x, int y, int an, int al){
 

int miCuadrado=miSuma(x,y);

fill (197,214,229);
rect (x,y,an,al);

fill (178,206,162);
rect (x+an/2.5,y+an/2,an/10*3,al/1.835);

fill (162,198,206);
rect (x+an/10,an,y/3.3,an/3.8);

fill (208,214,184);
triangle (x+an/2,y/2,x+an,y,x,y);
}
int miSuma (int x, int y) {
  int miSuma=x+y;
  return miSuma; 

}

