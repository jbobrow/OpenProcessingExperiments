
float mx;
float my;
float easing = 0.1;
float x = 10;          // X-coordinate
float y = 10;         // Y-coordinate
int radius = 15;
int centre = 48;
int inner = centre + radius;
float fx = 15;
float fy = 15;
       


//float easing = 0.02;





void setup(){

size(500, 450);
smooth();
strokeWeight(10);


}




void draw(){
  background(255);
  fill(0);
  
  
  //rect(x - 95, y - 110, 200, 10); // jetpack
  //arc(x - 95, y - 75, 40, 80, PI, TWO_PI);
  //arc(x + 110, y - 75, 40, 80, PI, TWO_PI);
  
  stroke(10);
  
  
  line(mx - 40, my - 50, x - 20, y - 110);// upper legs
  line(mx + 10, my - 50, x + 10, y - 110);
  line(mx + 60, my - 50, x + 40, y - 110);
  
  ellipse(mx - 40, my -50, 20, 20); // knee joints
  ellipse(mx + 10, my -50, 20, 20);
  ellipse(mx + 60, my -50, 20, 20);
  
  noStroke();
  
  triangle(mx , my, mx - 55, my - 50, mx - 35, my - 50);// feet
  triangle(mx + 5 , my - 50, mx + 15, my - 50, mx + 10, my);
  triangle(mx + 25 , my, mx + 55, my - 50, mx + 75, my - 50);
  
  
  
  
  
  
  
  noStroke();
  
  int targetX = mouseX;
  int targetY = mouseY;
  x += (targetX - x) * easing;
  y += (targetY - y) * easing;
  ellipse(x + 10, y - 150, 100, 100); // head
  ellipse(x + 10, y - 120, 50, 100); // body
  
  
  
  if (abs(mouseX - mx) > 0.1){
    mx = mx + (mouseX - mx) * easing;
  }
  
  if (abs(mouseY - my) > 0.1){
    my = my + (mouseY - my) * easing;
  }

 
    
  fill(255); //white of eyeball
    
  ellipse(x + 10, y - 140, 50, 50);
  
  fill(0); // black for pupil
  int targetmx = mouseX;
  int targetmy = mouseY;
  mx += (targetmx - mx) * easing;
  my += (targetmy - my) * easing;
 
  ellipse(mx + 10, my - 130, 25, 25); // eye ball
  
  
  
  
  
  
  

  
}


                
                
