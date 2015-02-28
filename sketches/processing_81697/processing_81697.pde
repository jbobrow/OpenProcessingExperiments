
String message = "Apart from what is produced, we have to say that everything in a virtual world is, first of all, a cultural construct ";
PFont f;
float t = 0.;

float theta = 0;

void setup(){
  size(900,900,P3D);
  f = createFont ("Georgia", 40, true);
  textFont(f);
  textAlign(CENTER);
}

void draw(){
  background(255);
  translate(width/2,height/2);
  
  pushMatrix(); 
  
       rotateY(PI*mouseX/width); 
       rotateX(PI*mouseY/width); 
       
    strokeWeight(2);
    stroke(0);
    fill(0,0,0,0);
    
    beginShape(TRIANGLES);
    for(int i = 10; i < width/2; i+=20){
      vertex(0,-i);
      vertex(-i,i);
      vertex(i,i);
    }
    endShape();
      
       rotateY(PI*mouseY/width); 
       rotateX(PI*mouseX/width);  
    ellipse (0,0,300,300); 
    noStroke();
    fill(noise(t)*255,noise(t)*255);
    ellipse (0,0,250,250);
    
    
   popMatrix();
    
   pushMatrix(); 
    rotateY(t/3);
    rotate(t/2);
    fill(0);
    int x = 10;
    for (int j = 0; j < message.length(); j++){
      textSize(random(12,36));
      text(message.charAt(j),-x,0);
      x += textWidth(message.charAt(j));
    }
       
    popMatrix();
    
    
    t+=0.07;
  
}

