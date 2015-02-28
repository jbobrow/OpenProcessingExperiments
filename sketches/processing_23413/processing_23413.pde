
void setup(){
  size(570,660);
  smooth();
}
//line(15,75, 15,0),line(285,75,285,0),line(555,75,555,0)
//ellipseMode(CENTER);
/*beginShape();
arc(155,225,285,285,radians(180),radians(336));
arc(415,225,285,285,radians(203),radians(360));
endShape(CLOSE);(doesn't work*/

/*beginShape();
vertex(285, 195);
bezierVertex(285,90,420,90,420,90);
endShape();*/

void draw(){
  noStroke();
  fill(255);
  //body
  ellipseMode(CENTER);
  ellipse(155,225,269,269);
  ellipse(415,225,270,270);
 // stroke(0);
  //triangle(30,265,540,265,287,650);
  //arc(489,155,950,950,radians(115),radians(165));
  //arc(81,155,950,950,radians(10),radians(65));
  arc(285,220,530,530, radians(0),radians(180));
 
  stroke(0);
  
  //rect(105,180,100,100);//left eye
  quad(155,180,205,230,155,280,105,230);
  //rect(135,255,40,40);
  quad(155,255,175,275,155,295,135,275);
  fill(0);
  ellipse(155,255,20,20);
  fill(255);
  
  //rect(370,180,100,150);//right eye
  quad(420,180,470,220,420,330,370,220);
  quad(420,180,470,220,420,300,370,220);
  quad(420,180,470,220,420,270,370,220);
  fill(0);
  ellipse(420,235,30,30);
  ellipse(420,265,20,20);
  ellipse(420,295,10,10);
  ellipse(420,325,15,15);
  
  fill(255);
  ellipse(286,365,80,60);
  }





