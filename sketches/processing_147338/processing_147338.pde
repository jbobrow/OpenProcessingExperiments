
/* @pjs preload="wave.jpg"; */

float x = 0;
float y = 0;
float xspeed = 1;
float yspeed = 3.3;



int counter = 0;
int last = 0.2;
int xval, yval, the_color, rand_mouth;
 


void setup(){
  size(500,500);
  smooth();
  PImage img;
  img = loadImage("wave.jpg");
    background(img,0,0,500,500);
    filter(INVERT);
   boat= loadImage("boat.png");
   sunk= loadImage("sunk.jpg");
   fish= loadImage("fish.png");
   puffer= loadImage("puffer.JPG");
   yellow= loadImage("yellow.jpg");
   shark= loadImage("shark.jpg");
   dog_01= loadImage("dog_01.jpg");
   dog_02= loadImage("dog_02.jpg");
   peter=loadImage("diver.png");
  water=loadImage("Underwater.jpg");
}

Void draw(){
  



  for (int i = 5; i < height; i += 5) {
  stroke(0);   // Set the color to white
  if (i < 35) {  // When 'i' is less than 35...
    stroke(0);   //...set the color to black
  }
  line(0, i, 80, i);
}
ff
  counter = millis()/1000;
   
  xval = random(380,480);
  yval = random(500);
      
   
  if(last<=counter){
    rect(0,0,50,500);
    if (last+1<=counter){
      rand_mouth = random(0,0.4);
      last=millis()/1000+rand_mouth;
    }
  }
   
   
  for(int i=120;i<160;i+=20){
    the_color = random(255);
    fill(the_color, the_color, 255, 127);
    noStroke();
    rect(400, i, 300, 20);
  }
   
  for(int i=160;i<260;i+=20){
    the_color = random(255);
    fill(the_color, the_color, 255, 127);
    noStroke();
    rect(400, i, 250, 20);
  }
   
  // random colored lines
  noStroke();
  colorMode(HSB);
  for(int i=0;i<500;i+=2){
    the_color = random(255);
    stroke(the_color, 100, 200, 10);
    line(i,0,i,500);
  }
   
  if (counter >=5 && counter <= 40){
    image(boat,50+(counter*30),300);
    noStroke();
  }
  if (counter>16 && counter<=35){
    image(sunk,0,0,500,500);
    if(mousePressed==true){
      image(fish, mouseX-75,mouseY-75,150,150);
      println("SUCCESS!!"); 
  }
  }
   if (counter >=18 && counter <= 35){
    image(boat,0, 100+(counter*10),200);
  }
   println(counter);
  println(last);
  
  
    if (counter>38 && counter<=40){
    image(puffer,0,0,500,500);
    }
    if (counter>41 && counter<=43){
    image(yellow,0,0,500,500);
    }
    if (counter>44 && counter<=46){
    image(shark,0,0,500,500);
    }
    if (counter>47 && counter<=49){
    image(dog_01,0,0,500,500);
    }
      if (counter>50 && counter<=52){
    image(dog_02,0,0,500,500);
    }
       if (counter>54 && counter<=90){
    image(water,0,0,500,500);
     if(keyPressed){
    if (key == 's') {
      image(peter, mouseX-75,mouseY-75,150,150);
  }
  }
    
       } 
}



