
float angle = 0.0;

int x = mouseX;
int y = mouseY;
color r = color(255,0,0);
float mx = width+10;
float speed = 4;
float my = random(20,480);
PShape bam;

PImage mountains;
PImage face;

PFont font;

void setup() {
  size(640,400);
  smooth();
  font = loadFont("Helvetica-48.vlw");
  bam = loadShape("BAM.svg");
  mountains = loadImage("cartoonland.jpg");
  face = loadImage("face.jpg");
}

void draw() {
  
  image(mountains,0,0,640,400);
  dragon(mouseX,mouseY);
   
    mx -= speed; 
      if (mx < 0) {
    mx = width+10;
    my = random(0,500);
  } 
   image(face,mx, my, 70, 70);
  
  pushMatrix();
  if(keyPressed && (key == CODED)) {
    if (keyCode == SHIFT) {
      image(mountains,0,0,640,400);
      translate(mouseX,mouseY);
      rotate(angle);
      fill(r);  
      triangle(x-10,y,x-10,y+20,x-60,y+20);//tail
      triangle(x,y-40,x+5,y-25,x-5,y-25);//spikeone
      triangle(x-20,y-35,x-5,y-25,x-15,y-15);//spiketwo
      triangle(x-35,y-20,x-15,y-15,x-20,y-5);//spikethree
      triangle(x-20,y-5,x-45,y,x-20,y+5);//spikefour
      ellipse(x+5,y+5,10,10);//nose

      fill(0);
      ellipse(x-5, y+25, 20, 10);
      ellipse(x+10, y+25, 20, 10); //feet

      fill(255);
      ellipse(x,y,50,50);//head

      fill(r);
      ellipse(x+5,y+5,10,10);//nose

      fill(255);
      ellipse(x,y-5,10,20);//lefteye
      ellipse(x+10,y-5,10,20);//righteye

      point(x,y-5);
      point(x+10,y-5);
      triangle(x,y+20,x+10,y+20,x+5,y+13);
      
      fill(r);
      beginShape();
      vertex(x+3,y+17);
      vertex(x+40,y-21);
      vertex(x+25,y+12);
      vertex(x+98,y+12);
      vertex(x+28,y+27);
      vertex(x+36,y+50);
      vertex(x+3,y+17);
      endShape();
      
      fill(255,0,0);
      ellipse(random(0,250),random(0,250),50,50);
  angle +=0.1;
}
  }
  popMatrix(); 
}

  
void dragon (int x, int y) {
  fill(r);  
  triangle(x-10,y,x-10,y+20,x-60,y+20);//tail
  triangle(x,y-40,x+5,y-25,x-5,y-25);//spikeone
  triangle(x-20,y-35,x-5,y-25,x-15,y-15);//spiketwo
  triangle(x-35,y-20,x-15,y-15,x-20,y-5);//spikethree
  triangle(x-20,y-5,x-45,y,x-20,y+5);//spikefour
  ellipse(x+5,y+5,10,10);//nose

  fill(0);
  ellipse(x-5, y+25, 20, 10);
  ellipse(x+10, y+25, 20, 10); //feet

  fill(255);
  ellipse(x,y,50,50);//head

  fill(r);
  ellipse(x+5,y+5,10,10);//nose

  fill(255);
  ellipse(x,y-5,10,20);//lefteye
  ellipse(x+10,y-5,10,20);//righteye

  point(x,y-5);
  point(x+10,y-5);
  triangle(x,y+20,x+10,y+20,x+5,y+13);
  
if(keyPressed && (key == CODED)) {
    if (keyCode == ALT) {
    beginShape();
    fill(r);
    vertex(x+3,y+17);
    vertex(x+40,y-21);
    vertex(x+25,y+12);
    vertex(x+98,y+12);
    vertex(x+28,y+27);
    vertex(x+36,y+50);
    vertex(x+3,y+17);
    endShape();
    }
  }
}


void mouseClicked () {
  if (mx > 0 || mx < 640) {
    mx = 640;
    background(255,0,0);
    shape(bam,60,-30);
    textSize(72);
    fill(255,255,0);
    text("BAM!",230,220);
  } else {
    my = random(0,500);
  }
}


