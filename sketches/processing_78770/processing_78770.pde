
//definitions for the sketch
float spin = 0.0;

void setup(){
  size(300,200);
  
  background(0);
  noStroke();
}

void draw(){
  background(0);
  

 
  //bedingung was gemacht wird wenn maus gedrückt
  if(mousePressed){
    ellipse(mouseX, mouseY, 10 + random(40,90), 30 + random(40,120));
  }else{
    fill(255);
  }
  
  if(!mousePressed){
        ellipse(20,20, 10 + random(40,50), 30 + random(40,50));
  }
    
  //mouseX
  //mouseY   wo die Mouse sich befindet
  //ellipse(mouseX, mouseY, 10 + random(40,70), 30 + random(40,70));
  spin += 1.0;
  
}
