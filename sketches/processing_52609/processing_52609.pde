
float strkWdth=10;
int llpsMd=CORNERS;

void setup(){
  size(500,500);
  background(10,170,255);
}

void draw(){smooth();noFill();

strokeWeight(strkWdth);
if(mousePressed){strkWdth=strkWdth+5;}else{strkWdth=10;}

ellipseMode(CENTER);
if(keyPressed&&mouseY<250 ){ellipseMode(llpsMd);}
else if(keyPressed&&mouseY>250){ellipseMode(-llpsMd);}
  
  
//topleft
stroke(pmouseX+100,pmouseY,pmouseX);
ellipse(100,100,abs(mouseX-300),abs(mouseY-300));
ellipse(100,100,abs(mouseY-300),abs(mouseX-300));
//topright
stroke(pmouseX,pmouseY+100,pmouseX);
ellipse(400,100,abs(mouseX-300),abs(mouseY-300));
ellipse(400,100,abs(mouseY-300),abs(mouseX-300));
//bottomleft
stroke(pmouseX,pmouseY+100,pmouseX);
ellipse(100,400,abs(mouseX-300),abs(mouseY-300));
ellipse(100,400,abs(mouseY-300),abs(mouseX-300));
//bottomright
stroke(pmouseX+100,pmouseY,pmouseX);
ellipse(400,400,abs(mouseX-300),abs(mouseY-300));
ellipse(400,400,abs(mouseY-300),abs(mouseX-300));
//center
stroke(pmouseX,pmouseY,pmouseX+100);
ellipse(250,250,abs(mouseX-pmouseX/75),abs(mouseY-pmouseY/75));
ellipse(250,250,abs(mouseY-pmouseY/75),abs(mouseX-pmouseX/75));
//8Corners
//1
stroke(mouseX-100,mouseY,mouseX*mouseY);
ellipse(250,62,abs(mouseY-pmouseY*1.25),abs(mouseX-pmouseX*1.25));
ellipse(250,62,abs(mouseX-pmouseX*1.25),abs(mouseY-pmouseY*1.25));
//2
stroke(mouseX-100,mouseY,mouseX*mouseY);
ellipse(438,160,abs(mouseY-pmouseY*1.25),abs(mouseX-pmouseX*1.25));
ellipse(438,160,abs(mouseX-pmouseX*1.25),abs(mouseY-pmouseY*1.25));
//3
stroke(mouseX-100,mouseY,mouseX*mouseY);
ellipse(62,160,abs(mouseY-pmouseY*1.25),abs(mouseX-pmouseX*1.25));
ellipse(62,160,abs(mouseX-pmouseX*1.25),abs(mouseY-pmouseY*1.25));
//3
stroke(mouseX-100,mouseY,mouseX*mouseY);
ellipse(62,340,abs(mouseY-pmouseY*1.25),abs(mouseX-pmouseX*1.25));
ellipse(62,340,abs(mouseX-pmouseX*1.25),abs(mouseY-pmouseY*1.25));
//5
stroke(mouseX-100,mouseY,mouseX*mouseY);
ellipse(250,438,abs(mouseY-pmouseY*1.25),abs(mouseX-pmouseX*1.25));
ellipse(250,438,abs(mouseX-pmouseX*1.25),abs(mouseY-pmouseY*1.25));
//6
stroke(mouseX-100,mouseY,mouseX*mouseY);
ellipse(438,340,abs(mouseY-pmouseY*1.25),abs(mouseX-pmouseX*1.25));
ellipse(438,340,abs(mouseX-pmouseX*1.25),abs(mouseY-pmouseY*1.25));

}


