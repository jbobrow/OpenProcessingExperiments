
/*
3rd assigment by Noelia Luaces
Description: The ellipses represents random doodles with a pencil, the points
represent little paint splatters and the random triangles represents the final work.
*/

/*
instructions
MOUSE
mouse pressed: draws triangles accordinly to the mouse position. 
              Also, colored points are drawed randomly.

KEYS
del, backspace: erase
s: save png
E, e: draws an ellipse based randomly on the mouse position
*/

//Globan Variables
color strokeColor = color(#F4F764);
color[] palette = 
{#FF6138, #FFFF9D, #BEEB9F, #79BD8F, #00A388};

//setup()
void setup(){
  size(800, 600);
  noFill();
  background(#E8EAE6);
}

//draw()
void draw(){
    
  if (mousePressed){

    strokeWeight(2);
    stroke(#FFFFFF);
    
    triangle(mouseX + random(30), mouseY +random(75), mouseX+random(58), mouseY+random(20), mouseX+random(86), mouseY+random(75));
         
    float r = random(1,5);
    strokeWeight(random(10));
    stroke(palette[int(r)]);
    beginShape();
      float x = random(width);
      float y = random(height);
      vertex(x,y);
    endShape();

  }
}

//keyReleased()
void keyReleased(){
  
  if(key == DELETE || key == BACKSPACE) background(#E8EAE6);
  if(key == 's' || key == 'S') saveFrame("finalwork.png"); 
   
}

//keyPressed()
void keyPressed(){
  if(key == 'e' || key == 'E'){
   stroke(#C0C0C0);
   strokeWeight(1);
   ellipse(random(mouseX), random(mouseY), random(mouseX), random(mouseY));
  }

}

