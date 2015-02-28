
PImage image1;
PImage image2;
PImage image3;
PImage image4;

float xpos, ypos;
//float angle=0.0;
  
void setup() {
  size(500, 500);
  smooth();
  
  image1 = loadImage("image1.png");
  image2 = loadImage("image2.png");
  image3 = loadImage("image3.png");
  image4 = loadImage("image4.png");
  
  xpos = width/2;
  ypos = height/2;
  
  //frameRate(30);
  imageMode(CENTER);
  //background(0);
}
  
void draw() {
  
  //angle += 0.1;
  
  //float s = sin(angle);
  
//  float x1 = random(width);
//  float y1 = random(height);
//  float d1 = random(50, 178);
//  
//  float x2 = random(height);
//  float y2 = random(width);
//  float d2 = random(50, 178);
//  
//  float x3 = random(100, 500);
//  float y3 = random(0, 250);
//  float d3 = random(50, 179);
//  
//  float x4 = random(0, 250);
//  float y4 = random(250, 500);
//  float d4 = random(50, 172);
  
  background(255);
  //background(x1, x2, x3);
  //background(153, 185, 109, 100);
  
  
//  for (int i = 0; i<=width; i =i + 100) {
//   for (int j = 0; j <=height; j = j + 100) {
//     
//    pushMatrix();
//    
//    float angle =atan2 (xpos-j, ypos-i);
//    float breath = map(sin(frameCount/10.0+j+i), -1, 1, 0, 178);
//    
//    translate(i, j);
//    rotate(angle);
//    tint(153, 185, 109, 100);
//    //tint(255, 100);
//    image(image3, 0, 0, breath, breath-j);
//    
//    popMatrix();
//   } 
//  }
  
  
  for (int i = 0; i<=width; i =i + 150) {
   for (int j = 0; j <=height; j = j + 150) {
     
    pushMatrix();
    
    float angle =atan2 (xpos-j, ypos-i);
    float breath = map(sin(frameCount/10.0+j+i), -1, 1, 0, 178);
    
    translate(i, j);
    rotate(angle);
    tint(255, 150);
    image(image3, xpos, ypos, breath-i, breath);
    
    popMatrix();
   } 
  }
  
//    for (int i = 100; i<=600; i =i + 150) {
//   for (int j = 100; j <=600; j = j + 150) {
//     
//    pushMatrix();
//    
//    float angle =atan2 (xpos-j, ypos-i-80);
//    float breath = map(sin(frameCount/30.0+j+i), -1, 1, 0, 178);
//    
//    translate(i, j);
//    rotate(angle);
//    tint(153, 185, 109, 100);
//    //tint(255, 100);
//    image(image3, xpos, ypos, breath, breath-j);
//    
//    popMatrix();
//   } 
//  }
  
  
//  for (int i = 0; i<=350; i =i +50) {
//   for (int j = 0; j <=350; j = j + 100) {
//    float breath = map(sin(frameCount/20.0+j+i), -1, 1, 0, 178);
//    //tint(x1, x2, x3);
//    image(image1, i, j, breath, breath);
//   } 
//  }
//  
//  for (int i = 350; i<=700; i =i + 100) {
//   for (int j = 350; j <=700; j = j + 50) {
//    float breath = map(sin(frameCount/10.0+j+i), -1, 1, 0, 178);
//    //tint(x1, x2, x3);
//    image(image2, j, i, breath, breath);
//   } 
//  }
//  
//  for (int i = 0; i<=350; i =i + 100) {
//   for (int j = 350; j <=700; j = j + 50) {
//    float breath = map(sin(frameCount/20.0+j+i), -1, 1, 0, 178);
//    //tint(x1, x2, x3, 100);
//    image(image3, i, j, breath, breath);
//   } 
//  }
//  
//  for (int i = 350; i<=700; i =i + 100) {
//   for (int j = 0; j <=350; j = j + 50) {
//    float breath = map(sin(frameCount/10.0+j+i), -1, 1, 0, 178);
//    //tint(x2, x3, x4,100);
//    image(image4, i, j, breath, breath);
//   } 
//  }

}


