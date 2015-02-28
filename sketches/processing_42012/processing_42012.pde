
int y = 0;

  void setup() {
  size(500,460);
  noStroke();
}

void draw () {
  background(255);
  PImage img;
  img = loadImage("eyeball-larger.jpg");
  int i = img.width/1;
  int j = img.height/1;
  image (img,-170,-70,i*1.5,j*1.5);
  fill(142,17,36,80);
  ellipse(width/2,height/2,width/2.5,height/2.5);
  
  
  if (mousePressed) {
    cursor(HAND);
   
    fill(242,7,82,120);
    ellipse(width/2,height/2,mouseX,mouseY);
   fill(234,140,146,130);
    ellipse(width/2,height/2,2*mouseX/2,3*mouseY/2);
   fill(167,64,71,30);
    ellipse(width/2,height/2,3*mouseX/2,2*mouseY/2);
   fill(250,15,113,100);
    ellipse(width/2,height/2,mouseX/2,mouseY/2);
    fill(178,14,83,100);
    ellipse(width/2,height/2,mouseX/3,mouseY/3);
    fill(245,25,65,120);
    ellipse(width/2,height/2,2*mouseX/3,2*mouseY/3);
    fill(224,54,66,150);
    ellipse(width/2,height/2,3*mouseX/2,3*mouseY/2);
    fill(167,64,71,90);
    ellipse(width/2,height/2,3*mouseX/2,2*mouseY/2);
   fill(245,17,52,40);
    ellipse(width/2,height/2,mouseX/4,mouseY/4);
    
  
  }
  }

