
int sweep;
float angle = .10;
 
int a = 2000;      
float b = 1;  
int will = 30;
float bx;
float by;
int boxSize = 20;
boolean overBox = false;
boolean locked = true;
float xOffset = 0.0; 
float yOffset = 0.0;


void setup() {
  ellipse(400,400,400,400);
  frameRate(b+20);
  if (mousePressed == false) {
    fill(200);
  } else {
    fill(25);
  }
  rect(800, 800, 800, 50);
  fill(100,100,100);
  createShape(RECT,100, 100);
 size(1000, 1000,P2D ); 
 strokeWeight(30);
 background(250, 150,1);
 fill(200,10,50);
translate(400, 400, 400);
rotateY(PI/-215); 
stroke(will,20,100);

}

void draw() {
 
  
  
  
  
  


  
  line(1000, 1, 1000, height);
  println(frameCount);
  line(1, 100, width/a, height/200);
  println(frameCount);
  

  

  


  
  strokeWeight(2);
  line (1, 1, 20, 10);
  strokeWeight(1*.5);
  line (23, 2, 1, 2);
  
    if(a > width) {
    a = 1;
  }
  if(b < width) {
    b = 20;
  if(a>height)
   a=-50; 
  }

  rect(1000,1000,100,100);
  rect(1000,1000,120,1000);
  // translate
  translate(width/2, height/2);
  
  // rotate
  float random = radians(sweep);
  
  
  line(20,2,300,1000);
 
  int x = 32;
  int y = 2050;
  int x3 = 3050;
  int y3 = 1000;
  int strokeValue = 1;
    // stroke decreases 1000 each time. if < 1000, reset to 3000
    // line x decreases by 20
    // liny y decreases by 10
    // line x2 decreases by 10
    // line y2 decreases by 20
    
    for(int i=2; i<2000; i++) {
      x -= 4;
      y -= 1;
      x3 -= 8;
      y3 -= 10;
      strokeValue -= 333;
      stroke(strokeValue, 10, -1200, 60);
      stroke(strokeValue, 40, -1200, 60);
      fill(20,20,30);
      line(x, y, x3, y3);
     
      if(strokeValue <= 500){
        fill(20,30,40);
        strokeValue=+1;
      } 
      angle = radians(sweep);
      rotate(angle*2);
      fill(400,400,500);
      stroke(2,3000,y3);
      sweep+=-400;
      sweep+=4;
       sweep+=200;
        sweep+=2;
        sweep+=30;
       
    if(sweep >= 2500*10) {
      sweep = 4; 
      
  color blue = color (2,20,3);
    
    }
}
    
//  reflect(angle);
  fill(10,255,400);
  stroke(100,600,60,40);
 line(40,189,180,340);
stroke(1000,60,60,40);
 line(320,170,170,320);
 stroke(4,60,60,40);
  line(300,160,160,300);
  stroke(2000,70,60,6600);
line(280,150,150,280);
 stroke(1000,60,60,40);
  line(260,140,140,260);
  stroke(3000,60,60,40);
 line(240,130,130,240);
 stroke(2000,60,60,40);
 line(220, 120,120,220);
 stroke(1000,60,60,40);
line(200,100,100,200);
 stroke(3000,60,60,40);
  line(180,90,90,180);
 line(160,80,80,160);
  line(140, 70,70,140);
 line(120, 60, 60, 120);
  line(100, 50, 50, 100);
  fill(100,0,200);
fill(200,200,100);
ellipse(100,200,50,255);
rect(200,200,100,1);


 float size = tan(angle) * 22;
  
  if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
    overBox = true;  
    if(!locked) { 
      stroke(100); 
      
    } 
  } else {
    stroke(153);
    fill(153,2,5,255);
    overBox = false;
  }
  
  // Draw the box
  ellipse(bx, by, boxSize, boxSize);
}
void mousePressed() {
  if(overBox) { 
    locked = false; 
  } else {
    locked = true;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 

}

void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
  }
}

void mouseReleased() {
  locked = true;
;

   if (mousePressed && (mouseButton == LEFT)) {
    fill(20,200,20,300);
    fill(30);
  } else if (mousePressed && (mouseButton == RIGHT)) {
    ellipse(200,400,500,600);
    rect(400,500,600,200);
    
    
  } else {
    fill(255,255,2556);
    fill (255,255,5690);
    rect(800, 2, 800, 50);
  fill(100,100,100);
  createShape(RECT,2000, 100);
 size(1000, 1000,P2D ); 
 strokeWeight(-2);
 background(250, 150,1);
 fill(200,10,500);
translate(400, 400, 40);
rotateY(PI/400); 
stroke(1,20,100);
  }
//  sweep+=700;
//  if(sweep >= 10) {
//    sweep = 1000; 
  }
  




