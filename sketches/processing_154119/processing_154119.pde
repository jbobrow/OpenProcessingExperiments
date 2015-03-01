
int counter=0;

void setup() {  //setup function called initially, only once
  size(600, 600);
  background(255);  //set background white

}

void draw() {  //draw function loops 
textSize(16);
 fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
 text("You know nothing, Jon Snow.",width - mouseX,height - mouseY);
 text("U Wot M8",mouseX,mouseY);
 text("Fite me irl",width - mouseX,mouseY);
 text("Can't touch this",mouseX,height-mouseY);
}
