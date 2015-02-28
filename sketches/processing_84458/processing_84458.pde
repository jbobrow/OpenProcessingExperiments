
void setup(){
  size(500,500);
  background(#FF0303);
  smooth();
}

void draw(){
  //head
  noStroke();
  fill(#9D2020);
  triangle(width/2-200,height/2-150, width/2+200,height/2-150,  width/2,height/2+200 );
  //mouth
  fill(#FF0303);
  triangle(width/2-40,height/2+95, width/2+40,height/2+95,  width/2,height/2+170 );
  //tonge
  fill(#9D2020);
  triangle(width/2-50,height/2+20, width/2+50,height/2+20,  width/2,height/2+120 );
  //nose
  fill(#FF0303);
  triangle(width/2-30,height/2+20, width/2+30,height/2+20,  width/2,height/2+45 );
  //eyes
  fill(#FF0303);
  triangle(width/2-100,height/2-50, width/2-30,height/2-50,  width/2-30,height/2 );
  fill(#FF0303);
  triangle(width/2+100,height/2-50, width/2+30,height/2-50,  width/2+30,height/2 );
   //stroke(0);
  fill(#9D2020);
  ellipse(width/2+50,height/2-35,35,35);
  fill(#9D2020);
  ellipse(width/2-50,height/2-35,35,35);
  //eye balls
   fill(#FF0303);
  ellipse(width/2-50,height/2-35,10,10);
  ellipse(width/2+50,height/2-35,10,10);
  
  //ears
  //stroke(0);
  //arc(100, 260, 100, 80, PI+QUARTER_PI, TWO_PI);
  fill(#9D2020);
  //stroke(0);
  //bezier(120, 250,  80, 5,  80, 75,  30, 75);
  fill(#9D2020);
  ellipse(width/2+120,height/2,100,30);
  ellipse(width/2-120,height/2,100,30);
  
  //horns
  stroke(0);
  translate(width/2, height/2);
  rotate(PI/1.5);
  arc(width/2-50, height/2-500, 120, 120, PI+QUARTER_PI, TWO_PI, CHORD);
  
  //arc(width/2-50, height/2-500, 120, 120, PI+QUARTER_PI, TWO_PI, CHORD);
  
  //stroke(0);
  //arc(width/2+145, height/2+30, 100, 80, PI+QUARTER_PI, TWO_PI, CHORD);
  //cachete
  //arc(width/2-100, height/2+30, 100, 80, PI+QUARTER_PI, TWO_PI, CHORD);
  
  
  
  //triangle(width/2-50,height/2+60, width/2+50,height/2+60,width/2,height/2+150 );
  
  
}
