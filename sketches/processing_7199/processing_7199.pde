
PImage water;
int opacity = 0;


void setup(){
size(640, 480);
  water = loadImage("watercrop.png");
noStroke();
 smooth();
 imageMode(CENTER);
}

void draw(){
  float x = constrain (mouseX+10, 120, 160);
  float y = constrain (mouseY+10, 190, 250);
    
background(0);

//white 
fill(255);
ellipse(140, 220, 150, 150);


//left pupil 140, 220
fill(188, 177, 114);
ellipse(x, y, 70, 70);
fill(183, 148, 96);
ellipse(x, y, 65, 65);
fill(155, 101, 25);
ellipse(x, y, 60, 60);
fill(142, 72, 1);
ellipse(x, y, 55, 55);
fill(41, 28, 15);
ellipse(x, y, 30, 30);
fill(255, 140);
ellipse(x-10, y-10, 13, 13);

//enlarges
    if(mouseX > 120 & mouseX < 160 & mouseY > 190 & mouseY < 240){ 
     fill(188, 177, 114);
ellipse(x, y, 100, 100);
fill(183, 148, 96);
ellipse(x, y, 95, 95);
fill(155, 101, 25);
ellipse(x, y, 90, 90);
fill(142, 72, 1);
ellipse(x, y, 85, 85);
fill(41, 28, 15);
ellipse(x, y, 60, 60);
fill(255, 140);
ellipse(x-10, y-10, 33, 33);
  }
       
  float x1 = constrain (mouseX+10, 480, 520);
  float y1 = constrain (mouseY+10, 190, 250);

//white right
fill(255);
ellipse(500, 220, 150, 150);

//right pupil 500, 220
fill(188, 177, 114);
ellipse(x1, y1, 70, 70);
fill(183, 148, 96);
ellipse(x1, y1, 65, 65);
fill(155, 101, 25);
ellipse(x1, y1, 60, 60);
fill(142, 72, 1);
ellipse(x1, y1, 55, 55);
fill(41, 28, 15);
ellipse(x1, y1, 30, 30);
fill(255, 140);
ellipse(x1-10, y1-10, 13, 13);

if(mouseX > 480 & mouseX < 520 & mouseY > 190 & mouseY < 240){ 
     fill(188, 177, 114);
ellipse(x1, y1, 100, 100);
fill(183, 148, 96);
ellipse(x1, y1, 95, 95);
fill(155, 101, 25);
ellipse(x1, y1, 90, 90);
fill(142, 72, 1);
ellipse(x1, y1, 85, 85);
fill(41, 28, 15);
ellipse(x1, y1, 60, 60);
fill(255, 140);
ellipse(x1-10, y1-10, 33, 33);
}

if (mousePressed == true){
  if (opacity < 100){
      opacity+=1; 
  }
} else {
  if (opacity > 0){
 opacity-=1;  
  }
}

println(opacity);


tint(255, 255, 255, opacity);
image(water, 140, 220, 150, 150);
image(water, 500, 220, 150, 150);

}



