
//HW 2
//© Scott Alberstein, January 2014, Pittsburgh, PA

size(400, 400) ;
background(234, 116, 78) ;

//Floats
float x = 200;
float y = 200;
float wd = 400;
float ht = 400;

//Hair
smooth() ;
noStroke();
fill(142, 155, 122) ;
ellipse(x+85, y-50, wd*.25, ht*.25) ;
ellipse(x-85, y-50, wd*.25, ht*.25) ;

//Head
fill(255, 214, 152) ;
ellipse(x, y, wd-150, ht-150) ;
ellipse(x+125, y+12, wd*.125, ht*.125) ;
ellipse(x-125, y+12, wd*.125, ht*.125) ;
ellipse(x, y+90, wd*.25, ht*.25) ;

//Eyes
fill(77, 127, 132) ;
ellipse(x+25, y, wd-385, ht-385) ;
ellipse(x-25, y, wd-385, ht-385) ;

//Stache
stroke(142, 155, 122) ;
strokeWeight(40) ;
line(x-50, y+50, x+50, y+50) ;

//Glasses Lenses
noStroke() ;
fill(255, 255, 255, 85) ;
arc(x-50, y-15, x*.5, y*.5, radians(0), radians(180)) ;
arc(x+50, y-15, x*.5, y*.5, radians(0), radians(180)) ;

//Glasses Frame
stroke(104, 100, 83) ;
strokeWeight(5) ;
noFill() ;
line(x-125, y-15, x+125, y-15) ;
arc(x-50, y-15, x*.5, y*.5, radians(0), radians(180)) ;
arc(x+50, y-15, x*.5, y*.5, radians(0), radians(180)) ;

//Eyebrows "S"
stroke(142, 155, 122) ;
strokeWeight(7) ;
beginShape() ;
  curveVertex(x-65, y-35) ; 
  curveVertex(x-75, y-45) ; 
  curveVertex(x-60, y-30) ;
  curveVertex(x-35, y-45) ;
  curveVertex(x-20, y-30) ;
  curveVertex(x-10, y-20) ;
endShape() ;
beginShape() ;
  curveVertex(x+65, y-35) ; 
  curveVertex(x+75, y-45) ; 
  curveVertex(x+60, y-30) ;
  curveVertex(x+35, y-45) ;
  curveVertex(x+20, y-30) ;
  curveVertex(x+10, y-20) ;
endShape() ;


