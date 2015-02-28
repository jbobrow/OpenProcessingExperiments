
//week 4
//1337399

//A more interesting cursor than the >cursor(HAND);<
PImage hand, ring;
int spectrum;

void setup(){
 
  size(500, 500);
  textSize(30);
  background(0);
  colorMode(RGB);
  strokeWeight(10);
  smooth();
  noCursor();  
  
  hand = loadImage("hand.png");
//  ring = loadImage("ring.png");
  
  println(mouseX);
  println(mouseY);
  
}

void draw(){
  
    background(0);
  
//  image(ring, 100, 100);
     
    moodRing();

    image(hand, mouseX, mouseY);
    
    
    fill(88, 88, 188);
    text("Put your hand on the ring,", 20, 35);
    text(" see what happens!!!", 20, 75);
}

void moodRing(){
 
    //the ring... of death
    
  if(mouseX <= 270 && mouseY <= 340 && mouseX >= 140 && mouseY >= 120){
    
  background(random(255));
  text("Static* Static* I... m..ing... fo... o...", random(500) - 200, random(500) - 200); 
  stroke(random(255), random(255), random(255), random(255));
  fill(0, 0, 0, random(255));
  ellipse(250, 250, 100, 200);   
    
  stroke(random(255), random(255), random(255), random(255));
  ellipse(250, 250, 80, 180);
  
   for(int i = 0; i < 80; i+=10){
   
  stroke(random(255), random(255), random(255), random(255));
  fill(0, 0, 0, random(255));
  ellipse(250, 250, 70 - i, 160 - i);  
    
  }
  
  }else{
    
  stroke(255, 80, 80);
  fill(0, 0, 0);
  ellipse(250, 250, 100, 200);   
    
  stroke(100, 100, 255);
  ellipse(250, 250, 80, 180);
  }

}
//another time...

//void photoFilter(){
// 
//  ring.loadPixels();
//  int ringSize = ring.width * ring.height;
//  
//  for(int i = 0; i < ringSize; i++){
//  
//    color cp = ring.pixels[i];
//    float h = hue(cp);
//    float s = saturation(cp);
//    float b = brightness(cp);
//    
//    if(b > 80){
//     
//      s += 10;
//      
//    }
//    
//    if(b < 50){
//    
//      b -=30;
//      
//    }
//    
//    if(h > 60 && h < 160){
//     
//      h = 56;
//      
//    }
//    
//    ring.pixels[i] = color(h, s, b);
//    
//  }
//  
//  ring.updatePixels();
//  
//}

