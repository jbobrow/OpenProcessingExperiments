
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
void setup (){
  size(480,120);
  smooth();
  stroke(0,102);// couleur du trait
  strokeWeight(12); // epaisseur du trait
  }
  
void draw (){
 background(200);
 
stroke(255);
line(120,60,mouseX,mouseY);

stroke(0);
/*float mx = mouseX/2 + 60;*/
float mx = map(mouseX,0,width,60,180); // map : recadrer la ligne ne peut pas allée plus loin que 180 et ne peut pas etre plus petite que 60
// map (minimum, maximum, minimum & maximum converti)
line(120,60,mx,mouseY);
}
                
                
