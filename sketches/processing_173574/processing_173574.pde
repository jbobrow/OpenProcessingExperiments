
//import processing.pdf.*;

size(750,500);
//beginRecord( PDF,"DIBUJO FIJO 5.pdf");
background(255);


for( int x=15; x< height; x= x+12){
  
  

  
 noFill();
 stroke(random(255),random(255),random(255),50);
 strokeWeight(random(251));
  rect(x-150,x-150,x+300,750);
   rect(random(x-150),random(x-150),random(x+300),random(750));
  


}

for(int x= 0; x<width; x=x+1){

fill( random(255),random(255),random(255),3);
stroke(random(150),random(150),random(150),3);
rotate(random(150));
strokeWeight(1);
point( random(x-350),random(x+300));

strokeWeight(1);
rotate(15);
fill(150,random(201),random(35),20);
stroke(random(x+50),random(250),x+200);
ellipse(random(150),random(320),random(750),random(501));

}
for(int x=250; x <= width; x= x+1){
  translate(150,800);
  fill(random(x+52),random(x-52),random(x+255),2);
  stroke(random(x+254),random(x-255),random(201),2);
  strokeWeight(random(x+1));
  ellipse(random(x-100),random(230),random(x-500),x+250);
}

//endRecord();
