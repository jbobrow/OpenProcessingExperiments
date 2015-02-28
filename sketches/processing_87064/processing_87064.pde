
Dorkey d;



void setup() {
  d = new Dorkey();
  size(320, 480);
} 

void draw() {
  d.dorkey();
  d.noseColor();
  d.eyebrows();
  d.feed();  
}


class Dorkey{


int x = 500;
int y = 100;
int z = 287;

int ang = 135;
int x1 = 35;
int x2 = 290;

int r = 0;
int g = 255;
int k = 0;

int a = 70;
int b = 160;



Dorkey(){
int x = 500;
int y = 100;
int z = 287;

int ang = 135;
int x1 = 35;
int x2 = 290;

int r = 0;
int g = 255;
int k = 0;

int a = 70;
int b = 160;
}


void dorkey(){
  background(255);
  
  //body
  rectMode(CENTER);
  rect(width/2, height/2, 170, 150);
  
  //Eyes
  ellipse(width/4, 160, 80, 80);
  ellipse(width/4*3, 160, 80, 80);

  //leftEyeBall
  float ax = map (mouseX, 0, width, 60, 100);
  float ay = map (mouseY, 0, height, 143, 185);

  fill(0);
  ellipse (ax, ay, 30, 30);
  //righteyeBall
  float bx = map (mouseX, 0, width, 220, 260);
  float by = map (mouseY, 0, height, 143, 185);

  fill(0);
  ellipse (bx, by, 30, 30);

  //Mouth
  fill(255);
  stroke(255, 0, 0);
  strokeWeight(10);
  rect(width/2, z, y, 30);
  //reset
  stroke(0);
  strokeWeight(1);
 
  //Legs
  beginShape();
  vertex(width/3, height/3*2);
  vertex(width/3-20, height/3*2);
  vertex(width/3-30, height/3*2+20);
  vertex(width/3+10, height/3*2+20);
  endShape(CLOSE);


  beginShape();
  vertex(width/3*2+20, height/3*2);
  vertex(width/3*2, height/3*2);
  vertex(width/3*2-10, height/3*2+20);
  vertex(width/3*2+30, height/3*2+20);
  endShape(CLOSE);

//Hands
  triangle(75, height/2, 50, height/2-15, 50, height/2+15);
  triangle(245, height/2, 270, height/2-15, 270, height/2+15);
  ;
}





void noseColor(){
   //noseColor
  fill(r, g, k);
  ellipse(width/2, height/2, 20, 20);
  fill(255); 
  
 r++;
 if (r>=255) {
    g--;
  }
  if (g<0) {
    k++;
  } 
  
  if(r>=255 && k>=255 && g<=0){
   r=0;k=0;g=255;
  }
}






void eyebrows(){
   //Eyebrows
noFill();
strokeWeight(5);

  map(ang, 0, height, 90, 135);
  if (mousePressed && (mouseButton == RIGHT) && ang>110) {
    ang--;
    x1++;
    x2--;
  } 
   if (mousePressed && (mouseButton == RIGHT)) {
    fill(255,0,0);
    text("Don't make me angry!!!", 10, 30); 
    noFill();}
  
  beginShape();
  vertex(x1, ang);
  vertex(80, 110);
  vertex(120, 135);
  endShape();
  
  beginShape();
  vertex(195, 135);
  vertex(240, 110);
  vertex(x2, ang);
  endShape();
  
  fill(255);
  strokeWeight(1);
  
  fill(255); 
}







void feed(){
  
  if (mousePressed && (mouseButton == LEFT)) {
    //ResetEybrows
      if (ang<135) {
    ang++;
    x1--;
    x2++;
  } 
    //feed
    if (x>280) {
      fill(0);
      text("omnomnom...", 10, 30); 
      x=x-4;
      y=100;
      z=height/5*3;
    } 
    else {
      x=height;
        fill(0);
    }

    if (x<320) {
      fill(0);
      text("arghm", 10, 50); 
      y=y-40;
      z=z-9;
    }
  }
  
  if (mousePressed==false){
   
    fill(#17761A);
 text("Feed me!", 10, 30);  
}
  
  fill(#FF4A03);
  //food
  ellipse(width/2, x, 30, 15);
  fill(255); 
}
}

