
PImage puppy;
PFont font;
int i;


void setup(){
 size(800, 800);
  puppy = loadImage("oskarpuppy.jpg");
  puppy.resize(600,0);
  imageMode(CENTER);
  font = loadFont("GillSans-36.vlw");
  textFont(font, 28);
  smooth();
}

void draw(){
  for(i=0; i< 1; i++){
  fill(random(255), 80, random(255));
  text("Press Enter to Begin Drawing.", 56, 570);
  text("To see the cutest puppy ever, press your UP arrow", 56, 600);
}
  if(mousePressed == true){
    stroke(50+pmouseX, 50+mouseY, 200);
    strokeWeight(.1+pmouseX);
    line(pmouseX, pmouseY, mouseX, mouseY); 
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    background(255); 
  }  
   if (keyCode == ENTER) {
    background(255); 
  }
    if (keyCode == UP) {
    image(puppy, width/2, height/2);
  }
}

//the above has to be repeated with RETURN instead of Enter because different computers use different term (i forget which is mac, which is windows)

    
    //ON MOUSECLICK, AN IMAGE GETS LOADED. ON RELEASE, IT STAYS IN THAT SPOT. 
    //THEN DO DRAWING TOOL STUFF THAT WE WENT OVER.    
void mousePressed(){  
   stroke(50+pmouseX, 50+mouseY, 200);
  line(pmouseX, pmouseY, mouseX, mouseY); 
}

