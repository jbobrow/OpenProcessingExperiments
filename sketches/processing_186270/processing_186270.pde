
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
}void setup(){
size(600,600);
}

void draw(){
  background(255);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);


if ( mouseX < width/2 && mouseY < height/2) {
fill(255,0,0);
rect(0,0,width/2,height/2);

}else if( mouseX < width/2 && mouseY > height/2){
fill(0,255,0);
rect(0,height/2,width/2,height/2);

}else if( mouseX > width/2 && mouseY < height/2){
fill(0,0,255);
rect(height/2,0,width/2,height/2);

}else if( mouseX > width/2 && mouseY > height/2){
fill(0,255,255);
rect(width/2,height/2,width/2,height/2);


}
}

