
void setup(){
size(600,600);
smooth();
noCursor();
}
int count=0;
void draw(){
background(0);
if(count==0){ smiley1();}
if(count==1){ smiley2();}
if(count==2){ smiley3();}
if(count==3){ smiley4();}
if(count==4){ smiley5();}
if(count==5){ smiley6();}
if(count==6){ smiley7();}
if(count==7){ smiley8();}
if(count==8){ smiley9();}
if(count==9){ smiley10();}
if(count==10){ smiley11();}
if(count==11){ count=0;}

}
void smiley1(){
  fill(255,233,28);
ellipse(mouseX,mouseY,(width-mouseY)/8,(width-mouseY)/8);
fill(0);
ellipse(mouseX-(width-mouseY)/32,mouseY-(width-mouseY)/32,(width-mouseY)/40,(width-mouseY)/40);
ellipse(mouseX+(width-mouseY)/32,mouseY-(width-mouseY)/32,(width-mouseY)/40,(width-mouseY)/40);

noFill();
arc(mouseX,mouseY,(width-mouseY)/16,(width-mouseY)/16,QUARTER_PI,PI-QUARTER_PI);

}
void smiley2(){
   fill(255,233,28);
ellipse(mouseX,mouseY,(width-mouseY)/8,(width-mouseY)/8);
fill(0);
ellipse(mouseX-(width-mouseY)/32,mouseY-(width-mouseY)/32,(width-mouseY)/40,(width-mouseY)/40);
ellipse(mouseX+(width-mouseY)/32,mouseY-(width-mouseY)/32,(width-mouseY)/40,(width-mouseY)/40);
noFill();
arc(mouseX,mouseY,(width-mouseY)/11,(width-mouseY)/11,0,PI);}
void smiley3(){
  fill(255,233,28);
ellipse(mouseX,mouseY,(width-mouseY)/8,(width-mouseY)/8);
fill(0);
ellipse(mouseX-(width-mouseY)/32,mouseY-(width-mouseY)/32,(width-mouseY)/40,(width-mouseY)/40);
ellipse(mouseX+(width-mouseY)/32,mouseY-(width-mouseY)/32,(width-mouseY)/40,(width-mouseY)/40);
fill(255);
stroke(0);
arc(mouseX,mouseY,(width-mouseY)/11,(width-mouseY)/11,0,PI);
line(mouseX-((width-mouseY)/22),mouseY,mouseX+((width-mouseY)/22),mouseY);
}

void smiley4(){
  fill(255,233,28);
ellipse(mouseX,mouseY,(width-mouseY)/8,(width-mouseY)/8);
fill(0);
ellipse(mouseX-(width-mouseY)/32,mouseY-(width-mouseY)/32,(width-mouseY)/40,(width-mouseY)/40);
ellipse(mouseX+(width-mouseY)/32,mouseY-(width-mouseY)/32,(width-mouseY)/40,(width-mouseY)/40);
fill(255);

line(mouseX-(width-mouseY)/32,mouseY+(width-mouseY)/42,mouseX+(width-mouseY)/32,mouseY+(width-mouseY)/42);
noStroke();
fill(255,0,0);
arc(mouseX-5+(width-mouseY)/32,mouseY+(width-mouseY)/42,(width-mouseY)/54,(width-mouseY)/54,0,PI);
stroke(0);

}
void smiley5(){
  fill(255,233,28);
ellipse(mouseX,mouseY,(width-mouseY)/8,(width-mouseY)/8);
fill(0);
ellipse(mouseX-(width-mouseY)/32,mouseY-(width-mouseY)/32,(width-mouseY)/40,(width-mouseY)/40);
ellipse(mouseX+(width-mouseY)/32,mouseY-(width-mouseY)/32,(width-mouseY)/40,(width-mouseY)/40);
ellipse(mouseX,mouseY+8,(width-mouseY)/35,(width-mouseY)/50);
}
void smiley6(){
  fill(255,233,28);
ellipse(mouseX,mouseY,(width-mouseY)/8,(width-mouseY)/8);
fill(0);
ellipse(mouseX-(width-mouseY)/32,mouseY-(width-mouseY)/32,(width-mouseY)/30,(width-mouseY)/80);
ellipse(mouseX+(width-mouseY)/32,mouseY-(width-mouseY)/32,(width-mouseY)/30,(width-mouseY)/80);
fill(255);
line(mouseX-(width-mouseY)/32,mouseY+(width-mouseY)/42,mouseX+(width-mouseY)/32,mouseY+(width-mouseY)/42);
}
void smiley7(){
  fill(255,233,28);
ellipse(mouseX,mouseY,(width-mouseY)/8,(width-mouseY)/8);
fill(0);
ellipse(mouseX-(width-mouseY)/32,mouseY-(width-mouseY)/32,(width-mouseY)/40,(width-mouseY)/40);
ellipse(mouseX+(width-mouseY)/32,mouseY-(width-mouseY)/32,(width-mouseY)/40,(width-mouseY)/40);
noFill();
stroke(0);
arc(mouseX,mouseY+((width-mouseY)/16),(width-mouseY)/11,(width-mouseY)/11,PI+QUARTER_PI,2*PI-QUARTER_PI);
}
void smiley8(){
  fill(255,233,28);
ellipse(mouseX,mouseY,(width-mouseY)/8,(width-mouseY)/8);
fill(0);
ellipse(mouseX-(width-mouseY)/32,mouseY-(width-mouseY)/32,(width-mouseY)/30,(width-mouseY)/80);
ellipse(mouseX+(width-mouseY)/32,mouseY-(width-mouseY)/32,(width-mouseY)/30,(width-mouseY)/80);
fill(255,233,28);
stroke(0);
strokeWeight(3);
strokeCap(ROUND);
arc(mouseX,mouseY+((width-mouseY)/16),(width-mouseY)/11,(width-mouseY)/11,PI+QUARTER_PI,2*PI-QUARTER_PI);
line(mouseX-((width-mouseY)*0.866/27),mouseY+((width-mouseY)/33),mouseX+((width-mouseY)*0.866/27),mouseY+((width-mouseY)/33));
}
void smiley9(){
  fill(255,233,28);
ellipse(mouseX,mouseY,(width-mouseY)/8,(width-mouseY)/8);
fill(0);
strokeWeight(4);
strokeCap(ROUND);
line(mouseX-(width-mouseY)/20,mouseY-(width-mouseY)/40,mouseX-(width-mouseY)/36,mouseY-(width-mouseY)/40);
line(mouseX+(width-mouseY)/20,mouseY-(width-mouseY)/40,mouseX+(width-mouseY)/36,mouseY-(width-mouseY)/40);
strokeWeight(2);
line(mouseX-(width-mouseY)/32,mouseY+(width-mouseY)/42,mouseX+(width-mouseY)/32,mouseY+(width-mouseY)/42);
}
void smiley10(){
  fill(255,111,111);
ellipse(mouseX,mouseY,(width-mouseY)/8,(width-mouseY)/8);
fill(0);
strokeWeight(2);
strokeCap(ROUND);
line(mouseX-(width-mouseY)/24,mouseY-(width-mouseY)/32,mouseX-(width-mouseY)/40,mouseY-(width-mouseY)/42);
line(mouseX+(width-mouseY)/24,mouseY-(width-mouseY)/32,mouseX+(width-mouseY)/40,mouseY-(width-mouseY)/42);
strokeWeight(2);
line(mouseX-(width-mouseY)/32,mouseY+(width-mouseY)/42,mouseX+(width-mouseY)/32,mouseY+(width-mouseY)/42);
}
void smiley11(){
  fill(255,111,111);
ellipse(mouseX,mouseY,(width-mouseY)/8,(width-mouseY)/8);
fill(0);
strokeWeight(2);
strokeCap(ROUND);
line(mouseX-(width-mouseY)/24,mouseY-(width-mouseY)/32,mouseX-(width-mouseY)/40,mouseY-(width-mouseY)/42);
line(mouseX+(width-mouseY)/24,mouseY-(width-mouseY)/32,mouseX+(width-mouseY)/40,mouseY-(width-mouseY)/42);
strokeWeight(3);
fill(255,111,111);
arc(mouseX,mouseY+((width-mouseY)/16),(width-mouseY)/11,(width-mouseY)/11,PI+QUARTER_PI,2*PI-QUARTER_PI);
line(mouseX-((width-mouseY)*0.866/27),mouseY+((width-mouseY)/33),mouseX+((width-mouseY)*0.866/27),mouseY+((width-mouseY)/33));
strokeWeight(1);
}


void mousePressed(){count++;}


