
float x;
float y;
//color c = color(201, 223, 0);
color c = color(255, 215, 0);
color r = color (229,20,60);
color j = color (253, 255, 255);
color rojo = color(255);
 
void setup(){
  size(400,400);
  frameRate(30);
  smooth();
  background(0);
  for(int i = 0;i<200;i++){
    fill(255);
    ellipse(random(400),random(400),4,4);
  }
   

 x= width*0.5;
 y= height* 0.72;
}
 
 
void draw (){
  noFill();
  stroke(2); 
  bezier(50, 75, 25, 25, 125, 25, 100, 75);
     
  fill (255);
  stroke (0);
  strokeWeight(0.5);
  ellipse (x-12, y-248, 25, 25);
   
    noStroke();
    fill(255,0,0); 
    ellipse(x-14, y-249, 13, 13);
   

      fill(0);
      ellipse (x-14 ,y-249, 7, 7);
     
     
        fill(255);
        ellipse (x-18, y-250, 3, 3);
        ellipse (x-16, y-249, 1, 1);
   

  fill (255);
  stroke (0);
  strokeWeight(0.5);
  ellipse (x+12, y-248, 25, 25);
   
 
     noStroke();
     fill(27,179,143);
     ellipse(x+15, y-249, 13, 13);
   
    
       fill(0);
       ellipse (x+15 ,y-249, 7, 7);
   
     
        fill(255);
        ellipse (x+18, y-250, 3, 3);
        ellipse (x+16, y-249, 1, 1);
   
 
 

  fill(c); 
  noStroke();
  arc(x-12, y-251, 25, 25, radians(190), radians(370));
   

  arc(x+12, y-251, 25, 25, radians(170), radians(350));
 

  triangle (x, y-245, x+15, y-236, x-15, y-236);
   

    stroke (0);
    strokeWeight(0.5);
    line (x+1, y-242, x+1, y-240);
    line (x-1, y-242, x-1, y-240);
   

  noStroke();
  triangle (x, y-193, x-45, y-214, x+41, y-213);
      

  rect (x-4, y-211, 8, 140);

 fill(r);
 noStroke();
 ellipse (x-2, y-217, 91, 20);
 ellipse (x-2, y-228, 91, 20);
 noFill();
 stroke(c);
 strokeWeight (2);
 arc (x-2, y-228, 91, 20, radians(148), radians(390));
 arc(x-2, y-217, 91, 20, radians(-35), radians(210));

   noStroke();
   fill(148,20,0);
   ellipse (x-1, y-222, 15, 15);
   fill(223,0,48);
   ellipse (x-1,y-227, 2, 4);
   ellipse (x-1, y-225, 2, 3);
  
/////Dientes//////////////////////////////////////////////
  noStroke();
  fill(rojo);
  beginShape();
  curveVertex (x-38, y-234);
  curveVertex (x-38, y-234);
  curveVertex (x-38, y-229);
  curveVertex (x-35, y-223);
  curveVertex (x-34, y-229);
  curveVertex (x-31, y-236);
  curveVertex (x-31, y-236);
  endShape(CLOSE);
 

  noStroke();
  fill(rojo);
  beginShape();
  curveVertex (x-26, y-236);
  curveVertex (x-26, y-236);
  curveVertex (x-26, y-231);
  curveVertex (x-23, y-225);
  curveVertex (x-21, y-231);
  curveVertex (x-18, y-237);
  curveVertex (x-18, y-237);
  endShape(CLOSE);

  noStroke();
  fill(rojo);
  beginShape();
  curveVertex (x-14, y-237);
  curveVertex (x-14, y-237);
  curveVertex (x-15, y-232);
  curveVertex (x-11, y-225);
  curveVertex (x-9, y-232);
  curveVertex (x-6, y-238);
  curveVertex (x-6, y-238);
  endShape(CLOSE);
 

  noStroke();
  fill(rojo);
  beginShape();
  curveVertex (x+26, y-236);
  curveVertex (x+26, y-236);
  curveVertex (x+30, y-229);
  curveVertex (x+31, y-223);
  curveVertex (x+34, y-229);
  curveVertex (x+34, y-234);
  curveVertex (x+34, y-234);
  endShape(CLOSE);
 

  noStroke();
  fill(rojo);
  beginShape();
  curveVertex (x+14, y-237);
  curveVertex (x+14, y-237);
  curveVertex (x+17, y-231);
  curveVertex (x+19, y-225);
  curveVertex (x+22, y-231);
  curveVertex (x+22, y-236);
  curveVertex (x+22, y-236);
  endShape(CLOSE);
 

  noStroke();
  fill(rojo);
  beginShape();
  curveVertex (x+1, y-238);
  curveVertex (x+1, y-238);
  curveVertex (x+4, y-232);
  curveVertex (x+6, y-226);
  curveVertex (x+9, y-236);
  curveVertex (x+9, y-237);
  curveVertex (x+9, y-237);
  endShape(CLOSE);
 

  noStroke();
  fill(rojo);
  beginShape();
  curveVertex (x-32, y-210);
  curveVertex (x-32, y-210);
  curveVertex (x-33, y-215);
  curveVertex (x-30, y-223);
  curveVertex (x-29, y-215);
  curveVertex (x-25, y-209);
  curveVertex (x-25, y-209);
  endShape(CLOSE);
 

  noStroke();
  fill(rojo);
  beginShape();
  curveVertex (x-20, y-209);
  curveVertex (x-20, y-209);
  curveVertex (x-20, y-214);
  curveVertex (x-17, y-221);
  curveVertex (x-16, y-214);
  curveVertex (x-13, y-208);
  curveVertex (x-13, y-208);
  endShape(CLOSE);
 

  noStroke();
  fill(rojo);
  beginShape();
  curveVertex (x+21, y-209);
  curveVertex (x+21, y-209);
  curveVertex (x+25, y-216);
  curveVertex (x+26, y-222);
  curveVertex (x+29, y-216);
  curveVertex (x+28, y-210);
  curveVertex (x+28, y-210);
  endShape(CLOSE);
 

  noStroke();
  fill(rojo);
  beginShape();
  curveVertex (x+8, y-208);
  curveVertex (x+8, y-208);
  curveVertex (x+11, y-214);
  curveVertex (x+12, y-221);
  curveVertex (x+16, y-214);
  curveVertex (x+15, y-209);
  curveVertex (x+15, y-209);
  endShape(CLOSE); 
  

  fill(c);
  ellipse (x-22, y+77, 10, 10);
  triangle (x-18, y+78, x-86, y+67, x-86, y+92);
   
  
    stroke (j);
    strokeWeight(1.5);
    line (x-78, y+73, x-58, y+75);
    line (x-78, y+79, x-58, y+78);
    line (x-78, y+84, x-58, y+82);
   
  
      noStroke();
      fill (255);
      triangle (x-93, y+71, x-86, y+67, x-86, y+75);
      triangle (x-93, y+80, x-86, y+76, x-86, y+84);
      triangle (x-93, y+89, x-86, y+85, x-86, y+92);
   

  fill(c);
  ellipse (x+19, y+77, 10, 10);
  triangle (x+18, y+78, x+84,y+68, x+84, y+92);
     

    stroke (j);
    line (x+56, y+75, x+75, y+73);
    line (x+56, y+79, x+75, y+79);
    line (x+55, y+82, x+76, y+84);
     
    
      noStroke();
      fill (255);
      triangle (x+91, y+72, x+84, y+68, x+84, y+75);
      triangle (x+91, y+80, x+84, y+77, x+84, y+84);
      triangle (x+91, y+89, x+84, y+85, x+84, y+92);
     
//alas////////////////////////////////////////////////////////////
//scale(1.5);
strokeWeight(4);
fill(50, 205, 50);
stroke (173,222,217);
beginShape();
curveVertex (x-2, y-75);
curveVertex (x-2, y-75);
curveVertex (x-39, y-146);
curveVertex (x-76, y-189);
curveVertex (x-52, y-139);
curveVertex (x-2, y-75);
endShape(CLOSE);
line(x-4, y-78, x-67, y-175);
stroke(173,222,217);
 

fill(50, 205, 50);
stroke (173,222,217);
beginShape();
curveVertex (x-3, y-75);
curveVertex (x-3, y-75);
curveVertex (x-46, y-103);
curveVertex (x-83, y-116);
curveVertex (x-52, y-95);
curveVertex (x-3, y-75);
endShape(CLOSE);
line(x-3, y-76, x-74, y-111);
stroke(173,222,217); 
 
fill(50, 205, 50);
stroke (173,222,217);
beginShape();
curveVertex (x+4, y-78);
curveVertex (x+4, y-78);
curveVertex (x+39, y-146);
curveVertex (x+76, y-189);
curveVertex (x+52, y-139);
curveVertex (x+4, y-78);
endShape(CLOSE);
line(x+4, y-78, x+68, y-175);
stroke(173,222,217);
 

fill(50, 205, 50);
stroke (173,222,217);
beginShape();
curveVertex (x+3, y-75);
curveVertex (x+3, y-75);
curveVertex (x+46, y-103);
curveVertex (x+83, y-116);
curveVertex (x+52, y-95);
curveVertex (x+3, y-75);
endShape(CLOSE);
line(x+3, y-76, x+74, y-111);
stroke(173,222,217);

//
scale(1);
for(int i=0; i<=153; i++){
    noStroke();
    scale(1);
    fill(201+i*0.5,220,0+i*0.2);
    ellipse (x, y-i*0.5, 153-i, 153-i);
}
//0 128 128

    fill(255,0,0);
    text("Aplicaciones Multimedia",x-70,y);
    text("Ernesto Solis",x-35,y+20);
    
    fill(32, 178, 170);
    ellipse (x-61, y-39, 5,5);
    ellipse (x-57, y-33, 5,5);
    ellipse (x-65, y-31, 6,6);
    ellipse (x-61, y-26, 4,4);
    ellipse (x-69, y-26, 4,4);
    ellipse (x-69, y-24, 3,3);
    ellipse (x-64, y-20, 3,3);
    ellipse (x-71, y-18, 2,2);
    ellipse (x-65, y-13, 3,3);
    ellipse (x-70, y-12, 2,2);
    ellipse (x-66, y-7, 2,2);
    ellipse (x-74, y-6, 2,2);
    ellipse (x-70, y-4, 3,3);
    ellipse (x-74, y+1, 2,2);
    ellipse (x-71, y+3, 3,3);
    ellipse (x-74, y+6, 2,2);
    ellipse (x-70, y+7, 2,2);
    ellipse (x-73, y+11, 2,2); 
}
