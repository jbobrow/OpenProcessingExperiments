
int i; //interation variable

void setup (){
  size(500,500); //size of the page
  background(0); //color of the page
  frameRate(5); //how fast the point comes
  strokeWeight(7); //how wide the point 
}

void draw (){
  if(random(0,2)<0.8){ //pick a color
    stroke(234,24,87); //color
  } else {  
    stroke(245,163,40); //color
  }
  for (i=0;i<20;i++){ //makes 20 points
    point(random(1,499),random(0,500)); //random  
    stroke(75,191,188); //color
  }
}



