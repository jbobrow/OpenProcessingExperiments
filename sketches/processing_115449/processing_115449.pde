
void setup(){
  size(400,400);
}

void draw(){
  background(255,100,235);
  translate(300,mouseY-50);
  
fill(0,0,0);
strokeWeight(5);
ellipse(85,50,55,90);
ellipse(60,75,30,30);
ellipse(60,25,30,30);

strokeWeight(3);
stroke(100,255,117);

//kao
fill(255,100,235);
ellipse(85,50,55,90);

//shirome
fill(255,255,255);
ellipse(60,75,30,30);
ellipse(60,25,30,30);

//kurome
stroke(0,0,0);
fill(0,0,0);
ellipse(60,75,10,10);
ellipse(60,25,10,10);


//te
strokeWeight(3);
stroke(100,255,117);
fill(255,100,235);
ellipse(100,87,10,25);
ellipse(100,17,10,25);


}


