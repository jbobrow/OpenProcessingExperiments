
void setup() {
  //background(14,188,234,50);
  background(255);

  size(500,500);
   
  
  smooth();
  noStroke();

  stroke(100);
  noFill();
  //curve(40, 40, 80, 160, 100, 100, 60, 180);
  
  fill(255,252,170,255);
  noStroke();
  ellipse(60,160,30,30);
  ellipse(85,140,30,30);
  
  ellipse(10,380,30,30);
  
  ellipse(350,70,30,30);
  ellipse(320,75,30,30);
  
  ellipse(320,250,30,30);
  ellipse(290,260,30,30);
  
  
  fill(0);
  ellipse(60,160,10,10);
  ellipse(85,140,10,10);
  
  ellipse(10,380,10,10);
  
  ellipse(350,70,10,10);
  ellipse(320,75,10,10);
  
  ellipse(320,250,10,10);
  ellipse(290,260,10,10);


  //for(int x =50 ; x<150 ;x=x+5) {
  for(int y=100 ; y<241; y+=20) {
    fill(random(100,205),random(200),random(170),100);
    //ellipse(x*x*(0.05),x,x*0.8,x*0.8);

    //ellipse(sqrt(250*250-y*y),y,y*0.3,y*0.3);
    noStroke();
    ellipse(y+70,sqrt(320*320-y*y)+80,y*0.3,y*0.3);
    stroke(100);
    line(y+70,sqrt(320*320-y*y)+80,y+100,sqrt(320*320-y*y)+120);
    noStroke();
    fill(255,0,0,200);
    ellipse(y+100,sqrt(320*320-y*y)+120,10,20);
  
  }
  for(int x=10 ; x<241; x+=20) {
    fill(random(70,200),random(10,100),random(110,180),60);
    noStroke();
    ellipse(sqrt(250*250-x*x),x-50,x*0.3,x*0.3);
    stroke(100);
    line(sqrt(250*250-x*x),x-50,sqrt(250*250-x*x)+30,x);
    noStroke();
    fill(255,0,0,200);
    ellipse(sqrt(250*250-x*x)+30,x,10,20);


    fill(random(255),random(100),random(100),60);
    noStroke();
    ellipse(sqrt(150*150-x*.5*x),x+200,x*0.3,x*0.3);
    stroke(100);
    line(sqrt(150*150-x*.5*x),x+200,sqrt(150*150-x*.5*x)+30,x+230);
    noStroke();
    fill(255,0,0,200);
    ellipse(sqrt(150*150-x*.5*x)+30,x+230,10,20);
  }

  for(int z=20 ; z<1000; z+=20) {
    smooth();
    //noStroke();

    fill(random(255),random(100),random(100),100);
    noStroke();
    ellipse(z+200,sqrt(150*150-z*z)+50,z*.5,z*.5);
    stroke(100);
    strokeWeight(1);
    line(z+200,sqrt(150*150-z*z)+50,z+230,sqrt(150*150-z*z)+100);
    noStroke();
    fill(255,0,0,200);
    ellipse(z+230,sqrt(150*150-z*z)+100,10,20);
  }
  }





