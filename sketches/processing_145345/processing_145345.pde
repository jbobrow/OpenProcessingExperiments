
PImage selleck, trike, meatloaf, pyramids;
int counter = 0;
int last = 0.2;
int xval, yval, the_color, rand_mouth;

void setup(){
  size(500,500);
  frameRate(60);
  
  selleck = loadImage("selleck.jpg");
  trike = loadImage("selleck_bike.png");
  meatloaf = loadImage("meatloaf.jpg");
  pyramids = loadImage("pyramids.jpg");

}

void draw(){
  counter = millis()/1000;
  
  xval = random(380,480);
  yval = random(500);
  
  image(selleck,0,0);
  
  colorMode(RGB);
  fill(0);
  noStroke();
  
  if(counter<=last){
    rect(150,380,50,12);
  }
  
  if(last<=counter){
    rect(150,380,50,25);
    if (last+1<=counter){
      rand_mouth = random(0,0.4);
      last=millis()/1000+rand_mouth;
    }
  }
  
  
  for(int i=120;i<160;i+=20){
    the_color = random(255);
    fill(the_color, the_color, 255, 127);
    noStroke();
    rect(150, i, 120, 20);
  }
  
  for(int i=160;i<260;i+=20){
    the_color = random(255);
    fill(the_color, the_color, 255, 127);
    noStroke();
    rect(150, i, 250, 20);
  }
  
  // random colored lines
  noStroke();
  colorMode(HSB);
  for(int i=0;i<500;i+=2){
    the_color = random(255);
    stroke(the_color, 100, 200, 127);
    line(i,0,i,500);
  }
  
  if (counter >=5 && counter <= 20){
    image(trike,50+(counter*10),200);
  }
  
  if (counter>20 && counter<=35){
    image(meatloaf,0,0);
  }
  
  if (counter >=22 && counter <= 35){
    image(trike,50+(counter*10),200);
  }
  
  if (counter>46 && counter<=60){
    image(pyramids,0,0);
  }
  
  if (counter>46 && counter<=60){
    noStroke();
    colorMode(HSB);
    for(int i=0;i<500;i+=2){
      the_color = random(255);
      triangle(random(100),random(50,100),random(100,200),random(0,50),random(200,300),random(100,150));
      triangle(random(300),random(250,300),random(300,400),random(200,250),random(400,500),random(300,350));
      line(i,0,i,500);
    }
  }
  
  if (counter >=46 && counter <= 60){
    image(trike,50+(counter*6),200);
  }
  
  println(counter);
  println(last);
}


