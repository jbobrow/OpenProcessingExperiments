
//QUESTION 1

void setup(){
  size(195,102);
  smooth();
  
  int x = 50;
  int wh = 100; //Width and height.
while (wh > 3){  // The diameter must not be under 4. 
ellipse(x,50,wh,wh); 
wh /= 2; //the width and height is divided by 2
x += wh * 1.5; //Here I've made the x-value higher to move the smaller ellipse to the right
  }
}

