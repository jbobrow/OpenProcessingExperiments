
void setup(){
size(720, 480);  
background(204); 
noStroke();

}

void draw(){
  
// bottom hair
fill(118, 89, 60); 
rect(380, 250, 120, 200); 
rect(200, 250, 120, 200);

//head
fill(249, 223, 163); 
ellipse(350, 250, 300, 300);
 
//top hair
fill(118, 89, 60);
ellipse(350, 130, 150, 60);

//eyes
fill(255); 
ellipse(400, 200, 60, 60);
fill(255); 
ellipse(300, 200, 60, 60);

//pupil
fill(0, 0, 255); 
ellipse(400, 200, 20, 20);
fill(0, 0, 255); 
ellipse(300, 200, 20, 20);

//body
fill(249, 223, 163);
rect(290, 300, 120, 200); 
fill(255); 
ellipse(350, 480, 300, 60);


//mouth
fill(255, 0, 0, 160);
ellipse(350, 300, 80, 33);

}
