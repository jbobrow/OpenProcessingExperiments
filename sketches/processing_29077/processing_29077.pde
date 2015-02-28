
void setup() {
  size(600,600);
  smooth ();
  noFill();

}
 
 
void draw () {

  background (255);

  
  
 float hand_1 = height/2-200;
 float hand_2 = height/2+200;
 float zweiteMitte = width/2+75;

 
// Stange

  noFill();  
  stroke(0);
  strokeWeight(7);
  line (0,height/2-50,width, width/2-50);
  
  
  
//Hand rechts

  beginShape();
  noFill();
  stroke(0);
  strokeWeight(4);
    curveVertex (height/2,height/2+50);    
    curveVertex (373,width/2+60);
    curveVertex (450,width/2+90);  
    curveVertex (hand_2, width/2-50);
    curveVertex (width,50);
  endShape ();
  
    fill(0);
  ellipse(hand_2,width/2-50,20,20);
  
  
  
  
//Hand links

  beginShape();
  noFill();
  stroke(0);
  strokeWeight(4);
    curveVertex (height/2,height/2-50);    
    curveVertex (226,width/2+60);
    curveVertex (150,width/2+90);  
    curveVertex (hand_1, width/2-50);
    curveVertex (width-300,640);
  endShape ();
  
  fill(0);
  ellipse(hand_1,width/2-50,20,20);
  
  
 
// Bein links
  
  beginShape();
   noFill();
  stroke(0);
  strokeWeight(4);
    curveVertex (height/2, 400);    
    curveVertex (width/2-30,440);
    curveVertex (width/2-30,580);  
    curveVertex (width/2-80,500);
  endShape ();
  
  fill(0);
  ellipse(width/2-40,580,20,20);
  
  
  
// Bein rechts
  
    beginShape();
   noFill();
  stroke(0);
  strokeWeight(4);
    curveVertex (height/2, 400);    
    curveVertex (width/2+30,440);
    curveVertex (width/2+30,580);  
    curveVertex (width/2+80,500);
   endShape ();
  
  fill(0);
  ellipse(width/2+40,580,20,20);
  
   

  
// Kreis Mitte

fill(0);
  noStroke();
  ellipse(height/2,zweiteMitte,150,150);
  

  
  
  
//Augen

  fill(255);
  stroke(1);
  ellipse(height/2-50,width/2+20,50,50);
  ellipse(height/2+50,width/2+20,50,50);
  ellipse(height/2+50,width/2+20,5,5);
 ellipse(height/2-50,width/2+20,5,5);
    
    



 
  if(mousePressed== true){
     background(255);
     

// Stange

noFill();

  stroke(0);
  strokeWeight (7);
 line (0,height/2-50,width, width/2-50);
  
    
//Hand rechts

  beginShape();
  noFill();
  stroke(0);
  strokeWeight(4);
    curveVertex (height/2,height/2+50);    
    curveVertex (373,width/2-40);
    curveVertex (428,width/2+50);  
    curveVertex (hand_2, width/2-50);
    curveVertex (width,50);
  endShape ();
  
    fill(0);
  ellipse(hand_2,width/2-50,20,20);
   ellipse (408,306+random(-3,3),20,20);
  
  
  
//Hand links

  beginShape();
  noFill();
  stroke(0);
  strokeWeight(4);
    curveVertex (height/2,height/2-50);    
    curveVertex (226,width/2-40);
    curveVertex (180,width/2+50);  
    curveVertex (hand_1, width/2-50);
    curveVertex (width-300,550);
  endShape ();
  
  fill(0);
  ellipse(hand_1,width/2-50,20,20);
  ellipse (196,306+random(-3,3),20,20);
  
  
  
  
 translate(0,-100);
 
 
// Bein links
  
  beginShape();
   noFill();
  stroke(0);
  strokeWeight(4);
    curveVertex (height/2, 400);    
    curveVertex (width/2-30,440);
    curveVertex (width/2-30,580);  
    curveVertex (width/2-80,500);
  endShape ();
  
  fill(0);
  ellipse(width/2-40,580,20,20);
  
  
  
// Bein rechts
  
    beginShape();
   noFill();
  stroke(0);
  strokeWeight(4);
    curveVertex (height/2, 400);    
    curveVertex (width/2+30,440);
    curveVertex (width/2+30,580);  
    curveVertex (width/2+80,500);
   endShape ();
  
  fill(0);
  ellipse(width/2+40,580,20,20);
  
 
  
// Kreis Mitte

fill(0);
  noStroke();
  ellipse(height/2,zweiteMitte,150,150);
  

  
//Augen

  fill(255);
  stroke(1);
  ellipse(height/2-50+random(-3,3),width/2+20,50,40);
  ellipse(height/2+50+random(-3,3),width/2+20,50,40);
  ellipse(height/2+50+random(-3,3),width/2+20,2,2);
 ellipse(height/2-50+random(-3,3),width/2+20,2,2);

}
}

