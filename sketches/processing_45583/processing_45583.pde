
      //CODE FOR THE ARTIST WHO WANTS TO USE CODE BUT DOESNT KNOW HOW TO USE IT
      //THIS IS MORE OF A TEMPLATE TO CREATE YOUR OWN IDEAS
      //ENABLES YOU TO MAKE ABSTRACT ART ON THE SCREEN TO USE IN REFRENCE FOR DRAWINGS OR PAINTSING OR WHATEVER
      //COMMENTS BELOW WILL HELP YOU UNDERSTAND WHAT PERAMERTERS YOU CAN CHANGE TO MAKE IT PERSONAL

void setup() {
  size(600, 600);
  background(255);
  smooth();
  noStroke();
}

void draw(){
  
 //vvvvvvvvvvvcomments for this part below
if((mouseX > (250) && mouseX < (350)) && (mouseY > (250) && mouseY < (350))){
fill(0);}
else{
  fill(255,0,0,1);
  strokeWeight(1);
  ellipse(300, 300, 100, 100);// shows you where the sweet spot is when nothing is moving
  textSize(10);
  fill(0);
  text("Sweet Spot",275,303);}
//^^^^this whole if statement shows you the sweet spot for where you should place the mouse when you want to make it rotate
  
  
  for(int x = 0; x < width; x+=10){
    for(int y = 0; y < height; y+=50){
      noFill();
         
  // line(y,x,y,x);        //delete the double slashes at the front of the line for a dot grid (y direction)!
     stroke(5);          //stroke color
  // line(x,y,x,y);      //delete the double slashes at the front of the line for a dot grid (x direction)!
  
 
  if (frameCount % 10 == 0) {
    
    if((mouseX > (250) && mouseX < (350)) && (mouseY > (250) && mouseY < (350))){ 
      // ^^^^^^THE SWEET SPOT TO MAKE IT ROTATE OR STOP ROTATING, WHATEVER YOU WANT^^^^^

    fill(random(100,200) * 3 % 255, random(100,200) * 5 % 255,random(100,200) * 7 % 255, random(10,200));
    //^^^^^^fill for rectangles^^^^^^^

    pushMatrix();
    translate(x*2, y*2);
    rotate(radians(frameCount * 2  % 360));
    strokeWeight(random(1,10));                     // rectangles stroke weight
    rect(x, y, (random(40,80)/2+35), random(150,200)); //THE RECTANGLE (sizes for it are the random numbers)
    ellipse(x,y,(random(10,20)), random(10,20)); //THE CIRCLE (sizes for it are the random numbers)
    fill(random(0,255));                            // fill color for text
    textSize(random(14,36));                         // text size
    text("Oh! Janice", (y-50), x/2);                //add text to your art!!!
    popMatrix();

    }
  }
}
}

}

