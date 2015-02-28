

// Vize projesi gereği soyut bir resmi yeniden yorumlamaya çalışıyorum.
// Jackson Pollock'un eserin yapmaya çalıştım. 
// Bu kodu aşaığdaki şekilde yazdım.
// çok zorlandım çok uğraştım,umarım beğenirsiniz.
// Herkes sanatçı olacak bie eser yaratacak yazdığım kodla.

void setup()
{ 
  size( 400 , 400 );// ebatını belirledim.
  smooth(); // Yumuşaklık verdim.
  background( 255 ); //arka planı beyaz yaptım.
  frameRate(10); // Görüntü hızını belirledim. 
  colorMode(HSB);
}


void draw()
{
  stroke (random(0,255),150,200);
  //Hue : 180 yani mavi
  //Saturation : parlaklık canlılık için sayısını yükselttim.
  //brightness:griye yakınlığını belirliyor.
  strokeWeight((abs(pmouseX-mouseX)+abs(pmouseY-mouseY))/5);// çizgi kalınlığının kalın ve inceliğini belirledim.
  line(pmouseX,pmouseY,mouseX,mouseY);// mouse ile konulan noktadan diğer noktalara bağlantılı gitmesi için yaptım.

}







