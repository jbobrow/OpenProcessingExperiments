

 
PImage im[] = new PImage[10];  
String imFile[] = {"0.jpeg", "1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg", "5.jpeg", "6.jpeg", "7.jpeg", "8.jpeg", "9.jpeg"};
 
void setup() {
  size(240, 360);  // 6 digitos en tres filas y dos columnas  
  for (int i = 0; i < 10; i = i + 1) {
    im[i] = loadImage(imFile[i]); 
  }
}
 
void draw() {
  int h = hour();            
  int h_dec = int(h / 10);   
  int h_uni = h - h_dec * 10;
   
  image(im[h_dec], 0, 0);    
  image(im[h_uni], 120, 0);   
   
  int m = minute();           // Toma los minutos del reloj del ordenador y almacenalos en una variable
  int m_dec = int(m / 10);    // Extrae el digito de mayor peso de los minutos (decenas)
  int m_uni = m - m_dec * 10; // Extrae el digito de menor peso de los minutos (unidades)
   
  image(im[m_dec], 0, 120 );    // Muestra el digito de las decenas
  image(im[m_uni], 120, 120);   // Muestra el digito de las unidades
   
  int s = second();           // Toma los segundos del reloj del ordenador y almacenalos en una variable
  int s_dec = int(s / 10);    // Extrae el digito de mayor peso de los segundos (decenas)
  int s_uni = s - s_dec * 10; // Extrae el digito de menor peso de los segundos (unidades)
   
  image(im[s_dec], 0, 240);   // Muestra el digito de las decenas
  image(im[s_uni], 120, 240);  // Muestra el digito de las unidades
}
