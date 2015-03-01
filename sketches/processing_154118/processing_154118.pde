

void setup() {  //setup function called initially, only once
  size(600, 600);
  background(255);  //set background white

}

void draw() {  //draw function loops 
 fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
 text("You know nothing, Jon Snow.",random(600),random(600));
}
