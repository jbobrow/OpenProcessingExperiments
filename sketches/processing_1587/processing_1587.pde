
void setup(){ 
  size(400,400); //kırmızı boyayı al
  background(209,53,53); //almış olduğun boya ile ekranı kırmızıya boya
  noStroke(); 



}

void draw(){ 
  fill(175,11,11);//koyu pembe renk al
  ellipse(200,250,380,380);//almış olduğun pembe renkle ekranın tam ortasına büyük bir daire çiz

  fill(250,164,25);//sarı ren al
  ellipse(200,250,350,350);//dairenin içine küçük bir daire çiz

  fill(25,152,32);//yeşil renk al
  ellipse(200,250,330,330);

  fill(0,28,178);//mavi renk al
  ellipse(200,250,300,300);

  fill(126,17,170);//mor renk al
  ellipse(200,250,270,270);

  fill(209,53,53);//kırmızı renk al
  ellipse(200,250,230,230);

  fill(0,28,178);//mavi renk al
  rect(150,280,330,70);//çizmiş olduğun daireleri parelel kesecek şekilde diktörtgeni çiz

  fill(209,53,53);//kırmızı renk al
  rect(150,280,330,10);//mavi çizginin en üstüne gelecek şekilde çiz

  fill(255,255,255);//beyaz renk al
  rect(150,290,330,10);//almış olduğun beyaz renkle kırmızı ve mavi boyayı ayır

  fill(255,255,255);//beyaz boyayı al
  rect(150,330,330,5);//mavi diktörtgeni ortalayacak biçimde ayır


} 


