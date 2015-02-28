
//set timer
 float timer = 0;
 float timer2 = 0;


//images
PImage c;
PImage s;
PImage h;

void setup(){
  size(600, 600);
  //meme faces
   c = loadImage("creepy.png");
   s = loadImage("serious.png");
   h = loadImage("happy.png");
}

void draw(){

 
 
  timer += 1.0;
  

  //circle
  if(mousePressed && keyPressed){
  if(key == '1')
    {
       noStroke();
    
    fill(255,0,0);
       
      ellipse(mouseX, mouseY, 30, 30);
    }
  }
  //star
  if(mousePressed && keyPressed){
    if (key == '2')
    {
      
     drawShape(mouseX, mouseY);
    }
  }
  
  if(mousePressed && keyPressed){
    if (key == '3')
    {
      if(timer > 0  && timer < 15){
     image(c, mouseX, mouseY);
      }
       if(timer > 15 && timer <30){
     image(s, mouseX, mouseY);
       }
       if(timer >30 && timer <45){
        image(h, mouseX, mouseY); 
       }
       
       if(timer >45){
         timer =0;
       }
    }
  }
  

}

void drawX(int linecolor, float x, float y) {
  stroke(linecolor);
  strokeWeight(20);
  line(x, y + 5, x + 60, y + 65);
  line(x, y +5, x + 60, y + 65);
}



void drawShape(float x, float y){  
  fill(random(0,255));
  
  ellipse(x,y,20,20);
  rect(x-35,y - 10,20,20);
  rect(x+20,y - 10,20,20);
  rect(x-10,y - 35,20,20);
  rect(x-10,y + 35,20,20); 
}



