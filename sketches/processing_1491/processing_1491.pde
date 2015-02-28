
//Emel'im ben kafama göre ğrpcess,ng taklıyorum
//Bu kodda ŞUNLrı yAPTIM
void setup()
{ 
  size( 400 , 400 );
  smooth(); // Yumoş gibi bişi
  background( 255 );
  frameRate(25); // Görüntü hızını beliliyomuş. 
}

void draw()
{
  fill ( random(255) , random(255) , (255) , 58 );
  noStroke(); // Bu çizgi çizilmemesini sağlıyor ee o zaman niye drawun içine yazdık. Hocaya soralım.
  ellipse( 200, 200 , random(400) , random(400) );

}




