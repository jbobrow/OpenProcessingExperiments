
int x = 120;
int y = 60;
int radius = 12;

PImage img; //call image



void setup() {
  size(400,300);
  img=loadImage("cat_burger.jpg");
  ellipseMode(RADIUS);
  smooth();
}

void draw(){
  background(255);
  
  float d = dist(mouseX, mouseY, x, y);
  
  if((mousePressed) && (mouseButton==LEFT)) // draws yellow if click
  {
    ellipse(x,y,radius,radius);
    fill(0,255,0);
    fill(255,0,0);
    rect(200,200,55,55);
    noFill();
  }else{
    fill(255);
  
  ////////////////////////////////
  
  if(d < radius) 
  { 
    noStroke();
    fill(255,0,0);
    //ellipse(200,200,50,50);
    
  }
  else
  {
    strokeWeight(3);
    stroke(0,255,0);
    fill(255);
  }
  ellipse(x,y,radius,radius);
  }
  
  ///////////
  
  if(d>175) { 
    noStroke();
    fill(255,0,255);
      rect(200,200,55,55);


    
  }
  else
  {
    image(img,50,50,width/2,height/2);
    tint(180,120);
   
  }

  
  
  
  ///////
}
 
//clear the screen
void keyPressed() {
  background(190);
    fill(37,255,90);
  radius++;
  noTint();
  image(img,0,0);
  noStroke();

}

////////////////////



