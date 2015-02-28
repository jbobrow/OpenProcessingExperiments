
void setup(){
  size(500,500);
  smooth();
}

void draw(){
}

void mousePressed(){
  background(0, 114, 232);             //creates a blue background
  translate(width/2,height/2);         //brings the origin to the center
  rectMode(CENTER);                    //allows the rectangles to begin at the center
  for(int x=0; x<width/50; x++){       //x starts at zero and increases by one until it is 250 or higher
  fill(random(160,x),random(142),random(69),100);//placing an x in the red increases the chance that the fill color will be red
  stroke(255);//creates a white border around the rectangles
  rect(0, 0, random(height*1.5), random(-width*1.5));//by multiplying the height and width by 1.5 the rectangles go off the page which creates more interesting spaces
 }
}



