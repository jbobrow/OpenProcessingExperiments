
int n,i,a=500;
float[]p=new float[a];
PImage grass;
PImage clouds;

void setup(){
size(500,500);
//rect(0,420,500,80);
//ellipseMode(CORNER);
smooth();
//strokeWeight(3);
//left ear
//frameRate(30); 
grass=loadImage("green_grass.jpg");
clouds=loadImage("Cloud.jpg");
}
void draw(){

background (clouds);
image(grass,0,420,500,80); 
fill(0);
bezier(195, 100, 200, 50, 110, 50, 140, 135);
//right ear
bezier(380,140,420,50,320,50,330,100);
//head
stroke(0);
fill(255);
ellipse (260,180,270,200);
//left eye
stroke(0);
fill(255);
ellipse(200,160,60,70);
//right eye
stroke(0);
ellipse(340,160,60,70);
//nose
fill (0);
ellipse(270,180,30,20);
//smile
noFill();
strokeWeight(2);
stroke(0);
bezier(290, 220, 300, 250, 250, 270, 240, 220);
fill(0);

ellipse(340,170,10,10);
ellipse(210,170,10,10);
//heart
noFill();
noStroke();
fill(198,2,2);
smooth();
noStroke();
fill(198,2,2);
/*beginShape();
vertex(250, 290);
//left side heart
bezierVertex(280, 170, 70, 240, 250, 360);
//right side heart
//bezierVertex(430, 240, 210, 170, 250, 290);
endShape();
*/
fill(255);
//body
ellipse(270,370,230,178);
fill(247,32,32);
noStroke();
beginShape();
vertex(270, 350);
///left side heart
bezierVertex(240, 290, 160, 380, 270, 400);
///right side heart
bezierVertex(370, 340, 270, 300, 260, 350);
endShape();

fill(0);
ellipse(330,450,120,40);
ellipse(220,450,120,40);
fill(255);
triangle(275,445,230,430,320,430);
fill(225);
//arms
fill(0);
ellipse(340,360,50,100);
ellipse(190,360,50,100);
fill(237,86,86);
noStroke();

strokeWeight(2);
fill(255);
for(i=0;i<a;i++) {
    if(n<2)p[i]=random(a);
    else {
      //point(p[i],(p[++i]+n)%a);
      noStroke();
      ellipse(p[i],(p[++i]+n)%a,10,10);
    }
  }
  n++;
//save("pandaa-dynamic.jpg");
}


