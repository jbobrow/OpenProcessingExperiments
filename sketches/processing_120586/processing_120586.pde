
int eSize = 10;  //en no size wo 10 ni
 
size(400, 565);  //gamen size 400 x 565
background(255);  //haikeisyoku
  smooth();  //rinkaku wo kireini
 
 
//stroke(0);  //sen wo byousya
//strokeWeight(15);  //sen no hutosa
//line(0, 200, 400, 200);
 
 
for(int x = 0; x <= width; x += 10){  //yoko no retu no ten
  
  if(x == width/2){
    fill(255);
  }
  else{  //soreigai
    fill(0);
  }
  noStroke();
  rect(x, 200, eSize, eSize);  //sikaku wo byousya
  println("x=" + x);  //x wo syuturyoku
}
 
 
fill(245, 30, 35);
  noStroke();   //sen ha nasi
  triangle(-80, 100, 60, -100, 200, 280);  //sankaku
 
 
stroke(0);
  strokeWeight(1);
  line(50, 250, 302, 475);
   
 
stroke(200, 197, 185);
  strokeWeight(50);
  line(0, 430, 400, 320);
 
   
stroke(0);
  strokeWeight(1);
  line(200, 0, 200, 565);
 

stroke(0);
  noFill();
  ellipse(290, 460, 140, 140);


stroke(0);
  noFill();
  ellipse(292, 462, 130, 130);


stroke(0);
  noFill();
  ellipse(294, 464, 120, 120);


stroke(0);
  noFill();
  ellipse(296, 466, 110, 110);

 
stroke(0);
  noFill();
  ellipse(298, 468, 100, 100);
 
 
stroke(0);
  noFill();
  ellipse(300, 470, 90, 90); //maru wo byousya
   
   
stroke(0);
 noFill();
 ellipse(302, 472, 80, 80);
  
 
stroke(0);
  noFill();
  ellipse(303, 473, 70, 70);
 
   
stroke(0);
  noFill();
  ellipse(304, 474, 60, 60);
   
 
stroke(0);
  noFill();
  ellipse(305, 475, 50, 50);
   
   
stroke(0);
  noFill();
  ellipse(306, 476, 40, 40);
   
   
stroke(0);
  noFill();
  ellipse(307, 477, 30, 30);
   
   
stroke(0);
  noFill();
  ellipse(308, 478, 20, 20);
   
   
stroke(0);
  noFill();
  ellipse(309, 479, 10, 10);


