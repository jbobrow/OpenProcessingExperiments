
void setup(){
  size(600, 600);
}


void nomove(){
fill(5, 5, 5); //black
ellipse(200, 200, 250, 250);//head
fill(255, 255, 255); //white
ellipse(250, 170, 55, 85); //right eye  
fill(255, 255, 255); //white
ellipse(150, 170, 55, 85); //left eye
fill(255, 95, 77); //red
ellipse(200, 220, 55, 45); //nose 
fill(143, 228, 252); //blue
ellipse(260, 170, 35, 45); //inner left eye
fill( 143, 228, 252); //blue
ellipse(160, 170, 35, 45); //inner left eye
}

void move(){
  
fill(5, 5, 5); //black
ellipse(320, 75, 125, 125); //right ear
fill(5, 5, 5); //black
ellipse(75, 75, 125, 125); //left ear
fill(255, 206, 247); //lightpink
ellipse(85, 87, 90, 90); //inner left ear
fill(255, 206, 247); //lightpink
ellipse(310, 87, 90, 90); //inner right ear 
}


void draw(){
background(51);
nomove (); 
translate(mouseX,mouseY); 
move();
}








