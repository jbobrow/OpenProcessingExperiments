
  float px=1;
float py=300;
float v=3;
  
 void setup(){
  size (600,600);
  colorMode(HSB);}
void draw(){
  background(0,70);
  for(float i=1 ;i<670;i=i+11) {
 
      stroke(1+(mouseX*0.3),25,255);
      fill(i,(mouseY*0.70),(mouseY*cos(i)));
    ellipse(py,i,i*0.1,25);
    ellipse( px,300,i*cos(3),sin(i));
     ellipse( py,i*0.4,10,10);
  if(mousePressed == true) {
    px=px+(v*sin(i));
   py=py+(v*cos(i));
     ellipse( px,300,px*0.09,10);
     ellipse( py,30,100,px*0.1);
     ellipse( px,px*0.04,104,10);
     ellipse( 48,px,104,60);
     ellipse( py,800,i,10);
     ellipse( px,i,cos(459),sin(i));
     ellipse( py,300,sin(10),10);
   rect(px,py,cos(i),sin(i));
    rect(py,px,cos(i),sin(i));
    rect(21,sin(i),cos(px),39);
   fill(px*0.2,py,i,i*0.09);
   ellipse(px,i,i,39);
     rect(cos(px),py,cos(i),sin(i));
    rect(sin(py),px,cos(i),sin(i));
      }else{
    strokeWeight(1.678);
    fill( 30,56,29*0.8);
  ellipse(30,i,30,2);
      stroke(1.08,89,70);
   fill( 129,(mouseY*0.48),230);
  ellipse(70,i,80,3);
      strokeWeight(2.678);
      stroke(3+(mouseY*0.7),25,255);
   fill( 30,56,13*0.8);
  ellipse(120,i,50,4);
      strokeWeight(3.0678);
   fill( 30,56,29*0.8);
  ellipse(120,i,30,6);
      strokeWeight(2.78);
      stroke(39,72,93);
   fill( 30,56,99*0.8);
  ellipse(150,i,30,8);
      stroke(90,12,cos(45));
   fill( 30,79,19*0.8);
  ellipse(180,i,30,9);
      strokeWeight(3.04);
   fill( 30,56,49*0.8);
  ellipse(210,i,30,13);
      stroke(1+(mouseX*0.3),25,255);
   fill( 30,56,29*0.8);
  ellipse(240,i,30,3);
      strokeWeight(2);
   fill( 30,99,213*0.8);
  ellipse(330,i,30,21);
   strokeWeight(1);
   fill( 30,56,78*0.8);
  ellipse(330,i,30,21);
  strokeWeight(1);
   fill( 159,2,78*0.8);
  ellipse(330,i,90,21);
  ellipse(300,i,129,5);
      strokeWeight(1);
   fill( 30,56,78*0.8);
  ellipse(400,i,94,12);
  strokeWeight(1);
   fill(30,56,29*0.8);
  ellipse(670,i,30,sin(238));
  stroke(1+(mouseX*0.3),25,255);
   fill( 200,56,78*0.8);
  ellipse(780,i,30,102);
  
     }
     }}
