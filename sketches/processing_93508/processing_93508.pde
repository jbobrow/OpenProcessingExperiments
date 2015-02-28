

PImage motif1;
int y = 0;
boolean paused = false;
float genius;

void setup(){
  size(1000,1000);
  background(0);
  noStroke();
  loop();
  motif1 = loadImage("design4 copy.png");
}

void keyPressed(){
  if (key == ' '){
    if (paused==true){
      paused = false;
    }
    else{
    paused = true;
    }
  }
     if (key=='c'){
       background(0, 40);
     }
}     

void draw(){
  if (!paused){
    genius = random(0, 2.0);
    image(motif1, random(width), random(height), motif1.width*genius, motif1.height*genius);
  }
  y = constrain(mouseY,0,999);
  for (int i = 0; i<499; i++) {
    color c = get(i, y);
    stroke(c);
    line(i+500,0,i+500, 1000);
  }
  stroke(255);
  line(0,y,499,y);
} 


