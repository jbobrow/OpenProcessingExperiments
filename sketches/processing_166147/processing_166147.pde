
int l1=70;

int l2;

int l3;

int x=20;

void setup() {

 size(800, 200);

 }

 

 void draw(){

 background(255, 255, 255);

 fill (255, 0, 0);

 ellipse(l1, 100, 20+sin(l1), 20);

 ellipse(l2, 100, 20+sin(l2), 20);

 ellipse(l3, 100, 20+sin(l3), 20);

 

 l2=l1-x;

 l3=l2-x;

 

 l1=l1+1;

if (l1>=690){

l1=691;

}

 line(700, 80, 710, 70);

 line(700, 80, 710, 90);

 line(710, 70, 710, 90);

 rect(711, 71, 2, 50);

 }int counter;

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
