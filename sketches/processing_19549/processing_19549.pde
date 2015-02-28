
PFont font;


size(250,250); 
  smooth(); 
  font = loadFont("MesquiteStd-48.vlw");
  //the exact file name of your VLW font
  background(149, 15, 67);
  textFont(font);


strokeWeight(8);
textSize(50);
fill(255, 217, 143);

for(int i=0; i<250; i+=50) {
for(int j=0; j<250; j+=80) 
{stroke(i,40,120);
text("L4G0C8", i+j, i+60);

}
}

