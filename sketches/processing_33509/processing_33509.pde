
void setup(){

size(800,600);
background(252,213,151);
noStroke();


}

void draw(){
  background(252,213,151);
  fill(255);
ellipse(250,200,100,100);
ellipse(550,200,100,100);
fill(0) ;
if(mouseX-150>200&&mouseX+150<600){
  
  if(mouseY>150&&mouseY<250){
ellipse(mouseX-150,mouseY,30,30);
ellipse(mouseX+150,mouseY,30,30);
}
   else{

ellipse(250,200,30,30);
ellipse(550,200,30,30);


}

}


/*ellipse(mouseX-150,mouseY,30,30);
ellipse(mouseX+150,mouseY,30,30);
if(mouseX-150<150){ellipse(150,mouseY,30,30);
                   ellipse(450,mouseY,30,30);}*/


}

void mousePressed(){

triangle(300,300,500,300,400,400);
}

