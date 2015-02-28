
size(900,600);
background(255,205,164);
fill(164,255,255,95);
smooth();
noStroke();
//stroke(255);
//strokeWeight(2);
float offsetX=width/30;
float posX=width/2.5;
float posY=height/4;

ellipse(width/2.5,height/2,width/4,width/4);
fill(255,205,164);

ellipse(width/2.5,height/2,width/4-2*offsetX,width/4-2*offsetX);


fill(164,255,255,90);

beginShape();
vertex(posX,posY);
//左边点一
vertex(posX,posY+height/2);
//左下
vertex(posX+offsetX, posY+height/2);
//3
vertex(posX+offsetX, height/2);
//4
vertex(posX+6*offsetX,posY+height/2);
//5
vertex(posX+7.5*offsetX,posY+height/2);
//6
vertex(posX+2.5*offsetX, height/2);
//7
vertex(posX+7.5*offsetX,posY);
//8
vertex(posX+6*offsetX,posY);
//9
vertex(posX+offsetX, height/2);
vertex(posX+offsetX, posY);

endShape(CLOSE);






