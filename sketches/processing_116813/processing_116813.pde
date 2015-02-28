
void setup(){
  size(600,400);
  background(#28CADB);
}
void draw(){
  //cursor mouse
  println(mouseX+","+mouseY);
  //cara
  fill(#62CE6A);
  ellipse(302,175,230,260);
  strokeWeight(3);
  line(293,168,289,194);
  line(314,167,316,193);
  //ojo1
  fill(0,0,0);
  ellipse(258,128,50,80);
  fill(255,255,255);
  ellipse(259,131,10,30);
  //ojo2
  fill(0,0,0);
  ellipse(351,118,50,80);
  fill(255,255,255);
  ellipse(351,121,10,30);
  //cejas
  curve(230,89,251,75,273,75,287,85);
  curve(375,83,359,72,345,70,325,78);
  //orejas de alien
  fill(255,0,0);
  ellipse(510,167,30,30);
  fill(255,0,0);
  ellipse(95,168,30,30);
  fill(#62CE6A);
  triangle(187,192,115,170,187,156);
  fill(#62CE6A);
  triangle(417,188,490,170,415,153);
  //boca
  fill(0,0,0);
  arc(303,235,150,125,0, PI);
  fill(255,255,255);
  rect(250,235,20,20);
  rect(340,235,20,20);
  //perilla
  fill(0,0,0);
  triangle(279,303,300,333,325,303);
  //gafas de sol
  fill(#D1342C);
  ellipse(254,154,50,50);
  ellipse(340,148,50,50);
  line(279,152,289,147);
  line(289,147,300,147);
  line(300,147,315,151);
  line(334,146,331,160);
  line(247,144,238,157);
  line(259,152,249,165);
  line(350,136,345,154);


}
 


