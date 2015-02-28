
//declaring variable
int colorHeart;


//how it begins, the first static screen
void setup(){
size(700,700);
colorHeart=(2442);
}

//runs every frame
void draw(){
  background(247,40,88);
  beginShape();
    fill(colorHeart*6);
    noStroke();
    smooth();
    bezier(40,47,60,30,60,60,40,73);
    bezier(40,47,20,30,20,60,40,73);
  endShape();
  scale(5);
  beginShape();
    fill(colorHeart*2);
    noStroke();
    smooth();
    bezier(70,77,90,60,90,90,70,103);
    bezier(70,77,50,60,50,90,70,103);
  endShape();
  scale(2);
  beginShape();
    fill(colorHeart*9);
    noStroke();
    smooth();
    bezier(20,27,40,10,40,40,20,53);
    bezier(20,27,0,10,0,40,20,53);
  endShape();
  scale(.4);
  beginShape();
    fill(colorHeart*5);
    noStroke();
    smooth();
    bezier(110,117,130,100,130,130,110,143);
    bezier(110,117,90,100,90,130,110,143);
  endShape();
  scale(.6);
  beginShape();
    fill(colorHeart*3);
    noStroke();
    smooth();
    bezier(40,47,60,30,60,60,40,73);
    bezier(40,47,20,30,20,60,40,73);
  endShape();
  scale(2.5);
  beginShape();
    fill(colorHeart*7);
    noStroke();
    smooth();
    bezier(50,57,70,40,70,70,50,83);
    bezier(50,57,30,40,30,70,50,83);
  endShape();
}
  
//click on heart
void mouseMoved(){
  if(colorHeart==255) {
    colorHeart=(colorHeart+1);
  } else {
    colorHeart=(colorHeart*5);
  } 
}





