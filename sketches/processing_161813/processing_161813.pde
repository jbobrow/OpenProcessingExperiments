
int counter;

void setup() {  
  size(450, 250);
  background(0);  
  colorMode(HSB);   
  counter = 0;
 
}

void draw() {  
  counter++;
  noStroke();
  fill(random(255),150,250,50);
  if(mousePressed == true) { 
  ellipse(mouseX, mouseY, 20, 20);
  }
else {
   ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
  {
  rect(220,0,10,350);
  fill(0,55,55);
  }
  
  {
  rect(300,0,10,250);
  fill(40,55,5);
  //((mouseX>100)&&(mouseY>80)&&(mouseX<300)&&(mouseY<230)){
  //fill(55,205,255);

 
}
  
}
