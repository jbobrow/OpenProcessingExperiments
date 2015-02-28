
void setup() {
  size(screen.width,screen.height);    
 background(20);
  smooth();
  mouseX=width/2;
  mouseY=height/2;
}
void draw(){
lineabeage ();
lineacafe();
lineaocre ();
}

void lineabeage() { 
  stroke(206,180,94);

  line(width/4, height/4, mouseX, mouseY);
  line(width/1, height/1, mouseX, mouseY); 
}


void lineacafe () {
  stroke(52,43,14);
  
  line(width/2, height/2, mouseX, mouseY);
  line(width/8, height/6, mouseX, mouseY);
} 

void lineaocre () {
  stroke(178,137,2);
  
  line(width/1, height/9, mouseX, mouseY);
  line(width/22, height/15, mouseX, mouseY);
} 

  void keyPressed(){

  setup(); 
} 
