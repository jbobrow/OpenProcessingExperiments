
float x,y;
float s = 0.7; //Scale of Gnome

float speed = 0;
float gravity = 0.1;

void setup(){
  
  size (600,600);
  smooth();
  
  x = width/2;
  y = height/3;
  
  drawGnome();
  
  }
  
void draw(){
  
  background (87,187,240);
  
  y = y + speed;
  
  speed = speed + gravity;
  
  if (y > height - (s*200)) {
    speed = speed * -0.985;
  }
  
  drawGnome();
  
}

  void drawGnome(){
    
  noStroke();

  //Draw Body
  fill(82,144,85);
  triangle(x,y-s*200,x-s*100,y+s*200,x+s*100,y+s*200);
  
  //Draw Face
  fill(255,229,209);
  rectMode(CENTER);
  rect(x,y+s*30,s*80,s*60);
  
  //Draw Facial Features;
  fill(0);
  ellipseMode(CENTER);
  ellipse(x-s*20,y+s*20,s*10,s*10); //Left Eye
  ellipse(x+s*20,y+s*20,s*10,s*10); //Right Eye
  
  fill(255,132,121);
  triangle(x-s*10,y+s*40,x+s*10,y+s*40,x,y+s*50); //Mouth
    
  //Draw Hat
  fill(255,60,60);
  triangle(x,y-s*200,x-s*50,y,x+s*50,y);
  
  //Draw Beard
  fill(247,180,77);
  triangle(x-s*40,y,x-s*60,y+s*40,x-s*30,y+s*80); //Left Sideburn
  triangle(x+s*40,y,x+s*60,y+s*40,x+s*30,y+s*80); //Right Sideburn
  triangle(x-s*40,y+s*60,x+s*40,y+s*60,x,y+s*160); //Main Beard
  
  fill(255,198,111);
  triangle(x,y+s*30,x-s*30,y+s*40,x-s*40,y+s*100); //Left Tash
  triangle(x,y+s*30,x+s*30,y+s*40,x+s*40,y+s*100); //Right Tash
 
  //Draw Nose
  fill(255,180,200);
  ellipse(x,y+s*30,s*25,s*15);
  
  
}


