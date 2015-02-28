
void setup() {
 size(500,500);
 smooth();
 background(255);

}

void draw () {
background(255);


schneeman(3 ,3,0,2);






}






void schneeman (int speedX, int speedY,int z, int c) {
 
pushMatrix(); 

 fill(0,frameCount*c,0);  
strokeWeight(1);
translate(-100,0);
translate( (frameCount *speedX)%700, (frameCount * speedY)%5);
if ((frameCount * speedX)%500 >0)
speedX=-1;
rotate(radians(z));
scale(0.8);


ellipse(120,250,100,100);
ellipse(100,170,80,80);
ellipse(100,110,60,60);

//Hut
strokeWeight(10);
fill(0,0,0);

ellipse(100,90,155,20);
rect(70,40,60,50);
ellipse(100,40,60,20);

//Augen

ellipse(90,105,5,5);
ellipse(120,105,5,5);

//Augenglanz
fill(255);
ellipse(120,105,4,4);
ellipse(90,105,4,4);

//Mund
strokeWeight(3);
line(90,120,120,115);

popMatrix();

 
  
}

