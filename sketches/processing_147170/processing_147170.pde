
PImage img;
color color_selected;
int shape_selected;
int sizee = 20;


void setup() {
  size(570, 550);
  img = loadImage("book.jpg");
 }
 

 
void draw() {

  textSize(32);
  text("Press A to begin or Reset", 50,525);
  
 if (keyPressed && key == 'a'){
   image(img,0,0);
 }
 
 
  line(0,474,570,474);
  fill(color_selected);
  rect(500,474,100,100);
   
   
   //brush size
   if (keyPressed){
   if (key == '+'){
   sizee = sizee + 5;
 }
 
 if (key == '-'){
   sizee = sizee - 5;
 }
   }


  //Picks color
  if(mousePressed == true && mouseButton == RIGHT&& mouseY< 474 )
      {
        color_selected = get(mouseX,mouseY);     
        
      }
 //cursor
 else if (mouseButton == LEFT && mousePressed){
          fill(color_selected);
          noStroke();
          ellipse(mouseX,mouseY, sizee, sizee);
 }

}
    
 
 

 //474 color_selected = get(mouseX,mouseY);     
        //fill(color_selected);
       // ellipse(mouseX,mouseY, sizee, sizee);


