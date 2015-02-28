
void setup(){
size(500, 880);
background(255);
smooth();

strokeWeight(2);

}

void draw(){
stroke(141,143,204); 

//body
fill(188,239,229);
rect(160,400,180,230);

//arms and legs
rect(130,415,30,20);
rect(340,415,30,20);

rect(108,430,20,230);
rect(372,430,20,230);

//shoulders
fill(252,210,227);
ellipse(382,425,40,40);
ellipse(118,425,40,40);

//outer stomach circle
ellipse(250,500,130,130);  

// inner circle stomach
fill(141,143,204);
ellipse(250,500,60,60); 

//legs
fill(188,239,229);
rect(180,630,20,180);
rect(300,630,20,180);


//head and neck 
triangle(mouseX,mouseY,210,400,270,400);
ellipse(mouseX,mouseY,180,60);


//eye
fill(252,210,227);
ellipse(mouseX,mouseY,50,50);
fill(141,143,204);
ellipse(mouseX,mouseY,30,30);

//feet
fill(210,187,228);
rect(175,810,30,40);
rect(295,810,30,40);
  
}

