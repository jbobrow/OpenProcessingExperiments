
//yanıp sönen şekiller.

float x; 
float y;

void setup()
{
  colorMode(HSB,255);
  size(800,600);
  noStroke();
}

void draw()
{
// yanan kareler ve yuvarlaklar ve hepsi eşit büyüyolar yani elips ya da dikkdörtgen olmuyolar.
  fill(random(0,255),200,190,250);
  x=random(100); // bu kısmı ben ekledim.geri kalanları sınıfta yaptık.
  rect(random(800),random(600),x,x);
  y=random(150);
  ellipse(random(10,300),random(20,200),y,y);


  if(mousePressed=true){
    fill(random(10,150),20,44,40);
    rect(0,0,800,600);
  }



}




















