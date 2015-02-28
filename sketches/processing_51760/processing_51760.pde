
PImage bear; //Declaring
PImage thing;
PImage it;
PImage other;
void setup(){
  size(600,250);
  background(300,300,300);
  smooth();
 bear= loadImage("hand1.png"); 
  imageMode(CENTER);
  it= loadImage ("hand3.png");
  other= loadImage ("hand4.png");
  thing= loadImage("hand2.png");
  
}
void draw(){
 
  
   
  

  
  
  
}

void mouseClicked(){
   float r = random(-100,700);
   float q = random(-100,700);
     float p = random(-100,700);
   float o = random(-100,700);
   float y = random(170,255);
   
 fill(y,y,y);  
  
ellipse(height/2,width/2,5000,5000);
  image(other,o,3*height/4,500,500);
 image(bear,r,3*height/4,500,500);
 image(it,p,3*height/4,500,500);
       
      image(thing,q,3*height/4,500,500);
        
  //image(bear,width/2,height/2,mouseX,mouseY);

}

