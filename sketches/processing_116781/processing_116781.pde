
// Carnival:using some programming technique to make some parts active!
// Chang, Kuo-Ping from department ID
 
void setup(){
  size(840,570);
  background(188,154,127);
   
}
 
void draw(){
   
 int s = second();
 int m = minute();
 int h = hour();
 background(255-10*h,255-10*h,255-10*h);
 
 // set time
 String T=(h+":"+m+":"+s);
 fill(200,200,150);
 text(T,mouseX,mouseY);
 textSize(20);
 
 
 drawmainline();
 
 // start draw music note
 drawmusicnote();
 // finish draw music note
 
 // start draw people
 drawpeople();
 // finish draw people
 
 // start draw the balls on each line
 drawlineball();
 // finish draw each line ball
  
 // start draw first triangle
 drawfirsttriangle();
 //finish draw first drawtriangle
  
 // drow all triangle
 noStroke();    
 fill(75+mouseY/random(1,5),68+mouseX/random(1,5),136);
 beginShape();
 vertex(86,248);
 vertex(97,270);
 vertex(69,291);
 vertex(41,260);
 bezierVertex(55,250,72,247,86,248);
 endShape();
 
 fill(0);
 beginShape();
 vertex(86,248);
 vertex(97,270);
 vertex(116,256);
 bezierVertex(108,251,95,247,86,248);
 endShape();
 beginShape();
 vertex(89,333);
 vertex(69,291);
 vertex(35,321);
 bezierVertex(49,331,70,337,89,333);
 endShape();
  
 beginShape();
 vertex(150,479);
 vertex(135,453);
 vertex(85,371);
 bezierVertex(128,366,166,372,201,384);
 vertex(135,453);
 vertex(109,475);
 endShape();
  
 fill(75+mouseY/random(1,5),68,136+mouseX/random(1, 8));
 beginShape();
 vertex(150,479);
 vertex(109,475);
 vertex(71,515);
 vertex(169,513);
 vertex(150,479);
 endShape();
  
 noFill();
 stroke(0);
 line(71,515,44,513);
 line(169,513,200,510);
  
 noStroke();
 fill(0);
 beginShape();
 vertex(186,544);
 vertex(169,513);
 vertex(71,515);
 vertex(39,552);
 bezierVertex(76,566,160,561,186,544);
 endShape();
  
 beginShape();
 vertex(0,0);
 vertex(58,0);
 vertex(63,205);
 vertex(0,106);
 vertex(0,0);
 endShape();
  
 beginShape();
 vertex(197,0);
 bezierVertex(224,14,262,15,286,0);
 bezierVertex(323,24,379,27,421,0);
 endShape();
  
 beginShape(); //niddle down black triangle
 vertex(258,570);
 vertex(193,553);
 vertex(187,570);
 endShape();
  
 beginShape();
 vertex(361,527);
 bezierVertex(310,522,299,496,328,481);
 bezierVertex(379,468,399,492,361,527);
 endShape();
  
 fill(75+random(1,150),68+mouseY/random(1,10),136+mouseX/random(2,5));
 bezier(361,527,328,545,330,568,366,570);
  
 beginShape();
 vertex(361,527);
 bezierVertex(385,529,401,550,395,566);
 vertex(366,570);
 vertex(361,527);
 endShape();
  
 beginShape();  //right down blue triangle
 vertex(505,570);
 bezierVertex(529,540,595,480,623,461);
 bezierVertex(621,497,622,540,626,570);
 endShape();
  
 fill(0);
 bezier(366,570,374,563,390,563,402,570);
  
 bezier(711,570,716,553,749,553,753,570);
  
 bezier(840,531,825,529,823,510,840,503);
 
 
 beginShape();
 vertex(840,379);  //1
 vertex(791,374);  //2
 vertex(802,353);  //3
 vertex(840,354);  //4
 vertex(840,379);  //1
 endShape();
 
 beginShape();
 vertex(840,328);
 vertex(817,323);
 vertex(828,296);
 vertex(840,328);
 endShape();
  
 beginShape();
 vertex(840,280);
 vertex(802,276);
 vertex(804,267);
 vertex(840,269);
 vertex(840,280);
 endShape();
  
 fill(75+random(2,160),68,136+random(1,100));
 beginShape();
 vertex(840,280);
 vertex(802,276);
 vertex(795,316);
 vertex(817,323);
 vertex(828,296);
 vertex(840,328);
 vertex(840,280);
 endShape();
  
 fill(102,99+mouseX/random(5,120),66);
 beginShape();
 vertex(840,354);
 vertex(802,353);
 vertex(817,323);
 vertex(840,328);
 vertex(840,354);
 endShape();
  
 fill(117+mouseX/random(2,200),51+mouseY/random(3,150),37+mouseY/random(1,200));
 bezier(0,216,24,250,27,310,0,346);
  
 fill(0);
 ellipse(757,274,23,19);
  
 ellipse(853,79,32,35);
  
 beginShape();
 vertex(787,0);
 vertex(840,0);
 vertex(840,10);
 bezierVertex(829,11,802,8,787,0);
 endShape();
  
 beginShape();
 vertex(707,122);
 vertex(669,124);
 vertex(690,101);
 vertex(706,83);
 bezierVertex(695,72,675,70,665,75);
 vertex(690,101);
 endShape();
  
  
 beginShape();
 vertex(803,40);
 vertex(746,108);
 vertex(697,32);  // connect right
 bezierVertex(723,36,785,35,803,40);
 endShape();
  
 beginShape();
 vertex(592,27);  //connect left
 vertex(497,121);
 vertex(450,18);
 vertex(592,27);
 endShape();
  
 arc(643,26,76,70,PI/20,PI);
 arc(643,26,27,23,PI,2*PI);
  
 fill(75,68,136,3*s);
 arc(643,26,30,30,0,PI);
  
 noFill();
 stroke(0);
 bezier(606,27,609,13,615,2,620,0);
 bezier(678,29,677,4,664,0,649,16);
  
 beginShape();
 vertex(840,459);
 bezierVertex(822,464,799,491,799,515);
 bezierVertex(798,538,820,556,840,548);
 endShape();
  
 stroke(0);
 strokeWeight(2);
 line(802,353,781,350);
 line(802,276,769,275);
 line(0,476,15,463);
 line(0,495,17,491);
 line(697,33,678,32);
 line(592,27,610,27);
 // finish draw all triangle
  
  
 // start draw heart
 drawheart();
 // finish draw heart
  
 stroke(0);
  
  
 // start draw spin all stars
 drawstar();
 // finish draw spin all stars
  
}
 
void drawmainline(){
 noFill(); //draw the left line1
 stroke(0);
 beginShape();
 vertex(mouseX-118,mouseY+65);
 bezierVertex(474,160,430,189,398,215);
 bezierVertex(344,258,215,247,215,84);
 endShape();
  
 noFill(); //draw the left line2
 stroke(0);
 beginShape();
 vertex(mouseX-133,mouseY+104);
 bezierVertex(491,202,409,236.5,366,279);
 bezierVertex(215,408,21.5,279.5,103,168);
 endShape();
  
 noFill(); //draw the left line3
 stroke(0);
 beginShape();
 vertex(mouseX-123,mouseY+140);
 bezierVertex(452,258,409,301,355,365.5);
 bezierVertex(258,473,194,495,107.5,473);
 bezierVertex(58,465,21.5,408,43,344);
 endShape();
  
 noFill(); //draw the right line1
 stroke(0);
 //beginShape();
 bezier(mouseX+37,mouseY+82,732,161,807,157,840,172);
 //endShape();
  
 noFill(); //draw the right line2
 stroke(0);
 beginShape();
 vertex(mouseX+25,mouseY+125);
 bezierVertex(689,243,706,277,711,301);
 bezierVertex(728,354,758,398,805.5,417);
 endShape();
  
 noFill(); //draw the right line3
 stroke(0);
 beginShape();
 vertex(mouseX-11,mouseY+158);
 bezierVertex(633,288,633,318,624.5,344);
 bezierVertex(615,387,629,419,657,451);
 endShape();
  
 pushMatrix(); //draw middle circle curves
 translate(495,402);
 float spin7=PI*mouseX/50;
 rotate(spin7);
 noFill();
 stroke(0);
 beginShape();
 vertex(570-495,423-402);
 bezierVertex(565-495,372-402,550-495,355-402,517-495,344-402);
 bezierVertex(482-495,338-402,439-495,365-402,430-495,387-402);
 bezierVertex(415-495,412-402,426-495,438-402,449-495,458-402);
 bezierVertex(495-495,482-402,514-495,460-402,532-495,442-402);
 bezierVertex(545-495,422-402,542-495,412-402,532-495,401-402);
 bezierVertex(530-495,395-402,505-495,389-402,495-495,402-402);
 endShape();
 popMatrix();
 fill(0);  // black circle attached to middle circle curve
 ellipse(480,405,31,32);
}
 
void drawmusicnote(){
 noFill();   //middle little music note lne
 stroke(0);
 bezier(400,318,375,302,360,311,342,333);
  
 noFill();          // middle long muisc note line
 stroke(0);
 beginShape();
 vertex(296,425);
 bezierVertex(264,388,260,350,301,305);
 bezierVertex(368,217,375,205,401,78);
 endShape();
  
 fill(75,68,136);  // blue ball on longline
 noStroke();
 arc(382,158,50,43,4*PI/7,8*PI/5);
 
 fill(0);          // black ball on lone line
 noStroke();
 arc(382,158,50,43,11*PI/7,18*PI/7);
  
 fill(0);          // little black circle
 ellipse(338,344,29,23);
  
 fill(0);          // middle music note half moon
 stroke(0);
 beginShape();
 vertex(400,318);
 bezierVertex(433,357,419,406,387,437);
 bezierVertex(360,455,340,457,296,425);
 endShape();
}
 
void drawpeople(){
 fill(0);    //people in black triangle
 noStroke();
 beginShape();
 vertex(319,146);
 vertex(263,139);
 vertex(279,110);
 bezierVertex(290,113,299,113,310,111);
 vertex(319,146);
 endShape();
  
 fill(75,68,136); //people in blue triangle
 noStroke();
 beginShape();
 vertex(279,110);
 vertex(300,73);
 vertex(310,111);
 bezierVertex(290,113,299,113,279,110);
 endShape();
  
 fill(0); // human head
 noStroke();
 ellipse(301,56,42,38);
  
 noFill();  // left hand
 stroke(0);
 beginShape();
 vertex(279,110);
 bezierVertex(249,105,244,98,243,84);
 bezierVertex(252,59,253,46,245,30);
 endShape();
  
 noFill(); // right hand
 stroke(0);
 bezier(310,111,355,99,355,80,345,37);
  
 fill(75,68,136);  // blue ball on hand
 noStroke();
 arc(350,73,32,32,4*PI/7,3*PI/2);
  
 fill(0);          // black ball on hand
 noStroke();
 arc(350,73,32,32,3*PI/2,18*PI/7);
}
 
void drawlineball(){ 
  
 fill(75,68,136);  //first line blue
 noStroke();
 beginShape();
 vertex(472,174);
 vertex(434,191);
 bezierVertex(441,203,450,206,458,202);
 bezierVertex(468,198,475,190,472,174);
 endShape();
  
 fill(0);         //first line black
 noStroke();
 beginShape();
 vertex(472,174);
 vertex(434,191);
 bezierVertex(428,180,440,162,453,165);
 bezierVertex(464,163,470,169,472,174);
 endShape();
  
 noStroke();    //third ball
 fill(0);
 arc(461,268,28,28,5*PI/6,11*PI/6);
 fill(75,68,136);
 arc(461,268,28,28,11*PI/6,17*PI/6);
  
 fill(75,68,136);   //4th ball
 arc(622,378,43,43,3*PI/7,3*PI/2);
 fill(0);
 arc(622,378,42,42,3*PI/2,17*PI/7);
  
 fill(75,68,136);  //5th ball
 arc(730,349,43.5,43.5,PI/3,4*PI/3);
 fill(0);
 arc(730,349,45,45,4*PI/3,7*PI/3);
  
 beginShape();        //right 6th ball
 vertex(731,169);
 bezierVertex(735,143,757,124,780,123);
 bezierVertex(805,125,823,144,825,169);
 bezierVertex(789,160,770,163,731,169);
 endShape();
  
 fill(75,68,136);      //right 6th ball
 beginShape();
 vertex(731,169);
 bezierVertex(735,200,747,212,779,216);
 bezierVertex(811,212,827,187,825,169);
 bezierVertex(789,160,770,163,731,169);
 endShape();
  
 arc(146,315,43,43,PI/8,9.5*PI/8);          //left 7th blak ball
 fill(0);
 arc(146,315,43,43,9.5*PI/8,16.7*PI/8);
 bezier(268,446,258,430,238,439,240,461);  // left 7th black ball
  
 fill(75,68,136);                          // left 7th blue ball
 beginShape();
 vertex(268,446);
 bezierVertex(279,465,272,478,258,480);
 bezierVertex(249,481,242,473,240,461);
 vertex(268,446);
 endShape();
}
 
void drawfirsttriangle(){
 fill(0);         //right up  black triangle
 beginShape();
 vertex(215,34);
 vertex(179,100);
 vertex(136,24);
 bezierVertex(164,16,200,23,215,34);
 endShape();
 
 int a=second();
 fill(100+mouseY/random(2,200),200+mouseX/random(2,150),50+mouseX*random(1,50));  //right up blue triangle
 beginShape();
 vertex(248,200);
 vertex(223,150);
 vertex(179,100);
 vertex(130,184);
 vertex(166,196);
 vertex(215,201);
 vertex(248,200);
 endShape();
 
 fill(0);          // right up black half moon
 beginShape();
 vertex(248,200);
 vertex(223,150);
 vertex(270,198);
 vertex(248,200);
 endShape();
 bezier(166,196,174,178,217,178,222,201);
 
 noFill();       // right up ellipse curve
 stroke(0);
 bezier(166,196,159,203,151,216,150,229);
 bezier(222,201,229,212,235,228,235,237);
}
 
 
 
 
 
void drawheart(){
 fill(150,mouseY/2,mouseX/2); //draw the red part
 noStroke();
 beginShape();
 vertex(mouseX,mouseY);
 bezierVertex(mouseX+54,mouseY+65,mouseX+54,mouseY+129,mouseX-32,mouseY+168);
 bezierVertex(mouseX-54,mouseY+173,mouseX-75,mouseY+183,mouseX-97,mouseY+194);
 endShape();
  
 fill(mouseX/2,150,mouseX*mouseY/2);   //draw the black part
 noStroke();
 beginShape();
 vertex(mouseX,mouseY);
 bezierVertex(mouseX-21,mouseY+15,mouseX-43,mouseY+26,mouseX-65,mouseY+33);
 bezierVertex(mouseX-118,mouseY+43,mouseX-161,mouseY+86,mouseX-118,mouseY+151);
 bezierVertex(mouseX-112,mouseY+162,mouseX-103,mouseY+179,mouseX-97,mouseY+194);
 endShape();
  
 fill(200,mouseY,mouseX/2);        //  right middle black
 noStroke();
 beginShape();
 vertex(mouseX-35,mouseY+70);
 vertex(mouseX-54,mouseY+108);
 bezierVertex(mouseX-40,mouseY+113,mouseX-33,mouseY+108,mouseX-26,mouseY+96);
 bezierVertex(mouseX-22,mouseY+87,mouseX-23,mouseY+79,mouseX-33,mouseY+70);
 endShape();
  
 fill(mouseY,mouseY/100,180);   // left middle blue
 noStroke();
 beginShape();
 vertex(mouseX-35,mouseY+70);
 vertex(mouseX-54,mouseY+108);
 bezierVertex(mouseX-63,mouseY+101,mouseX-74,mouseY+92,mouseX-63,mouseY+73);
 bezierVertex(mouseX-61,mouseY+67,mouseX-45,mouseY+62,mouseX-33,mouseY+70);
 endShape();
}
 
void drawstar(){
 pushMatrix();
 translate(434,102);
 scale(random(1,2));
 int sec1=second();
 int m = minute(); 
 int spin6=sec1;
 rotate(spin6);
 //stroke(120,50,100);
 if(mousePressed){
 //background(0);
 stroke(255,246,0);
 }else{
 stroke(150+2*random(m),150-random(m),150+0.5*random(m));
 }
 line(461-434,86-102,417-434,117-102);   // rice signal R3
 line(462-434,101-102,417-434,102-102);
 line(452-434,123-102,420-434,86-102);
 line(429-434,128-102,438-434,78-102);
 popMatrix();
  
 pushMatrix();
 translate(703,474);   // spin rice signal R1
 scale(random(0.5,1.5));
 rotate(-spin6);
 //stroke(100,200,150);
 line(50,-41,-30,25); 
 line(50,-2,-38,2);
 line(27,33,-27,-33);
 line(6,33,-8,-42);
 popMatrix();
  
 pushMatrix();
 translate(452,515);   // spin rice signal R2
 scale(random(1,1.8));
 rotate(spin6);
 //stroke(100,20,230);
 line(473-452,493-515,434-452,532-515); 
 line(478-452,514-515,426-452,520-515);
 line(475-452,531-515,430-452,501-515);
 line(453-452,538-515,451-452,488-515);
 popMatrix();
  
 pushMatrix();
 translate(310,187);
 scale(random(0.5,1.5));
 rotate(spin6);
 //stroke(255,10,10);
 line(328-310,170-187,293-310,206-187);   //rice signal R4
 line(334-310,185-187,287-310,188-187);
 line(327-310,208-187,295-310,168-187);
 line(307-310,213-187,312-310,164-187);
 popMatrix();
  
 pushMatrix();
 translate(218,269);
 scale(random(1,1.5));
 //float spin4=PI*mouseY/200;
 rotate(-spin6);
 //stroke(255,138,0);
 line(251-218,246-269,184-218,294-269);   // rice signal R5
 line(250-218,269-269,182-218,266-269);
 line(245-218,299-269,195-218,243-269);
 line(215-218,300-269,220-218,249-269);
 popMatrix();
  
 pushMatrix();
 translate(110,74);
 scale(random(1,2));
 rotate(-spin6);
 //stroke(79,151,202);;
 line(130-110,51-74,98-110,87-74);      //rice signal R6
 line(137-110,75-74,90-110,73-74);
 line(132-110,95-74,87-110,49-74);
 line(107-110,107-74,111-110,20-74);
 popMatrix();
}



