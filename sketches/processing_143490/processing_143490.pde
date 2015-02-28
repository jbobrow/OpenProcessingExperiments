
void setup(){
  size (600,600);
}

void draw(){
background(250);


//cara, orejas
fill(242,194,149);
stroke(0);
strokeWeight(6);

ellipse(mouseX+width/6,mouseY+height/250,width/12,height/12);
ellipse(mouseX-width/6,mouseY+height/250,width/12,height/12);
ellipse(mouseX,mouseY,width/3,height/3);


//rayas frente
noFill();
stroke(0);
strokeWeight(6);
line(mouseX-width/20,mouseY-height/8,mouseX+width/20,mouseY-height/8);
line(mouseX-width/15,mouseY-height/9.5,mouseX+width/15,mouseY-height/9.5);
line(mouseX-width/11.8,mouseY-height/11,mouseX+width/11.8,mouseY-height/11);


//gafas

noFill();
stroke(0);
strokeWeight(5);
line(mouseX+width/6,mouseY-height/25,mouseX-width/6,mouseY-height/25);
fill(219,255,248);
stroke(0);
strokeWeight(6);
ellipse(mouseX+width/15,mouseY-height/32,width/12,width/12);
ellipse(mouseX-width/15,mouseY-height/32,width/12,width/12);

//ojos
fill(255);
ellipse(mouseX+width/15,mouseY-height/32,width/22,width/22);
ellipse(mouseX-width/15,mouseY-height/32,width/22,width/22);
fill(0);
ellipse(mouseX+width/15,mouseY-height/32,width/120,width/120);
ellipse(mouseX-width/15,mouseY-height/32,width/120,width/120);

//boca
fill(226,16,20);
ellipse(mouseX,mouseY+height/12,width/12,height/16);

//bigote
fill(255);
ellipse(mouseX,mouseY+height/15,width/8,height/18.5);


//nariz
fill(242,194,149);
stroke(0);
strokeWeight(6);
ellipse(mouseX,mouseY+height/45,width/22,height/22);

}
