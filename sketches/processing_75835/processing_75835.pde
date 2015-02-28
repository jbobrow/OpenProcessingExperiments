
void setup(){
  size (500,500);
  smooth();
}
void draw(){
  background(0);
  noStroke();
  fill(255,175,26);
  ellipse(250,170,300,120);//sombrero parte inferior
  ellipse(250,110,190,100);//sombreo parte superior
  fill(255,209,162);
  stroke(0);
  ellipse(250,250,180,220);//cara
  fill(255);
  ellipse(200,220,45,45);//ojo izquierdo
  fill(0);
  ellipse(200,220,8,8);
  fill(255);
  ellipse(300,220,45,45);//ojo derecho
  fill(0);
  ellipse(300,220,8,8);
  fill(255,209,162);
  noStroke();
  arc(250,197,100,50,0,PI);//ojos raros
  stroke(0);
  fill(255);
  arc(250,280,120,100,0,PI);//boca parte inferior
  fill(255,209,162);
  arc(250,280,120,30,0,PI);//boca parte superior
  line(191,189,229,225);//ceja izquierda
  line(270,225,308,190);//ceja derecha
  line(250,295,250,330);//**********
  line(277,294,277,325);//**********
  line(298,290,298,309);//dientes
  line(223,293,223,325);//**********
  line(202,289,202,309);//**********
  stroke(255,3,32);
  line(157,100,343,100);//linia superior del sombrero
  line(156,114,344,114);//linia inferior del sombrero
  stroke(0);
  arc(300,250,30,10,0,PI);//cicatriz debajo del ojo
  line(308,250,310,260);//cicatriz horizontal derecha
  line(293,250,295,260);//cicatriz horizontal izquierda
}

