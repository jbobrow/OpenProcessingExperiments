
void setup(){
  size(640,480);
  background(0);
  smooth();
}
   
  void draw(){
    
    fill(255);
    ellipse(width/2, height/2,100,100);
    fill(0);
    ellipse(300, 220,20,20);
    fill(0);
    ellipse(335, 220,20,20);
    fill(255);
    stroke(153);
    bezier(290,250,310,260,330,280,350,250);
    //no me gusta dejar la carita sin un cuerpo XD /
    line(315,290,315,400);
    //braz izq
    line(315,300,290,350);
    line(290,350,310,370);
    //braz der
    line(315,300,350,290);
    line(350,290,390,250);
    //legs
    line(315,400,290,450);
    line(315,400,350,450);
  }
