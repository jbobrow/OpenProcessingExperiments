
int x;
int y;



void setup()
{
  size(400,400);
  background(180);
  noStroke();
  
  smooth();
}


void draw()
{
for(x=0;x<width;x+=40)
{
  for(y=0;y<height;y+=50)
  {
//pushMatrix();
//translate(x,y);
    shinosuke();
//popMatrix();
  }
}
}
void shinosuke()
{
  
  //pushMatrix();
  //translate(mouseX,mouseY);
  
  //noCursor();
  //background(180);
  
  //translate(180,180);
  
  //scale(6); //al acabar el dibuix he de treure el factor d'escala//
  
  //rectangle base//
  //stroke(0);
  //strokeWeight(0.2);
  //rect(0,0,40,50);
  
  
  noStroke();
  
  //cames//
  fill(255,220,170);
  quad(x+12,y+37.5,x+12,y+44,x+14,y+44,x+15,y+37.5);
  quad(x+22,y+37.5,x+23,y+45,x+25,y+45,x+25,y+37.5);
  
  //mitjons//
  fill(255);
  quad(x+12,y+44,x+12,y+47.5,x+13.5,y+47.5,x+14,y+44);
  quad(x+23,y+45,x+23.5,y+47.5,x+25,y+47.5,x+25,y+45);
  
  //sabates//
  fill(160,110,50);
  quad(x+8,y+50,x+14,y+50,x+13.5,y+47.5,x+11,y+47.5);
  ellipse(x+11.5,y+47.5,1,4);
  quad(x+23.5,y+47.5,x+23,y+50,x+29.5,y+50,x+26,y+47.5);
  ellipse(x+25.5,y+47.5,1,4);
  
  //pantalons//
  fill(240,240,60);
  quad(x+11,y+30,x+10,y+37.5,x+17,y+38,x+21,y+30);
  quad(x+16,y+30,x+19,y+38,x+27.5,y+38,x+26.5,y+30);
  
  //jersei//
  fill(200,0,0);
  triangle(x+12,y+19,x+38,y+11.5,x+19,y+29);
  triangle(x+3,y+11,x+18,y+28,x+20,y+18);
  triangle(x+12,y+19,x+10,y+31,x+27,y+31);
  triangle(x+10,y+31,x+27,y+31,x+27,y+18);
  
  //mans//
  fill(255,220,170);
  quad(x+35,y+12.4,x+36,y+13.5,x+38,y+12,x+38,y+11);
  ellipse(x+37.5,y+11.5,3,3);
  quad(x+3,y+11,x+3,y+11.5,x+5,y+13.2,x+6,y+12.2);
  ellipse(x+3,y+11,3,3);
  
  //dits//
  noFill();
  stroke(255,220,170);
  strokeWeight(0.9);
  line(x+3,y+11,x+0.5,y+8);
  line(x+3.5,y+11,x+2,y+7);
  line(x+37.5,y+11,x+39.5,y+8.5);
  line(x+37,y+11,x+38,y+7.5);
  
  noStroke();
  
  //cara i cabell//
  fill(255,220,170);
  
  rect(x+12,y+8,7,9);
  triangle(x+19,y+0.5,x+19,y+15,x+32.5,y+13); //recubriment de la cara//  
  
  arc(x+12,y+12.5,10,9,HALF_PI,HALF_PI+PI);
  arc(x+19,y+8,14,15,PI,PI+HALF_PI);
  beginShape();
  vertex(x+19,y+0.5);
  bezierVertex(x+19,y+0.5,x+28,y+2,x+30,y+9.3);
  vertex(x+12,y+17.5);
  bezierVertex(x+12,y+17.5,x+22,y+18,x+32.5,y+13);
  vertex(x+26,y+12.5);
  bezierVertex(x+26,y+12.5,x+35,y+2,x+32.5,y+13);
  endShape();
  
  noFill();
  stroke(0);
  strokeWeight(1.2);
  beginShape();
  vertex(x+16,y+1);
  bezierVertex(x+16,y+1,x+28,y+0,x+29.5,y+8);//línia de cabell//
  endShape();
  
  noStroke();
  fill(0);
  triangle(x+31,y+8,x+29,y+9.5,x+28.75,y+5); //acabament del cabell//
  
  
  noStroke();
  
  //boca, ulls i celles//
  fill(140,90,100);
  ellipse(x+12,y+16,3,3.5);
  
  fill(0);
  ellipse(x+16.5,y+8,3.5,3.5);
  ellipse(x+24,y+9,3.5,3.5);
  
  fill(255);
  ellipse(x+16.75,y+8.25,1.25,1.25);
  ellipse(x+24.25,y+9.25,1.25,1.25);
  
  noFill();
  stroke(0);
  strokeWeight(0.2);
  arc(x+16,y+6.25,5,5,PI,PI+PI);
  arc(x+22.5,y+6.5,5,4.5,PI,PI+PI);
  
  strokeWeight(1.5);
  line(x+13.5,y+2.5,x+16,y+0.5);
  line(x+16,y+0.5,x+18,y+2.5);
  
  line(x+20.5,y+2.5,x+23,y+0.75);
  line(x+23,y+0.75,x+25.5,y+4); 
  
  //popMatrix();
}
