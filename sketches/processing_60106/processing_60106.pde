
PImage bear; //Declaring
PImage thing;
void setup(){
  size(600,600);
  background(300,300,300);
  smooth();
 bear= loadImage("black-gummyy5.png"); 
  imageMode(CENTER);
  
  thing= loadImage("colsmall.png");
  
}
void draw(){
    image(thing,width/2,height/2,mouseX,mouseY);
      //image(thing,width/4,3*height/4,mouseX,mouseY);
        //image(thing,3*width/4,height/4,mouseX,mouseY);
          //image(thing,3*width/4,3*height/4,mouseX,mouseY);
  //image(bear,width/2,height/2,mouseX,mouseY);
  

  
  
  
}

void mouseClicked(){
ellipse(height/2,width/2,2000,2000);

}

