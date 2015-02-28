
void setup(){
  
  size(500,500);
  background(255); 
  
  }
  
float punkt= random(0,500); 
  
 void draw(){
stroke(255);
  fill(0);
  ellipse(mouseX,mouseY,300,300);

  fill(255);
ellipse(mouseX-50,mouseY-100,100,100);//auge links
ellipse(mouseX+50,mouseY-100,100,100);//auge rechts
fill(0);
ellipse(mouseX-50,mouseY-100,50,50);//Pupille links   
ellipse(mouseX+50,mouseY-100,50,50);//Pupille rechts 
fill(255);
arc(mouseX,mouseY+50,100,20,0,PI);//mund




if (mousePressed){
  stroke(0);
  fill(255);
  ellipse(mouseX-50,mouseY-100,100,100);//auge links
  line(mouseX-100,mouseY-100,mouseX+100,mouseY-100);
  ellipse(mouseX+50,mouseY-100,100,100);//auge rechts
  line(mouseX-100,mouseY-100,mouseX+100,mouseY-100);
  }
  
if (keyPressed){
  
  if (key==' ')
  stroke(0);
    fill(255);
    ellipse(mouseX,mouseY+47,150,150);//mund offen
    fill(0);
    triangle(mouseX-50,mouseY-50,mouseX,mouseY-50,mouseX-25,mouseY+20);//zahn
    triangle(mouseX,mouseY-50,mouseX+50,mouseY-50,mouseX+25,mouseY+20);//zahn
    arc(mouseX+10,mouseY+50,130,130,PI*0.1,PI*0.3);
    arc(mouseX-10,mouseY+50,130,130,PI*0.7,PI*0.9);
  }
  
}
 

