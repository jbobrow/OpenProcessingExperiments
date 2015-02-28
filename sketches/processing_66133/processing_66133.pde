
size(350, 290);
  background(105,175,224);

 noFill();
  
  arc(50, 10, 300, 300, 0, PI/2);
  fill(174,63,29);
  arc(50, 0, 300, 300, PI/2, PI);
   
  noFill();
  stroke(255);
  
  stroke(0,0,0); 
  bezier(40, 100, 0, 0, 0, 50, 200, 100);
  bezier(100, 100, 120, 160, 50, 250, 350, 300);
  bezier(350, 300, 350, 200, 100, 250, 100, 200);
  bezier(350, 300, 300, 500, 100, 250, 100, 200);
  bezier(200, 100, 60, 600, 200, 250, 200, 300);
  bezier(300, 200, 60, 70, 200, 250, 200, 300);
  bezier(200, 300, 10, 0, 280, 90, 10, 0); 
  bezier(10, 0, 0, 70, 200, 20, 200, 300);
  bezier(350, 35, 60, 200, 10, 90, 200, 300);
      
  noFill();
 
  arc(250, 10, 300, 300, 0, PI/4);
  fill(255,76,21);
  arc(250, 0, 300, 300, PI/4, PI);
  
  fill(252,249,248);
  ellipse(6, 40, 25, 25);

  ellipseMode(CENTER);
noFill();
ellipse(35, 35, 50, 50);

ellipseMode(CORNER);
fill(0);
ellipse(200, 200, 10, 10);
noFill();
stroke(20);
curve(5, 20, 5, 20, 90, 30, 90, 20);

//this has gone so wrong
//
//I am sad as well



int M = 4;
float I = 17;

String hw = "Homework has gone wrong. "; 
String Miro = "Miro would be verry sad.";
String Iam = "I am sad as well.";

String hope = "lets hope days "; 
String to =" to ";
String better= " are better";


println(hw + Miro + Iam);

println(hope + M + to + I + better);
  

