
size(400, 400);
background(115, 247, 224);
 
//variables
float x = 200;
float y = 200;
float wd = 400;
float ht = 400;

//headhair

noStroke();
fill(98,98,98);
ellipse(x, y-wd*.05, wd*.83, ht*.55);
noStroke();
fill(157, 157, 156);
ellipse(x, y-wd*.05, wd*.8, ht*.55);
 
//head

noStroke();
fill(245,208,106);
ellipse(x, y+wd*0.01, wd*.75, ht*.7);
noStroke();
fill(247,227,170);
ellipse(x, y, wd*.75, ht*.65);


 
 
 //tache

stroke(64,59,53);
strokeWeight(20);
noFill();

beginShape();
  curveVertex(x-wd*.25, y+ht*.2375);
  curveVertex(x-wd*.2, y+ht*.1625);
  curveVertex(x, y+ht*.1125);
  curveVertex(x+wd*.2, y+ht*.1625);
  curveVertex(x+wd*.25, y+ht*.2375);
endShape();



//glasses 
stroke(30, 60, 147) ;
strokeWeight(5) ;
noFill() ;
line(x-wd*.375, y-ht*.0375, x+wd*.375, y-ht*.0375) ;
arc(x-wd*.175, y-ht*.0375, x*.5, y*.5, radians(0), radians(180)) ;
arc(x+wd*.175, y-ht*.0375, x*.5, y*.5, radians(0), radians(180)) ;

 
 
//lips1
stroke(240,89,65);
line(x-wd*0.0625,y+ht*.1625,x+wd*0.0625,y+ht*.1625);
fill(255);
strokeWeight(4);


 
// "K"
strokeWeight(3);
noFill();
stroke(0,55);
beginShape();
curveVertex(x+wd*0.0125, y+ht*0.19);
curveVertex(x+wd*0.0125, y+ht*0.19);
curveVertex(x-wd*0.0125, y+ht*0.18);
curveVertex(x+wd*0.0125, y+ht*0.18);
curveVertex(x-wd*0.0125, y+ht*0.19);
curveVertex(x-wd*0.0125, y+ht*0.19);
endShape();
 

//Eyes
noStroke();
fill(77, 127, 132) ;
ellipse(x+wd*.1875, y+ht*.025, 0.0375*wd,0.0375*ht ) ;
ellipse(x-wd*.1875, y+ht*.025, 0.0375*wd,0.0375*ht ) ;

 

 
//eyebrows
noFill();
stroke(98,98,98) ;
strokeWeight(7) ;
beginShape() ;
  curveVertex(x-wd*0.2125, y-ht*.0875) ;
  curveVertex(x-wd*.2375, y-ht*.1125) ;
  curveVertex(x-wd*.2, y-ht*.075) ;
  curveVertex(x-wd*.1375, y-ht*.1125) ;
  curveVertex(x-wd*0.1, y-ht*.075) ;
  curveVertex(x-wd*0.075, y-ht*.05) ;
endShape() ;

beginShape() ;
  curveVertex(x+wd*0.2125, y-ht*.0875) ;
  curveVertex(x+wd*.2375, y-ht*.1125) ;
  curveVertex(x+wd*.2, y-ht*.075) ;
  curveVertex(x+wd*.1375, y-ht*.1125) ;
  curveVertex(x+wd*0.1, y-ht*.075) ;
  curveVertex(x+wd*0.075, y-ht*.05) ;
endShape() ;





