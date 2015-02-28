
int count = 0;
PFont f; 
void setup() {
  size(800, 800);
  f =createFont("Helvetica",14,true);
  background(0);
  stroke(255);
}
 
void draw() {
  background(0);
  textAlign(CENTER);
  textFont(f,14);
  fill(255);
  text("Punkt finde deinen Platz!",width/2,height/2);
  count = count +1;
  ellipse(width/2, count, 10, 10); 
 
  if (count == 800) {
    count = 0;
  }
  if (count > 50){
    ellipse(width/2-15,count,10,10);
    ellipse(width/2+15,count,10,10);
  
    ellipse(random(800),count,10,10);
    
    
  }
  if (count > 100){
    ellipse(width/2 -30,count,10,10);
    ellipse(width/2 +30,count,10,10);
  }
  if (count > 150){
    ellipse(width/2 -45,count,10,10);
    ellipse(width/2 +45,count,10,10);
  }
  if (count > 200){
    ellipse(width/2 -60,count,10,10);
    ellipse(width/2 +60,count,10,10);
  }
  if (count > 250){
    ellipse(width/2 -75,count,10,10);
    ellipse(width/2 +75,count,10,10);
  }
  if (count > 300){
    ellipse(width/2 -90,count,10,10);
    ellipse(width/2 +90,count,10,10);
  }
  if (count > 350){
    ellipse(width/2 -105,count,10,10);
    ellipse(width/2 +105,count,10,10);
  }
  if (count > 400){
    ellipse(width/2 -120,count,10,10);
    ellipse(width/2 +120,count,10,10);
  }
  if (count > 450){
    ellipse(width/2 -135,count,10,10);
    ellipse(width/2 +135,count,10,10);
  }
  //--
  
  if (count > 500){
    ellipse(width/2 -150,count,10,10);
    ellipse(width/2 +150,count,10,10);
  }
  if (count > 550){
    ellipse(width/2 -165,count,10,10);
    ellipse(width/2 +165,count,10,10);
  }
  if (count > 600){
    ellipse(width/2 -180,count,10,10);
    ellipse(width/2 +180,count,10,10);
  }
  if (count > 650){
    ellipse(width/2 -195,count,10,10);
    ellipse(width/2 +195,count,10,10);
  }
  if (count > 700){
    ellipse(width/2 -210,count,10,10);
    ellipse(width/2 +210,count,10,10);
  }
  if (count > 750){
    ellipse(width/2 -225,count,10,10);
    ellipse(width/2 +225,count,10,10);
  }
  
  
  
}

