
void setup (){
  size(400,400);
  smooth();
}
 
void draw(){
background(121,205,255);
ellipse(20,20,200,140);
ellipse(380,20,180,140);
ellipse(20,380,180,140);
ellipse(380,380,180,140);

fill(201,12,94);
noStroke();
ellipse(mouseX-5, mouseY-5, 10, 10);   
}

                
                
