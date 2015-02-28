
int fons = 510;

void setup() {
size(600,600);
smooth();
}
void draw (){
background(fons);

//cap contorn
fill(0,0,0);
ellipse(300,443,375,310);
//contorn orelles
fill(0,0,0);
stroke(0,0,0);
ellipse(200,290,59,55);
ellipse(325,270,65,62);
//ombrejat cap
stroke(#4E9D30);
fill(#4E9D30);
ellipse(300,443,350,280);
//orelles
fill(mouseY,185,0);
stroke(0,0,0);
ellipse(200,290,50,50);
ellipse(325,270,55,53);
//cap
stroke(130,190,0);
fill(mouseY,185,0);
ellipse(300,433,355,280);
//celles
fill(#2D6F2D);
arc(174,366,45,22,3.14,6);
arc(172,362,46,14,6,9);
arc(426,366,45,22,3.14,6);
arc(424,362,46,14,6,9);
//detalls orelles
fill(mouseY,150,0);
stroke(#207619);
ellipse(203,295,27,24);
ellipse(325,275,26,29);
//ombrejat ulls
fill(mouseY,100,0);
stroke(#4E9D30);
ellipse(180,450,89,80);
ellipse(422,450,89,80);
//contorn ulls
fill(#30641E);
stroke(#30641E);
ellipse(175,435,94,94);
ellipse(423,435,94,94);
//ulls
fill(500,500,500);
stroke(500,500,500);
ellipse(175,435,85,85);
ellipse(423,435,85,85);
//iris
fill(0,0,0);
stroke(0,0,0);
ellipse(175,434,mouseX/8,mouseY/8);
ellipse(423,434,mouseX/8,mouseY/8);
//boca
fill(mouseY,80,0);
stroke(0,45,0);
arc(300,498,114,110,3.90,10.38);
//ombrejat dents
fill(#2F672B);
arc(267,500,40,56,0.14,3.5);
arc(303,503,42,58,1,8.5);
arc(340,500,35,56,1,9.5);
//dents
fill(#FFFFFF);
arc(268,500,35,45,0.14,3.5);
arc(304,504,35,45,1,8.5);
arc(339,500,32,45,1,9.5);
//nas contorn
fill(#388328);
stroke(#388328);
ellipse(300,440,155,138);
//nas
fill(182,195,0);
ellipse(300,440,145,127);
//detalls nas
fill(0,50,0);
stroke(0,50,0);
ellipse(271,438,31,49);
ellipse(329,438,30.1,39.6);
}

void mousePressed(){
  fons = 300;
}
void mouseReleased(){
  fons = 510;

}









