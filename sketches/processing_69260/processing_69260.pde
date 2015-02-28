
size(500, 500);
background(255,255,255);
strokeWeight(3);{
  line(0, 250, 250, 0);
  line(0, 250, 250, 500);
  line(500, 250, 250, 0);
  line(500, 250, 250, 500);
}
{strokeWeight(3);
  fill(255, 0,0);
ellipse(250, 250, 100, 100);
}
//Colors, they apparently must go before the primitive or itll 
//be colorless

{strokeWeight(3);
  fill(0, 0,250);
  triangle(0, 250, 80, 170, 80, 330);
}

{strokeWeight(3);
  fill(250, 250, 0);
  triangle(500, 250, 420, 170, 420, 330);
}

{strokeWeight(3);
   fill(0, 0, 0);
   triangle(250, 500, 200, 450, 300, 450);
}

{strokeWeight(3);
   fill(0, 0, 0);
   triangle(250, 0, 200, 50, 300, 50);
}

  fill(255, 255, 0);
  rect(140, 150, 40, 60);
  
  line(140, 110, 140, 390);
  line(80, 210, 220, 210);
  
  fill(255, 0, 0);
  arc(250, 449, 50, 50, PI, TWO_PI);
  
  fill(255, 0, 0);
  arc(250, 50, 50, 50, PI, TWO_PI);
  
  line(420, 290, 280, 290);
  
  fill(255, 255, 0);
  rect(330, 290, 40, 60);
  
  fill(0, 0, 255);
  rect(330, 170, 90, 60);
  
  line(330, 80, 330, 420);
 
 fill(0, 0, 255);
  rect(140, 330, 90, 60);
  
  line(180, 200, 180, 330);
  line(150, 150, 330, 150);
  line(240, 53, 240, 200);
  line(200, 330, 330, 330);
  line(200, 390, 330, 390);
  
 fill(130);
  triangle(0, 0, 250, 0, 0, 250);
  triangle(250, 0, 500, 250, 500, 0);
  triangle(500, 250, 250, 500, 500, 500);
  triangle(0, 250, 0, 500, 250, 500);
  

