


void setup() {
  
  size (640, 410) ;
  

  
}
void draw() {
  background (60);
  size (640, 410) ;
  fill( #FF0808 );
  for (int i = 0 ; i < 10; i++) {
  for (int j = 0 ; j < 10; j++) {
  println(i);
   
  triangle(100*i, 50*j, 20, 30, 20, 20) ;
  }
  }
}


