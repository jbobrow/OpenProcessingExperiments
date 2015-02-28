
float posicioX;
float posicioY;

void setup(){

size(1000,1000);
 posicioX =width/2;
 posicioY =height/2;
}


void draw(){
  background(250);
  
     
  dibcames();
  dibcos();
  dibcap();
  dibescopeta();
  dibmaniga();

}

void dibcos(){

fill(255,3,3);
rect(mouseX-85,mouseY-100,180,200,30,30,0,0);
  
}

void dibcames(){

fill(3,46,82);
rect(mouseX+5,mouseY+100,80,35);
fill(3,46,82);
rect(mouseX-75,mouseY+100,80,35);
  
fill(67,27,3);
rect(mouseX-75,mouseY+135,90,20);

fill(67,27,3);
rect(mouseX+15,mouseY+135,80,20);
      
}

void dibcap(){

fill(255,206,147);
rect(mouseX-55,mouseY-220,120,120,20,20,20,20);

fill(0);
ellipse(mouseX+5,mouseY-238,15,15);
fill(0);
rect(mouseX-100,mouseY-195,120,5,20,20,20,20);
fill(0);
rect(mouseX-57,mouseY-240,123,50,120,120,0,0);

fill(0);
rect(mouseX-55,mouseY-165,120,1,20,20,20,20);
fill(mouseX,25,25);
ellipse(mouseX+62,mouseY-165,25,25);
fill(mouseX,25,25);
ellipse(mouseX+22,mouseY-165,25,25);
      
}

void dibescopeta(){
  
fill(183,96,30);
quad(mouseX-40,mouseY-30,mouseX-85,mouseY+10,mouseX-60,mouseY+45,mouseX-10,mouseY-30);

fill(206,190,177);
rect(mouseX-40,mouseY-35,190,30);

fill(183,96,30);
rect(mouseX+50,mouseY-15,60,20);

fill(255,206,147);
ellipse(mouseX-35,mouseY-10,40,40);

fill(255,206,147);
ellipse(mouseX+82,mouseY-2,40,40);
      
}

void dibmaniga(){

fill(255,3,3);
quad(mouseX-15,mouseY-30,mouseX-67,mouseY-17,mouseX-80,mouseY-75,mouseX-35,mouseY-93);

}



