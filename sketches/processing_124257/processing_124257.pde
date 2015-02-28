
int ballCount = 3;
float [] x = new float [ballCount];
float [] y = new float [ballCount];
float [] speedX = new float [ballCount];
float [] speedY = new float [ballCount];
float [] s = new float [ballCount];


void setup () {
  size(600, 600);
  frameRate(50);
  background(0);
  smooth();

  for (int i = 0; i<ballCount; i++) {
    x[i] = random(1, 10);
    y[i] = random(1, 900);
    speedX[i] = random(1, 15);
    speedY[i] = random(1, 15);
    s[i] = random(2,10);
  }
}
void draw() {
   background (255);
  //randomSeed(2);
  
  
 
 float mx = width/2; 
 float my = height/2; 
 


  
//Hand rechts

  beginShape();
  
  stroke(0);
  strokeWeight(3);
  line(mx+70,my+30,mx+110,my+120);
  line(mx+110,my+120,mx+110,my+160);


  endShape ();
  
  
  
  
  
//Hand links

  beginShape();
  noFill();
  stroke(0);
  strokeWeight(3);
  line(mx-50,my+30,mx-140,my+90);
  line(mx-140,my+90,mx-140,my+190);
  
  
  endShape ();
  

  
  
 
// Bein links
  
  beginShape();
   noFill();
  stroke(0);
  strokeWeight(3);
  line(mx-70,my+140,mx-90,my+240);
  line(mx-90,my+240,mx-90,my+600);
  
  endShape ();
  

  
  
  
// Bein rechts
  
    beginShape();
   noFill();
  stroke(0);
  strokeWeight(3);
  line(mx+70,my+140,mx+90,my+240);
  line(mx+90,my+240,mx+90,my+600);
   endShape ();
  
  
  
  

// Bauch

fill(0);
  noStroke();
  rect(mx-75,my,150,150);
  

  
//Augen

  fill(255);
  stroke(1);
  ellipse(height/2-30,width/2+20,50,50);
  ellipse(height/2+30,width/2+20,50,50);
    
  ellipse(height/2+45,width/2+20,5,5);
  ellipse(height/2-44,width/2+13,5,5);

    

 

  
   if(mousePressed== true){
     
     for (int i = 0; i<ballCount; i++) {
         stroke(255, 2);
       

        x[i] = x[i]+speedX[i];


        if (x[i]>width)speedX[i] = speedX[i]*-1;
        if (x[i]<0)speedX[i] = speedX[i]*-1; 

      
     background(255);
     translate(speedX[i],0);
     
//Hand rechts

  beginShape();
  
  stroke(0);
  strokeWeight(4);
  translate(0,20);
  line(mx+50,my+30,mx+140,my+10);
  line(mx+140,my+10,mx+140,my-50);


  endShape ();
  
  
  
  
  
//Hand links

  beginShape();
  noFill();
  stroke(0);
  strokeWeight(4);
  translate(0,-40);
  line(mx-50,my+30,mx-140,my+90);
  line(mx-140,my+90,mx-140,my+20);
  
  
  endShape ();
  

  translate(0,+20);
  
 
// Bein links
  
  beginShape();
   noFill();
  stroke(0);
  strokeWeight(4);
  line(mx-70,my+140,mx-90,my+240);
  line(mx-90,my+240,mx-90,my+600);
  
  endShape ();
  

  
  
  
// Bein rechts
  
    beginShape();
   noFill();
  stroke(0);
  strokeWeight(4);
  line(mx+70,my+140,mx+90,my+240);
  line(mx+90,my+240,mx+90,my+600);
   endShape ();
  
  
  
  

// Bauch

fill(0);
  noStroke();
  rect(mx-75,my,150,150);
  

  
//Augen
 
  fill(255);
  stroke(1);
  ellipse(my-50,mx+20,50,50);
  ellipse(my+50,mx+20,50,50);  
  //ellipse(height/2+50,width/2+20,5,5);
  //ellipse(height/2-50,width/2+20,5,5);
  fill (255);
  
  ellipse (map(mouseX, 0, width, mx-60, mx-30), map(mouseY, 0, width, my, my+30), 6, 6);
  ellipse (map(mouseX, 0, width, mx+30, mx+60), map(mouseY, 0, width, my, my+30), 6, 6);
  
     }

   }
 




  

}



