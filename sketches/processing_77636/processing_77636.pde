
int counter = 0;
float x = 0;
float y= 0;

void setup () {
  size (700,700);
  smooth();
  background(0);
  frameRate(4000);
  
}

void draw() {

  
noStroke();

x = mouseX+sin(frameCount/120.0)*40;
y = mouseY+cos(frameCount/120.0)*40;

float x2 = x+sin(frameCount/30.0)*40;
float y2 = y+cos(frameCount/30.0)*40;

float x3 = x2+sin(frameCount/140.0)*130;
float y3 = y2+cos(frameCount/140.0)*150;


  fill(random (220,255), random(220,250), 0, random (90, 120));
  ellipse(x3, y2, 20, 30);
  ellipse(y2, x3, 30, 20);
  
  stroke(random (200,255), random (200,255), random (200,255), random (160));
  fill (random(250), random (20), random(200,255), random (200));
  ellipse(x2, y2*1.5, 25,25);
  ellipse(y2*1.5, x2, 25,25);
  
  stroke(0, random (180,255), random (150,220), random (100, 230));
  strokeWeight (random(1,2.5));
  line(x,y,x3,y2);
  line(y,x,y2,x3);
  
  noStroke();
  fill (random(250), random (20), random(20), random (90, 110));
  ellipse(x3, y2, 10,10);
  ellipse(y2, x3, 10,10);
  ellipse(x, y2, 15,15);
  ellipse(y2, x, 15,15);
  
  fill (random(5), random (100, 205),(255), random (20));
  ellipse(x3+140, y2-100, random(10,100),random(10,100));
  ellipse(y2-100, x3+140, random(10,100),random(10,100));
  
  
  
     if (mouseButton == RIGHT){ //New canvas
     background(0);   
     }
   
  }
  
  void keyPressed(){
if(key == 'j'){  
saveFrame(counter+".jpg");
counter++;
println(counter);
}
  }


