
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
void setup(){
size(240,120);
smooth();
}


void draw(){
  background(255);
  for(int x = 20; x < width; x+=20){
    float mx = mouseX/10;
    float xa = random(-mx,mx);// définir deux variables différentesn variable avec la souris
    float xb = random(-mx,mx);
  line(x+xa,20,x-xb,100);
  } // boucle
  
}
                
                
