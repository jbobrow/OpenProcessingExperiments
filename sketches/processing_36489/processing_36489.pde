
 //hw2
//Copyright Paul BracchittaSeptember 2011, Pittsburgh PA 15221

size( 400, 400);
background(0,0,0);

smooth();
strokeWeight(4);
float x, y, wd, ht;
x = 200;
y = 200;
wd = x+150;
ht = y+150;

ellipse(x, y, wd, ht);

point(x, y);



//guidelines
strokeWeight(1);
noFill();
ellipse(x, y, .9*wd, ht); //vertical
ellipse(x, y, .8*wd, ht);
ellipse(x, y, .7*wd, ht);
ellipse(x, y, .6*wd, ht);
ellipse(x, y, .5*wd, ht);
ellipse(x, y, .4*wd, ht);
ellipse(x, y, .3*wd, ht);
ellipse(x, y, .2*wd, ht);
ellipse(x, y, .1*wd, ht);
line(x, y-175, x, y+175);
ellipse(x, y, wd, .9*ht); //horizontal
ellipse(x, y, wd, .8*ht);
ellipse(x, y, wd, .7*ht);
ellipse(x, y, wd, .6*ht);
ellipse(x, y, wd, .5*ht);
ellipse(x, y, wd, .4*ht);
ellipse(x, y, wd, .3*ht);
ellipse(x, y, wd, .2*ht);
ellipse(x, y, wd, .1*ht);
line(x-175, y, x+175, y);
// end guidlines

strokeWeight(6);
stroke(145,10,0);
//Begin P
beginShape();
  //point(x-100,y+120);
  //point(x-137, y+86);
  //point(x-110, y+108);
  
  //point(x-158, y);
  //point(x-140,y);
  
  //point(x-137,y-86);
  //point(x-110,y-108);
  
  //point(x-119,y+114);
  //point(x-90,y+134);
  //point(x-90,y-134);
  //point(x-119,y-114);
  
  curveVertex(x-119,y+114);
  curveVertex(x-137,y+86);
  curveVertex(x-158,y);
  curveVertex(x-137,y-86);
  curveVertex(x-119,y-114);
endShape(); //end of left leg

beginShape();
  curveVertex(x-90,y+134);
  curveVertex(x-110,y+108);
  curveVertex(x-140,y);
  curveVertex(x-110,y-108);
  curveVertex(x-90,y-134);
endShape(); // end of right leg P

line(x-110,y+108,x-137,y+86);
line(x-110,y-108,x-137,y-86);
 bezier(x-110,y-108,x-55,y-55,x-20,y-20,x-140,y);
 
//end P

strokeWeight(8);
stroke(23,63,145);
//begin A
beginShape();
  curveVertex(x+50,y+190);
  curveVertex(x-15,y+170);
  curveVertex(x-40,y);
  curveVertex(x,y-170);
  curveVertex(x+50,y-175);
endShape(); // left leg A

beginShape();
  curveVertex(x-50,y+190);
  curveVertex(x+15,y+170);
  curveVertex(x+40,y);
  curveVertex(x,y-170);
  curveVertex(x-50,y-175);
endShape(); //right leg A

beginShape();
  curveVertex(x-100,y);
  curveVertex(x-40,y);
  curveVertex(x+40,y);
  curveVertex(x+100,y);
endShape(); //end A

stroke(212,187,0);
strokeWeight(6);
beginShape();
  curveVertex(x,y-175);
  curveVertex(x+70,y-130);
  curveVertex(x+105,y);
  curveVertex(x+70,y+130);
  curveVertex(x,y+175);
endShape();//end left leg B

line(x+70,y+130,x+100,y+108);
line(x+70,y-130,x+100,y-108);

beginShape();
  curveVertex(x+30,y-175);
  curveVertex(x+100,y-108);
  curveVertex(x+125,y);
  curveVertex(x+100,y+108);
  curveVertex(x+30,y+175);
endShape(); //end right leg B

beginShape();
  curveVertex(x+70,y+130);
  curveVertex(x+100,y+108);
  curveVertex(x+140,y+66);
  curveVertex(x+150,y+6);
  curveVertex(x+125,y-15);
  curveVertex(x+150,y-22);
  curveVertex(x+140,y-67);
  curveVertex(x+100,y-108);
  curveVertex(x,y-175);
endShape(); // end B curves
  
 


                
