
int monstertjeX;
int monstertjeY;

void setup()
{
  size(200, 200);
  //monstertjeX = 100;//aan doen voor alleen omhoog
  monstertjeY = 100;

}


void draw () {
  
    monstertjeY = monstertjeY -1;
   monstertjeX = mouseX; //toch bewegen links/rechts

    background(255);

  
  stroke(1);
  fill(255,0,0);
  
  ellipseMode(CENTER);
  ellipse (monstertjeX-40,monstertjeY-60,20,50); //oor links


  ellipse (monstertjeX+40,monstertjeY-60,20,50); //oor rechts
  
  
   ellipse (monstertjeX-40,monstertjeY-60,10,20); //binnen oor links


  ellipse (monstertjeX+40,monstertjeY-60,10,20); //binnen oor rechts
  

  
  strokeWeight(2);
  noStroke();
  ellipse (monstertjeX,monstertjeY+10,120,160); //lichaam
  rect (monstertjeX-60,monstertjeY+20,120,70);  //lichaam


  
  stroke(1);
  strokeWeight(2);
  



  strokeWeight(1);
 
  fill(100,0,0);       
  ellipse(monstertjeX,monstertjeY,70,20);   //mond
  
  fill(255);
   rect(monstertjeX-10,monstertjeY-10,10,10); //tand
   rect(monstertjeX,monstertjeY-10,10,10);//tand
   rect(monstertjeX+10,monstertjeY-9,10,10);//tand
   rect(monstertjeX-20,monstertjeY-9,10,10);//tand

 
  fill(0);
  ellipse(monstertjeX+30,monstertjeY-30,5,20); //oog rechts

  ellipse(monstertjeX-20,monstertjeY-30,5,20); //oog links

  strokeWeight(2);
  fill(255,0,0);
  ellipse(monstertjeX-40,monstertjeY+90,70,10);//linkervoet
  ellipse(monstertjeX+40,monstertjeY+90,70,10);//rechtervoet
  
   ellipse (monstertjeX-50,monstertjeY+20,40,10); //arm links
  ellipse (monstertjeX+50,monstertjeY+20,40,10); //arm rechts

}

