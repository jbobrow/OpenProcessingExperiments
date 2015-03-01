
//I call this simply my day. It usually starts quite chaotic.
//Then it´s like a screen filling with moments... nice but also not that satisfying.
//And then the night is coming, I am tired and my mind is calm.

//color palette
color [] myDay = {#55CC8D, #DCE400, #FFA21A, #F87855, #C5468B, #FFEFA0, #FFD7CD};
color[] palette = myDay;
float counter = 0;
float x =0;
float y=0;
  
//setup: background and window size
void setup() {
  size(800, 800);
  background(#C9FFCC);
  smooth();//(anti-aliased) edges
  
  
}

// draw
void draw() {
 
//create ellipses  
  while(counter < 200){
       float r = random (0, 5);
       strokeWeight(random(10));   
       stroke(palette[int(r)]);//use palette for stroke color
  fill(palette[int(random(5, 7))]);//palette for filling
    x = random (width);//ellipse location x width - random
  y = random (height);//ellise location y height - random
  float d = random (50);//random size of ellipses - but max 50
    ellipse(x, y, d, d);
    counter ++;
  }
  
  //the bottom line of rectangles
    while(counter < 500){
      float r = random (0, 7);
       strokeWeight(random(5));   
  fill(palette[int(random(5, 7))]);  
     x = random (width);//width location is set up randomly
 y=700;//height location of rectangles is 700
 float d = 100;//height of rectangle is 100
   rect(x, y, d, d);
    counter ++;       
    }
    
  //top line rectangles
  while(counter < 1000){
      float r = random (0, 7);
       strokeWeight(random(5));   
  fill(palette[int(random(5, 7))]);  
     x = random (width);
   y=0;//height of y location is 0
  float d = random (100);//random size, but max 100
   rect(x, y, d, d);
    counter ++;
        
    }
}

void keyReleased(){
if (key == 's' || key == 'S') saveFrame("screenshot.png");
}


