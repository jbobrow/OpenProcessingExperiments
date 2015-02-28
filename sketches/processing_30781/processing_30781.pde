
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}

           float angle=0;
void setup() {
size(500,500);
background(600,600);
smooth();
}
 
void draw() {
  if(mousePressed==true){
    angle+=0.1;
 float durchmesser=dist(pmouseX,pmouseY,mouseX,mouseY);
 
stroke(random(100,100),400,400);
translate(mouseX,mouseY);
rotate(980);
line(0,0,random(100),0);
ellipse(0,0, random(width/100), random(height/100));
}
}
void keyPressed() {
  }     
                
