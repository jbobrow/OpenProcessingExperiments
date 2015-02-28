
size (300,300)
noStroke();
background(80,200,200);

float x = 0; //variable starts on left side
while(x<width) { //loop to repeat object along one row
    float y = 0; //top (left) of screen
    while (y<height){ //loop inside loop to create a grid pattern
            fill(random(100, 250)); //choose colour randomly from range provided
         rect(x,y,38,38);//rect starts out where y is/size of rectangles
      
        y=y+40; //repeats columns
    }
x= x+40; //repeats rows
}

void draw(){
  rect(mouseX, mouseY, pmouseX, 80); //shape follows mouse position
  println(mouseX);
    float y = 0;
    //applied same characteristics of background to the animation
    while (y<height){
        rect(x,y,38,38);
        fill(random(250, 10, 87));
   
          }
}

