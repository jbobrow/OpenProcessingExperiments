
void setup(){

size(600,600);

//Ocean
background (47,240,245);
  
//Ground
fill(39,4,9);
noStroke();
rect(0,500,600,300);
  
//submarine body
fill(30,35,203);
noStroke();
ellipse(400, 400, 200, 100);

//submarine window
fill(170,155,155);
noStroke();
rect(420,365,45,30);
  
//submarine pipe
fill(0,0,0);
noStroke();
rect(400,305,20,50);

//air bubble 1
fill (255);
noStroke();
ellipse(400,285,15,15);

//air bubble 2
fill (255);
noStroke();
ellipse(415,260,18,18);

//air bubble 3
fill (255);
noStroke();
ellipse(418,245,19,19);

}

void draw(){
  //air bubble 4
  fill(random(255),100,255);
  noStroke();
  if(mousePressed == true){
  ellipse(mouseX,mouseY,25,25);
  }
 
}
