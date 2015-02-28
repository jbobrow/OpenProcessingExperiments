
//use with songs "Theme From Norfiell" by Tiesto on Red album
            //or "Eat It Raw" by Infected Mushroom on Vicious Delicious


float angle = 0;
float rad = 0;

void setup(){
  size(1000,500);
  background(35,31,32);
  smooth();
}
 
 
void draw(){
   strokeWeight(1);

// Sunflower Spiral
   float x = rad*cos(radians(angle));
   float y = rad*sin(radians(angle));  
         
   stroke(0, 100, 200);
   angle+=12;
   ellipse(x+200,y+200,5,5);
   rad+=.5; //////this is important

// Green Square
   stroke(61,255,99);
   noFill();
   strokeWeight(.5);
   angle+=2;
   rect(x+200,y+200,590,512);
   angle++; 
}

