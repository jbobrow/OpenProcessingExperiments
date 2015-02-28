
//Melanie Danver mdanver 
//homework #2 section A
//copyright 2012

size(400,400);
background(255,255,255);
smooth();
float x = 200;
float y = 200;
float wd = 200;
float ht = 200;

strokeWeight(15);
stroke(0,90,118);
fill(0,90,118);
ellipse(x,y,wd-30,ht-40);


noFill();
stroke(0,189,255);
strokeWeight(.05*((wd+ht)/2));
//M
beginShape();
curveVertex( x-(11/24.0*wd), y+(1/6.0)*ht);  //6
curveVertex( x-(11/24.0*wd), y+(1/6.0)*ht);  //6
curveVertex(x-(1/3.0)*wd,y-(1/3.0)*ht);//3
curveVertex(x-(1/3.0)*wd,y+(1/3.0)*ht); // 7
curveVertex(x-(1/3.0)*wd,y+(1/3.0)*ht); // 7
endShape();
beginShape();
curveVertex(x-(1/3.0)*wd,y+(1/3.0)*ht); // 7
curveVertex(x-(1/3.0)*wd,y+(1/3.0)*ht); // 7
curveVertex(x-(1/6.0)*wd,y-(11/24.0)*ht);//2
curveVertex(x-(1/6.0)*wd,y+(11/24.0)*ht);  //8
curveVertex(x-(1/6.0)*wd,y+(11/24.0)*ht);  //8
endShape();
//Middle M
//stroke(152,228,255);
beginShape();
curveVertex(x-(1/6.0)*wd,y+(11/24.0)*ht);  //8
curveVertex(x-(1/6.0)*wd,y+(11/24.0)*ht);  //8
curveVertex(x,y-.5*ht);
curveVertex(x,y+.5*ht); //9
curveVertex(x,y+.5*ht); //9
endShape();
beginShape();
curveVertex(x,y+.5*ht); //9
curveVertex(x,y+.5*ht); //9
curveVertex(x+(1/6.0)*wd,y-(11/24.0)*ht); //16
curveVertex(x+(1/6.0)*wd,y+(11/24.0)*ht);  //10
curveVertex(x+(1/6.0)*wd,y+(11/24.0)*ht);  //10
endShape();

//D
//stroke(108,217,255);
beginShape();
curveVertex(x+(1/3.0)*wd,y+(1/3.0)*ht); //11
curveVertex(x+(1/3.0)*wd,y+(1/3.0)*ht); //11
curveVertex( x+(11/24.0*wd), y+(1/6.0)*ht); //12
curveVertex(x+.5*wd,y); //13
curveVertex( x+(11/24.0*wd), y-(1/6.0)*ht); //14
curveVertex(x+(1/3.0)*wd,y-(1/3.0)*ht); //15
curveVertex(x+(1/3.0)*wd,y-(1/3.0)*ht); //15
endShape();
strokeWeight((.05*((wd+ht)/2))+3);
line(x+(1/3.0)*wd,y+(1/3.0)*ht-3,x+(1/3.0)*wd,y-(1/3.0)*ht+3);

/*
//counter-clockwise starting at 12
//top 1
point(x,y-.5*ht);
point(x-(1/6.0)*wd,y-(11/24.0)*ht);//2
point(x-(1/3.0)*wd,y-(1/3.0)*ht);//3
point( x-(11/24.0*wd), y-(1/6.0)*ht);  //4
//left
point(x-.5*wd,y); //5
point( x-(11/24.0*wd), y+(1/6.0)*ht);  //6
point(x-(1/3.0)*wd,y+(1/3.0)*ht); // 7
point(x-(1/6.0)*wd,y+(11/24.0)*ht);  //8
//bottem
point(x,y+.5*ht); //9
point(x+(1/6.0)*wd,y+(11/24.0)*ht);  //10
point(x+(1/3.0)*wd,y+(1/3.0)*ht); //11
point( x+(11/24.0*wd), y+(1/6.0)*ht); //12
//right
point(x+.5*wd,y); //13
point( x+(11/24.0*wd), y-(1/6.0)*ht); //14
point(x+(1/3.0)*wd,y-(1/3.0)*ht); //15
point(x+(1/6.0)*wd,y-(11/24.0)*ht); //16
*/
noFill();
translate(4,4);
stroke(201,241,255);
strokeWeight(.048*((wd+ht)/2));
//M
beginShape();
curveVertex( x-(11/24.0*wd), y+(1/6.0)*ht);  //6
curveVertex( x-(11/24.0*wd), y+(1/6.0)*ht);  //6
curveVertex(x-(1/3.0)*wd,y-(1/3.0)*ht);//3
curveVertex(x-(1/3.0)*wd,y+(1/3.0)*ht); // 7
curveVertex(x-(1/3.0)*wd,y+(1/3.0)*ht); // 7
endShape();
beginShape();
curveVertex(x-(1/3.0)*wd,y+(1/3.0)*ht); // 7
curveVertex(x-(1/3.0)*wd,y+(1/3.0)*ht); // 7
curveVertex(x-(1/6.0)*wd,y-(11/24.0)*ht);//2
curveVertex(x-(1/6.0)*wd,y+(11/24.0)*ht);  //8
curveVertex(x-(1/6.0)*wd,y+(11/24.0)*ht);  //8
endShape();
//Middle M
stroke(152,228,255);
beginShape();
curveVertex(x-(1/6.0)*wd,y+(11/24.0)*ht);  //8
curveVertex(x-(1/6.0)*wd,y+(11/24.0)*ht);  //8
curveVertex(x,y-.5*ht);
curveVertex(x,y+.5*ht); //9
curveVertex(x,y+.5*ht); //9
endShape();
beginShape();
curveVertex(x,y+.5*ht); //9
curveVertex(x,y+.5*ht); //9
curveVertex(x+(1/6.0)*wd,y-(11/24.0)*ht); //16
curveVertex(x+(1/6.0)*wd,y+(11/24.0)*ht);  //10
curveVertex(x+(1/6.0)*wd,y+(11/24.0)*ht);  //10
endShape();

//D
stroke(108,217,255);
beginShape();
curveVertex(x+(1/3.0)*wd,y+(1/3.0)*ht); //11
curveVertex(x+(1/3.0)*wd,y+(1/3.0)*ht); //11
curveVertex( x+(11/24.0*wd), y+(1/6.0)*ht); //12
curveVertex(x+.5*wd,y); //13
curveVertex( x+(11/24.0*wd), y-(1/6.0)*ht); //14
curveVertex(x+(1/3.0)*wd,y-(1/3.0)*ht); //15
curveVertex(x+(1/3.0)*wd,y-(1/3.0)*ht); //15
endShape();
strokeWeight(.048*((wd+ht)/2)+3);
line(x+(1/3.0)*wd,y+(1/3.0)*ht-3,x+(1/3.0)*wd,y-(1/3.0)*ht+3);


