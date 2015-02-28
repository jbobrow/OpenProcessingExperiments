
void setup() {
  size(600,600);
  mouseX = 300;
  mouseY = 300;
  
}
void draw(){
  rectMode(CENTER);
  ellipseMode(CENTER);
  background(0,200,0);
  fill(150);
  
  rect(mouseX,mouseY-140,6,20);                        //Antenne
  fill(0,0,255);
  ellipse(mouseX,mouseY-155,20,20);
 
  fill(150);
  rect(mouseX-55,mouseY-100,20,30);                     //Hoofd
  rect(mouseX+55,mouseY-100,20,30);
  rect(mouseX,mouseY-110,110,50);
  rect(mouseX,mouseY-80,120,30);
  
  rect(mouseX,mouseY-60,40,10);                         //Nek
  rect(mouseX,mouseY-50,50,15);
  
  ellipse(mouseX-55,mouseY+45,23,23);                   //Armen
  ellipse(mouseX+54,mouseY+45,23,23);
  rect(mouseX-55,mouseY+24,18,30);
  rect(mouseX+54,mouseY+24,18,30);
  rect(mouseX-55,mouseY-10,20,40);
  rect(mouseX+54,mouseY-10,20,40);
  ellipse(mouseX-50,mouseY-40,35,35);        
  ellipse(mouseX+50,mouseY-40,35,35);
  
  
  rect(mouseX,mouseY,100,100);                          //Buik
  
  fill(255,0,0);                                        //Knopjes buik
  ellipse(mouseX-30,mouseY+30,20,20);  
  ellipse(mouseX+30,mouseY+30,20,20);
  
  fill(48,139,206);                                    //Schermpje
  rect(mouseX,mouseY-15,85,55);
  line(mouseX+5,mouseY-15,mouseX+20,mouseY+5);
  line(mouseX+20,mouseY+5,mouseX+30,mouseY-20);
  line(mouseX+30,mouseY-20,mouseX+42,mouseY);
  line(mouseX+5,mouseY-15,mouseX-1,mouseY-15);
  line(mouseX-5,mouseY-25,mouseX-1,mouseY-15);
  line(mouseX-15,mouseY-5,mouseX-5,mouseY-25);
  line(mouseX-19,mouseY-15,mouseX-15,mouseY-5);
  line(mouseX-23,mouseY-11,mouseX-19,mouseY-15);
  line(mouseX-35,mouseY-31,mouseX-23,mouseY-11);
  line(mouseX-43,mouseY-5,mouseX-35,mouseY-31);
  
  fill(150);
  ellipse(mouseX+25,mouseY+58,40,15);                   //Rechterbeen
  ellipse(mouseX+25,mouseY+72,40,15);
  ellipse(mouseX+25,mouseY+87,40,15);
  ellipse(mouseX+25,mouseY+102,40,15);
  
  ellipse(mouseX-25,mouseY+58,40,15);                   //Linkerbeen
  ellipse(mouseX-25,mouseY+72,40,15);
  ellipse(mouseX-25,mouseY+87,40,15);
  ellipse(mouseX-25,mouseY+102,40,15);
  
  rect(mouseX+40,mouseY+120,70,30);                     //Voeten
  rect(mouseX-39,mouseY+120,70,30);
  
  fill(255,255,255);                                    //Ogen
  ellipse(mouseX-26,mouseY-112,30,30);
  ellipse(mouseX+25,mouseY-112,30,30);
  fill(0,0,0);
  ellipse(mouseX-31,mouseY-105,15,15);
  ellipse(mouseX+20,mouseY-105,15,15);
  
  line(mouseX-40,mouseY-80,mouseX+40,mouseY-80);         //Mond
  line(mouseX-55,mouseY-95,mouseX-40,mouseY-80);
  line(mouseX+55,mouseY-95,mouseX+40,mouseY-80);
  line(mouseX-30,mouseY-95,mouseX-30,mouseY-80);
    line(mouseX-15,mouseY-95,mouseX-15,mouseY-80);
  line(mouseX,mouseY-95,mouseX,mouseY-80);
  line(mouseX+15,mouseY-95,mouseX+15,mouseY-80);
  line(mouseX+30,mouseY-95,mouseX+30,mouseY-80);

}

  

