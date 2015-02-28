
void setup(){
  size(400,500);
  smooth();
}

void draw(){
  fill(89,162,217);
  rect(140,50,120,80);//head
  fill(126,203,176);
  rect(135,45,130,5);//forehead
  rect(150,150,100,100);//body
  fill(89,162,217);
  rect(195,130,10,20);//neck
  line(150,175,125,300);//arm1
  line(250,175,275,300);//arm2
  line(180,250,180,400);//leg1
  line(220,250,220,400);//leg2
  rect(170,400,20,15);//foot1
  rect(210,400,20,15);//foot2
  fill(255,231,194);
  ellipse(170,70,25,25);//eye
  ellipse(170,75,15,15);//inner eye
  ellipse(230,70,25,25);//eye 2
  ellipse(230,75,15,15);//inner eye
  rect(150,105,100,10);//mouth
  line(160,105,160,115);//tooth
  line(170,105,170,115);//tooth
  line(180,105,180,115);
  line(190,105,190,115);
  line(200,105,200,115);
  line(210,105,210,115);
  line(220,105,220,115);
  line(230,105,230,115);
  line(240,105,240,115); 
  ellipse(200,230,15,15);//middle button
  ellipse(170,230,15,15);//button
  ellipse(230,230,15,15);//button
 }

