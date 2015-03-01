
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/18832*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
float a,x,y,s;void draw(){x+=random(-2,2);y+=random(-2,2);s=width/2;translate(s+x,s+y);a++;rotate(a*.1);stroke(a%255+30,20);line(-9,0,9,0);}


