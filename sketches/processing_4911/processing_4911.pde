
int x=240;
int y=160;
float easeX=0.0;
float easeY=0.0;
float easing=.05;
 int bubble=0;

void setup(){
  size(480,320);
  frameRate(24);
  noFill();
  smooth();}
 


void draw() {
 
background(100);

 
    //press creates x-ray fsm
 if ((mousePressed==true) && (mouseX<(x-165) || mouseX>(x+145) || mouseY<(y-125) || mouseY>(y+146))){
 stroke(255);
 fill(255);
 beginShape();
 vertex(400,0);
 vertex(430,50);
 vertex(417,108);
 vertex(443, 148);
 vertex(424, 186);
 vertex(453, 247);
 vertex(413,289);
 vertex(441, 320);
 vertex(420,289);
 vertex(465, 247);
 vertex(435, 186);
 vertex(470, 148);
 vertex(447,108);
 vertex(460,50);
 vertex(445,0);
 endShape();
 noFill();
 }
 else {
 stroke(0);
 noFill();
}
 

 
  //creating the body via spaghetti lines
  beginShape();
  curveVertex(x+68, y+160);
  curveVertex(x+39, y-19);
  curveVertex(x+22, y-21);
  curveVertex(x+14, y+7);
  curveVertex(x+55, y-17);
  curveVertex(x+10, y-24);
  curveVertex(x+12, y+10);
  curveVertex(x+45, y+12);
  curveVertex(x+40, y+20);
  curveVertex(x-3, y-34);
  curveVertex(x+2, y-26);
  curveVertex(x+40, y+20);
  curveVertex(x+56, y-15);
  curveVertex(x-27, y-18);
  curveVertex(x+17, y-10);
  curveVertex(x+44, y);
  curveVertex(x+10, y+60);
  endShape();
  
  beginShape();
curveVertex(x-93, y-19);
curveVertex(x-84, y+3);
curveVertex(x-64, y+2);
curveVertex(x-88, y+9);
curveVertex(x-108, y-37);
curveVertex(x-49, y-2);
curveVertex(x-94, y-27);
curveVertex(x-77, y-31);
curveVertex(x-51, y-24);
curveVertex(x-43, y-12);
curveVertex(x-72, y+7);
curveVertex(x-100, y-32);
curveVertex(x-41, y-23);
curveVertex(x-38, y+4);
curveVertex(x-86, y+7);
endShape();

  
  beginShape();
  curveVertex(x-108, y+124);
  curveVertex(x-77, y+99);
  curveVertex(x-61, y+84);
  curveVertex(x-75, y+19);
  curveVertex(x-39, y+31);
  curveVertex(x-34, y+26);
  curveVertex(x-15, y+9);
  curveVertex(x-30, y-1);
  curveVertex(x-47, y-45);
  curveVertex(x-34, y+3);
  curveVertex(x-10, y+7);
  curveVertex(x+36, y);
  curveVertex(x+28, y-24);
  curveVertex(x+2, y+2);
  curveVertex(x-2, y+72);
  curveVertex(x-15, y+117);
  curveVertex(x+6, y+140);
  curveVertex(x+12, y+141);
  endShape();
  
  beginShape();
  curveVertex(x-90, y+90);
  curveVertex(x-84, y+20);
  curveVertex(x-59, y-6);
  curveVertex(x-51, y-2);
  curveVertex(x-64, y+14);
  curveVertex(x-78, y+8);
  curveVertex(x-74, y-10);
  curveVertex(x-34, y-20);
  curveVertex(x-22, y-8);
  curveVertex(x-39, y-9);
  curveVertex(x-36, y-27);
  curveVertex(x+15, y-35);
  curveVertex(x+41, y-27);
  curveVertex(x+51, y-11);
  curveVertex(x+40, y+5);
  curveVertex(x+4, y+14);
  curveVertex(x-5, y+21);
  curveVertex(x-8, y+12);
  curveVertex(x+11, y-25);
  curveVertex(x+21, y-30);
  curveVertex(x+38, y-25);
  curveVertex(x+41, y-19);
  curveVertex(x+34, y-15);
  curveVertex(x+21, y+1);
  curveVertex(x+5, y+2);
  curveVertex(x-1,y-6);
  curveVertex(x-1, y-14);
  curveVertex(x+14, y-17);
  curveVertex(x+25, y-3);
  curveVertex(x+26, y+10);
  curveVertex(x+15, y+30);
  curveVertex(x+12, y+80);
  curveVertex(x+38, y+135);
  curveVertex(x+30, y+67);
  curveVertex(x+40, y+70);
  endShape();



  beginShape();
  curveVertex(x-77, y-20);
  curveVertex(x-78, y-12);
  curveVertex(x-57, y-17);
  curveVertex(x-77, y-33);
  curveVertex(x-72, y-5);
  curveVertex(x-82, y+8);
  curveVertex(x-78, y-23);
  curveVertex(x-65, y-35);
  curveVertex(x-54, y-2);
  curveVertex(x-90, y+8);
  curveVertex(x-88, y-35);
  curveVertex(x-53, y-81);
  curveVertex(x-47, y-6);
  curveVertex(x-74, y+11);
  curveVertex(x-92, y-42);
  curveVertex(x-62, y-51);
  curveVertex(x-48, y-23);
  curveVertex(x-8, y-8);
  curveVertex(x+18, y+14);
  curveVertex(x+45, y-3);
  curveVertex(x+46, y-32);
  curveVertex(x+19, y-31);
  curveVertex(x+16, y-1);
  curveVertex(x+32, y+5);
  curveVertex(x+37, y-28);
  curveVertex(x+16, y-29);
  curveVertex(x+11, y);
  curveVertex(x+46, y+11);
  curveVertex(x+70, y-18);
  curveVertex(x+40, y-55);
  curveVertex(x+7, y-19);
  curveVertex(x+8, y+5);
  curveVertex(x+33, y+6);
  curveVertex(x+46, y+11);
  endShape();
  
  beginShape();
  curveVertex(x-147, y+120);
  curveVertex(x-139, y+108);
  curveVertex(x-146, y+85);
  curveVertex(x-127, y+73);
  curveVertex(x-103, y+55);
  curveVertex(x-100, y-6);
  curveVertex(x-90, y-33);
  curveVertex(x-62, y-26);
  curveVertex(x-49, y-18);
curveVertex(x-62, y-2);
curveVertex(x-83, y);
curveVertex(x-100, y-25);
curveVertex(x-85, y-55);
curveVertex(x-23, y-15);
curveVertex(x-21, y-2);
curveVertex(x-45, y+15);
curveVertex(x-44, y-9);
curveVertex(x-12, y-28);
curveVertex(x+60, y-8);
curveVertex(x+53, y+10);
curveVertex(x-34, y+14);
curveVertex(x-4, y+8);
curveVertex(x+29, y-17);
curveVertex(x+35, y+8);
curveVertex(x+92, y+27);
curveVertex(x+93, y+60);
curveVertex(x+107, y+90);
endShape();
  
  
  beginShape();
  curveVertex(x-117, Y+20);
  curveVertex(x-122, y+26);
  curveVertex(x-118, y+21);
  curveVertex(x-120, y-19);
  curveVertex(x-95, y-85);
  curveVertex(x-72, y-94);
  curveVertex(x-37,y-57);
  curveVertex(x-1, y-54);
  curveVertex(x+43, y-34);
  curveVertex(x+64, y-40);
  curveVertex(x+104, y+17);
  curveVertex(x+132, y+31);
  curveVertex(x+142, y+44);
 curveVertex(x+153, y+89);
  endShape();
  
  
  
  beginShape();
  curveVertex(x-169, y+80);
  curveVertex(x-170, y+60);
  curveVertex(x-160, y+53);
  curveVertex(x-157, y+62);
  curveVertex(x-123, y+61);
  curveVertex(x-117, y+53);
  curveVertex(x-116, y+14);
  curveVertex(x-100, y-30);
  curveVertex(x-80, y-45);
  curveVertex(x-65, y-16);
  curveVertex(x-83, y+27);
  curveVertex(x-95, y+7);
  curveVertex(x-100, y-30);
  curveVertex(x-95, y-50);
  curveVertex(x-80, y-50);
  curveVertex(x+13, y+20);
  curveVertex(x+33, y+14);
  curveVertex(x+49, y-12);
  curveVertex(x+37, y-38);
  curveVertex(x-3, y-18);
  curveVertex(x-21, y+10);
  curveVertex(x-21, y+10);
  curveVertex(x-20, y+19);
  curveVertex(x+20, y+10);
  curveVertex(x+38, y-16);
  curveVertex(x+59, y-83);
  curveVertex(x+75, y-96);
  curveVertex(x+133, y-62);
  curveVertex(x+160, y-4);
  endShape();
  
  
  beginShape();
  curveVertex(x-145, y+22);
  curveVertex(x-144, y+28);
  curveVertex(x-137, y+3);
  curveVertex(x-101, y-28);
  curveVertex(x-45, y-57);
  curveVertex(x-26, y-55);
  curveVertex(x-14, y-35);
  curveVertex(x-31, y-10);
  curveVertex(x-46, y+14);
  curveVertex(x-67, y+22);
  curveVertex(x-79, y-10);
  curveVertex(x-78, y-11);
  curveVertex(x-66, y-62);
  curveVertex(x-54, y-23);
  curveVertex(x-48, y-8);
  curveVertex(x-42, y+43);
  curveVertex(x-39, y+74);
  curveVertex(x-39, y+108);
  curveVertex(x-43, y+108);
  curveVertex(x-49, y+116);
  curveVertex(x-25, y+121);
  curveVertex(x-14, y+142);
  curveVertex(x-21, y+160);
  endShape();

  
  beginShape();
  curveVertex(x-131, y-20);
  curveVertex(x-117, y-33);
  curveVertex(x-82, y-40);
  curveVertex(x-52, y-35);
  curveVertex(x-40, y-10);
  curveVertex(x-45, y+19);
  curveVertex(x-65, y+30);
  curveVertex(x-75, y+20);  
  curveVertex(x-75, y+13);
  curveVertex(x-50, y+15);
  curveVertex(x-47, y+22);
  curveVertex(x-50, y+80);
  curveVertex(x-0, y+90);
  endShape();
  
  
beginShape();
curveVertex(x-170, y-5);
curveVertex(x-159, y+4);
curveVertex(x-140, y-20);
curveVertex(x-117, y-33);
curveVertex(x-65, y-64);
curveVertex(x-57, y-24);
curveVertex(x-49, y-30);
curveVertex(x-45, y-42);
curveVertex(x-50, y-52);
curveVertex(x-51, y-58);
curveVertex(x-34, y-70);
curveVertex(x-8, y-77);
curveVertex(x+16, y-70);
curveVertex(x+57, y-33);
curveVertex(x+59, y-27);
curveVertex(x+64, y-16);
curveVertex(x+110, y-23);
curveVertex(x+138, y-3);
  endShape();
  
  
  beginShape();
  curveVertex(x-167,y-5);
  curveVertex(x-154,y-31);
  curveVertex(x-77, y-60);
  curveVertex(x-60,y-50);
  curveVertex(x-47,y-44);
  curveVertex(x-23,y-19);
  curveVertex(x-15, y-13);
  curveVertex(x+18,y-9);
  curveVertex(x-34, y-42);
  curveVertex(x+90,y-57);
  curveVertex(x+115, y-60);
  curveVertex(x+128, y-51);
  curveVertex(x+136, y-28);
  curveVertex(x+142, y-8);
  curveVertex(x+148, y+10);
  endShape();
  
  
    //draw eyes and make them red
line(x-23, y-62,x-46, y-108);
line(x+5, y-67, x+38, y-102);
if((mouseX>(x-67) && mouseX<(x-19) && mouseY>(y-117) && mouseY<(y-96))|| (mouseX>x && mouseX<(x+65) && mouseY<(y-87) && mouseY>(y-111)))
fill(255,0,0);
else
fill(0);
ellipse(x-46,y-108, 15,7);
ellipse(x+38, y-102,15,7);
noStroke();
fill(175,75);
ellipse(x-46,y-108, 45, 25);
ellipse(x+38,y-102, 45, 25);
noFill();
stroke(0);

  
  //move fsm and bring him back to the center
 if (mousePressed==true && mouseX < (x+49) && mouseX > (x-100) && mouseY< (y+28) && mouseY > (y-72)){
  y=mouseY;
  x=mouseX;
 }
 else if (x != 240 || y != 160){
   x+=(240-x)*easing;
   y+=(160-y)*easing;
}

//make bubbles with tentacles
  if((mouseX>(x+128)  && mouseX<(x+141)  && mouseY>(y-71) && mouseY<(y-55)) 
  || (mouseX>(x+137)  && mouseX<(x+150)  && mouseY>(y-11) && mouseY<(y)) 
  || (mouseX>(x+104)  && mouseX<(x+115)  && mouseY>(y-30) && mouseY<(y-15))
  || (mouseX>(x+135)  && mouseX<(x+149)  && mouseY>(y+38) && mouseY<(y+50))
  || (mouseX>(x+88)  && mouseX<(x+100)  && mouseY>(y+55) && mouseY<(y+66))
  || (mouseX>(x+23)  && mouseX<(x+40)  && mouseY>(y+60) && mouseY<(y+80))
  || (mouseX>(x+1)  && mouseX<(x+12)  && mouseY>(y+141) && mouseY<(y+148))
  || (mouseX>(x-20)  && mouseX<(x-4)  && mouseY>(y+140) && mouseY<(y+148))
  || (mouseX>(x-54)  && mouseX<(x-43)  && mouseY>(y+77) && mouseY<(y+85))
  || (mouseX>(x-83)  && mouseX<(x-70)  && mouseY>(y+96) && mouseY<(y+105))
  || (mouseX>(x-145)  && mouseX<(x-133)  && mouseY>(y+104) && mouseY<(y+115))
  || (mouseX>(x-175)  && mouseX<(x-165)  && mouseY>(y+54) && mouseY<(y+66))
  || (mouseX>(x-128)  && mouseX<(x-116)  && mouseY>(y+23) && mouseY<(y+33))
  || (mouseX>(x-150)  && mouseX<(x-140)  && mouseY>(y+24) && mouseY<(y+34))
  || (mouseX>(x-161)  && mouseX<(x-151)  && mouseY>(y) && mouseY<(y+10))
  || (mouseX>(x-158)  && mouseX<(x-148)  && mouseY>(y-34) && mouseY<(y-24)))
{
  fill(225,40);
  ellipse (mouseX, mouseY,bubble, bubble);
  bubble=bubble+1;
  noFill();
}
else bubble=0;

 println((mouseX)+ "  "+ (mouseY));
}






