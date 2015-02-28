
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
float x;
int offset = 10;

void setup(){
size (240,120);
smooth();
x = width/2;
}

void draw() {
  background(200);
  if(mouseX > x){ //prendre des decisions en fonction du placement de la souris
  x += 0.5;
  }
    if(mouseX < x){
  x -= 0.5;
  }
line(x,0,x,height);


}
                
                
