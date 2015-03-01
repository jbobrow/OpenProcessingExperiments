
float s;  //declare a variable (for size of ball)

float fx,fy; //declare follower variables fx, fy

void setup(){ //set initial values

   size(700,700);
   background(0); //set initial background
   fill(0,255,0); //set initial ball color to Green
   
   s = 100; //set initial ball size
    
}

void draw(){ 
  
fx += (mouseX - fx) * .05; //ease between x values
fy += (mouseY - fy) * .05; //ease between y values

if(mousePressed) {
  
  s = random (10,250);
  fill(random (255), random(255), random(255)); 
  //if mouse pressed the ball changes to a random color
}

if (mouseButton == RIGHT) {
    s = 100;
    fill(0,255,0);  
    //if right clicked, turn back to size 100 and to color Green
}
  background(0); //refresh background to hide trails
  noStroke();   //dont draw stroke
  ellipse(fx,fy,s,s); //ball
  
}




