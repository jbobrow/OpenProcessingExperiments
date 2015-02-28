
void setup(){
size(300,300);
background(94,54,18);
}

int x=120;
//circle
void draw(){
fill(228,28,28);
ellipse(x,height/2,50,50);

//purpleshape
fill(130,13,151);
ellipse(mouseX,50,30,30);
background(94,54,18);


//yellow shape
fill(241,244,20);
rectMode(CENTER);
rect(x+50,height/2,30,30);

//blueshape
fill(13,41,215);
triangle(x*2,height/2,215,250,200,80);

//greenshape
fill(20,154,14);
ellipse(width-x,height/2,14,25); 

//orangeshare
fill(251,135,11);
rect(x/2,height/2,150,4);

//purpleshape
fill(130,13,151);
ellipse(mouseX,50,30,30);
}


