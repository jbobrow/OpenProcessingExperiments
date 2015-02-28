

void setup() {
  size(300,180);
  background(0);
  noStroke();
  colorMode(HSB,1);
  smooth();
  PFont font; 
  font= loadFont("BankGothicBT-Medium-48.vlw"); 
  textFont(font); 


}

void draw() {
  if(mousePressed==true) 
  { 
    fill(pow(random(1),4),1,pow(random(1),2)); 
    background(0); 
    textAlign(CENTER,CENTER); 
    text(nf((hour()%12),2)+":"+nf(minute(),2)+":"+nf(second(),2),width/2,height/2); 

  } 

  if(mousePressed==false) 
  { 

    fill(pow(random(1),4),1,pow(random(1),2));
    ellipse(random(width),random(height),2,2);
    filter(11);
    filter(18);





    int m = minute(); 
    int h = hour();
    int s = second();
    int x;
    int b=h%12 ;

    for (x=10;x<=b*20;x+=20){
      fill(pow(random(1),4),1,pow(random(1),2));
      ellipse(x,30,10,10);
    }
    int y;
    int c=m/5;
    for (y=10;y<=c*20;y+=20){
      fill(pow(random(1),4),1,pow(random(1),2));
      ellipse(y,70,10,10);
    }
    int z;
    float a=s/5;
    for (z=10;z<=a*20;z+=20){
      fill(pow(random(1),4),1,pow(random(1),2));
      ellipse(z,140,10,10);
    }
  }
}




