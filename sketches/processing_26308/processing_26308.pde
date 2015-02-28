
//Function Golden Crystal Jesus


PImage Jesus;

void setup(){
  size(500,500);
  background(1);
}

void draw(){
  for(int i =0; i <10; i +=10){
  cJ(200,300,i);
  }
}

void cJ(int x, int y, float radius){
    beginShape();
    Jesus = loadImage("crystalJesus.jpg");
  for(int i =0; i <= 1000; i++){ // "i" is number of sides
    float yHex= sin(radians(i * 60)) * radius + y; 
    float xHex = cos(radians(i * 60)) * radius + x;
    vertex(xHex,yHex);
    tint(255,255,random(255));
    image(Jesus,width/2,height/2);
    rotate(i);
  }
  endShape();
  
}

