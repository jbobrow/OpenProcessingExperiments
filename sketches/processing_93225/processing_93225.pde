
PImage motif1; PImage motif2; PImage motif3; PImage motif4;
boolean paused = false;
float genius;


void setup(){
  size(800,800);
  background(20);
  noStroke();
  loop();
  motif1 = loadImage("06(1).png");
  motif2 = loadImage("02.png");
  motif3 = loadImage("photo.png");
  motif4 = loadImage("01.png");
}

void keyPressed(){
  if (key == ' '){
    //if (paused) means that paused == true;
    //make the program restart again
    if (paused==true){
      paused = false;
    }
    else{
    paused = true;
    }
  }
      if (key == 'c'){
      background(20);
    }
}

void draw(){
  if(!paused){
  genius = random(-50, 2.0);
  image(motif2, random(width), random(height), motif2.width/genius, motif2.height/genius);
}
  if(!paused){
  genius = random(-50, 1.0);
  image(motif1, random(width), random(height), motif1.width/genius, motif1.height/genius);
  
  fill(random(30,70),random(120,170),random(100,200));
  ellipse(random(0,800),random(0,800),genius,genius);
  rect(random(0,800),random(0,800),genius,genius);
  
  image(motif3, mouseX, mouseY, motif3.width/genius/5, motif3.height/genius/5);
  }
 
  fill(30,20);
  rect(0,0,800,800);
  
  stroke(0);
  line(700,100,mouseX,mouseY);
  line(100,700,mouseX,mouseY);
  
  stroke(60);
  line(100,100,mouseX,mouseY);
  line(700,700,mouseX,mouseY);
 
}
void mousePressed(){
  image(motif4, mouseX, mouseY, motif4.width/5, motif4.height/5);
  fill(200,0,100);
  ellipse(random(0,800),random(0,800),500,500);
}


