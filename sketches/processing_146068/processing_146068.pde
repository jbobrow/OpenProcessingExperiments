
void setup(){
  size(500,500);
  background(255);
  
  //face
  fill(0);
  ellipse(250,280,300,300);
  fill(245,223,181);
  noStroke();
  ellipse(200,250,130,180);
  ellipse(300,250,130,180);
  ellipse(250,360,300,150);
  //eye 
  fill(255);
  ellipse(210,250,70,110);
  ellipse(290,250,70,110);
  
  //ears
  fill(0);
  ellipse(120,120,130,130);
  ellipse(380,120,130,130);
  
  

  
  
}

void draw(){
  
    fill(0);
  ellipse(210,280,40,50);
  ellipse(290,280,40,50);
  
  if(mousePressed == true){ 
  fill(255,0,0);
  
}
else{
  fill(0);
};
ellipse(250,350,60,40);

if(mousePressed == true){
  PImage img;
img = loadImage("minnie.png");
image(img, 130, 10, 250, 200);
}

 


}

