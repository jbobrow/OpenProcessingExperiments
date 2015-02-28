
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
float x=0;
float y=0;
float x1=0;
float y1=0;
float speed = 0.5;

void setup(){
size(400,400);
smooth();
noStroke();

}

void draw(){
  background(255);
  
// la petite sphére bouge aléatoirement
   x +=speed;
   fill(219,16,70);
   ellipse(random(x,400),random(x,400),10,10);

// la grande sphére bouge en fonction de la souris
 
   fill(0);
   ellipse(x1,y1,30,30);
  
  
  
  if(keyPressed && (key== CODED)){
  if(keyCode == UP){
  y1++ ;
  }
  
  }
  
    if(keyPressed && (key== CODED)){
  if(keyCode == DOWN){
  y1-- ;
  }
  
  }
  
   if(keyPressed && (key== CODED)){
  if(keyCode == RIGHT){
  x1++ ;
  }
  
  }
  
    if(keyPressed && (key== CODED)){
  if(keyCode == LEFT){
  x1-- ;
  }
    }


  
// la grande sphére grossit petit à petit

  

// lorsque la grande sphére touche la petite sphére elle diminue de taille

// lorsque l'ecran est noir GaME OVER s'affiche
 

}
                
                
