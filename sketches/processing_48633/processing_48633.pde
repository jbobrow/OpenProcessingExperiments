
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
  size(120,120);
  smooth();
}

void draw(){
  background(204);
  
  if(keyPressed){
    if((key == 'h') || (key == 'H')){ // mettre en guillemets pour déclaré la lettre sur le clavier
    line(30,60,90,60);
    }
    
    if((key == 'n') || (key == 'N')){
      line(30,20,90,100);
    }
  
   
    
  
  }
  line(30,20,30,100);
  line(90,20,90,100);
  
  



}

                
                
