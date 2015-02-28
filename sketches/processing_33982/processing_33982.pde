

//PImage ckddn; 
PImage ckddn2;
int posx;
int posy;
float EyesPosx;
float EyesPosy;
float ballsize;

void setup (){
  size(700,500);
  background(0);
  ckddn2 = loadImage ("ckddn2.png");
  noStroke();
  smooth();
 
}
 
void draw(){
   
  float r =map(mouseX,0,width,0,255);
  float g =map(mouseY,0,width,0,255);
  //bg
  fill(r,g,100);
  rect(0,0,width,height);
  //whiteeyes
  fill(255);
  rect(150,150,150,50);
  //eyes
  float leftEyePos = map(mouseX,0,width/4,124,148);
  float rightEyePos = map(mouseX,0,width/2,255,275);
  fill(0);
  ellipse(leftEyePos,183,20,20);
  ellipse(rightEyePos,183,20,20); 
  //monroe
 // image(ckddn,0,0);
  
  
  //mouse position MAPPING
  EyesPosx = map(mouseX, 0, width, 160, 180);//-21
  EyesPosy = map(mouseY, 0, height, 170, 185);//-14
 
  ckddn2 = loadImage("ckddn2.png");
  image(ckddn2, 0, 0);
 
 
  if (mousePressed == true) {
    tint(random(100,255), 0, 0);
    //ckddn = loadImage("ckddn.png");
       
//    noTint();
//    myImage = loadImage("superman.png");
 
 
    stroke(255,70,10,random(255));
    strokeWeight(9);
    line(EyesPosx+9, EyesPosy+8, mouseX-5, mouseY);
    line(EyesPosx+147, EyesPosy+8, mouseX+5, mouseY);
     
    noStroke();
    fill(255,70,10,random(150,255));
     
    ballsize = random(20,70);
     
    ellipse(mouseX,mouseY, ballsize, ballsize);
     
  }
 
  if (mousePressed == false){
  noTint();
  }
}
 

 

   


