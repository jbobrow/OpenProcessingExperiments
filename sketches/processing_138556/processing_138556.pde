
color myBackground = color(25, 10, 23, 20);
PFont font1;

void setup(){
size(700,300);
smooth(); 
font1 = loadFont("HelveticaNeue-CondensedBold-70.vlw");
}

void draw(){
  int m=minute(),s=second(),h=hour();
float hy=(height+20)/60*m;
float my=(height+10)/60*s;
float sy=map(millis()%1000,0,1000,0,120);

  fill (myBackground);
  rect (0,0, width, height);
  
 if (h > 5){
   myBackground ++;
 }

 if (h > 1){
   myBackground = color(int(random(255)), int(random(255)), int(random(255)), 5);
 }

fill(219, 255, 253, 70);
textFont(font1);
text(h,mouseX,mouseY);
//text(h,width/4,hy);

fill(175, 255, 250, 50);
textFont(font1, 50);
text(m,mouseX-5,my);
//text(m,width/3,my);

fill(106, 255, 246, 35);
textFont(font1, 25);
text(s,mouseX,sy);
//text(s,width/2,sy);

}


