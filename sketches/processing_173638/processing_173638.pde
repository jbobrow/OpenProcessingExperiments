
int hours;
int minutes;
int seconds;

void setup(){
  size(800, 600);
  background(0);
  smooth();
}
 
void draw(){
 hours = hour();
 minutes = minute();
 seconds = second();
 println(hours + " " + minutes + " " + seconds);
  if(hours > 12) {
   hours -= 12;
 }
 
 background(0);
 translate(400,300);
 rotate(CENTER);
 fill(#0FFCDF);       
 noStroke();
 ellipse(0,0,600,600);
 //circulo
   fill(#FCD50F);       
 noStroke();
 ellipse(0,0,300,300);
 
 //puntero rojo (hora)
  strokeWeight(7);
  stroke(#FC0F2F);
  pushMatrix();
  rotate(radians(5 * hours));
  rect(0,0,-50,0);
  popMatrix();
   //rodea al puntro rojo
  strokeWeight(6);
  stroke(40,160,100);
  pushMatrix();
  rotate(radians(5 * hours)); 
  line(0,-10,-30,-10);
  popMatrix();
   
  strokeWeight(6);
  stroke(40,160,100);
  pushMatrix();
  rotate(radians(5 * hours)); 
  line(0,10,-30,10);
  popMatrix();
   //puntero minutos (medio)
  strokeWeight(5);
  stroke(39,50,200);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(-150,0,-60,0);
  popMatrix();
   //punteros rodean al del medio (minutos)
  strokeWeight(4);
  stroke(50,50,50);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(-130,-10,-80,-10);
  popMatrix();
   
  strokeWeight(4);
  stroke(50,50,50);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(-130,10,-80,10);
  popMatrix();
   
  strokeWeight(3.5);
  stroke(50,50,50);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(-120,-20,-90,-20);
  popMatrix();
   
  strokeWeight(3.5);
  stroke(50,50,50);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(-120,20,-90,20);
  popMatrix();
  //Punteros segundos(rodean el circulo)
  strokeWeight(3.5);
  stroke(#FCE90F);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(246,0,160,0);
  popMatrix();
   
  strokeWeight(3.25);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(245,-10,160,-10);
  popMatrix();
   
  strokeWeight(3);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(245,-20,180,-20);
  popMatrix();
   
  strokeWeight(2.75);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(245,-30,200,-30);
  popMatrix();
   
  strokeWeight(2.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(245,-40,220,-40);
  popMatrix();
   
  strokeWeight(3.25);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(245,10,160,10);
  popMatrix();
   
  strokeWeight(3);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(245,20,180,20);
  popMatrix();
   
  strokeWeight(2.75);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(245,30,200,30);
  popMatrix();
   
  strokeWeight(2.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(245,40,220,40);
  popMatrix();
  
  strokeWeight(3.5);
  stroke(#FCE90F);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-246,0,-160,0);
  popMatrix();
   
  strokeWeight(3.25);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-245,10,-160,10);
  popMatrix();
   
  strokeWeight(3);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-245,20,-180,20);
  popMatrix();
  
  strokeWeight(2.75);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-245,30,-200,30);
  popMatrix();
   
  strokeWeight(2.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-245,40,-220,40);
  popMatrix();
   
  strokeWeight(3.25);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-245,-10,-160,-10);
  popMatrix();
   
  strokeWeight(3);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-245,-20,-180,-20);
  popMatrix();
   
  strokeWeight(2.75);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-245,-30,-200,-30);
  popMatrix();
   
  strokeWeight(2.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-245,-40,-220,-40);
  popMatrix();
   
  strokeWeight(3.5);
  stroke(#FCE90F);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(0,245,0,160);
  popMatrix();
   
  strokeWeight(3.25);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(10,245,10,160);
  popMatrix();
   
  strokeWeight(3);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(20,245,20,180);
  popMatrix();
   
  strokeWeight(2.75);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(30,245,30,200);
  popMatrix();
   
  strokeWeight(2.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(40,245,40,220);
  popMatrix();
   
  strokeWeight(3.25);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-10,245,-10,160);
  popMatrix();
   
  strokeWeight(3);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-20,245,-20,180);
  popMatrix();
   
  strokeWeight(2.75);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-30,245,-30,200);
  popMatrix();
   
  strokeWeight(2.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-40,245,-40,220);
  popMatrix();
   
  strokeWeight(3.5);
  stroke(#FCE90F);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(0,-245,0,-160);
  popMatrix();
 
  strokeWeight(3.25);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-10,-245,-10,-160);
  popMatrix();
 
  strokeWeight(3);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-20,-245,-20,-180);
  popMatrix();
   
  strokeWeight(2.75);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-30,-245,-30,-200);
  popMatrix();  
     
  strokeWeight(2.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-40,-245,-40,-220);
  popMatrix();
  
  strokeWeight(3.25);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(10,-245,10,-160);
  popMatrix();
     
  strokeWeight(3);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(20,-245,20,-180);
  popMatrix();
      
  strokeWeight(2.75);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(30,-245,30,-200);
  popMatrix();
    
  strokeWeight(2.5);
  stroke(50,10,100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(40,-245,40,-220);
  popMatrix();
   
   
}

