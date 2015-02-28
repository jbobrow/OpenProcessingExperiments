
size(200,200);
background(127);
smooth();
stroke(0);
fill(240);
ellipseMode(CENTER);
rectMode(CORNERS);

ellipse(55,110,20,20);//left shoulder//
ellipse(135,110,20,20);//right shoulder//
  
rect(59,110,131,165);//body//

ellipse(95,110,85,25);//jaw//

rect(55,50,135,110);//head//

ellipse(55,70,30,30);//eye left//
ellipse(135,70,30,30);//eye right//

fill(0);
ellipse(55,70,5,5);//left pupil//
ellipse(135,70,5,5);//right pupil//

line(95,119,95,130);//center whisker//
line(99,119,110,130);//right whisker//
line(91,119,81,129);//left whisker//

strokeWeight(2);
line(45,115,33,143);//left arm//
line(145,115,157,142);//right arm//
line(74,166,70,190);//left leg//
line(70,190,65,192);//left foot//
line(116,166,120,190);//right leg//
line(120,190,124,192);//left foot//
println("hello, my name is Boggu!");




