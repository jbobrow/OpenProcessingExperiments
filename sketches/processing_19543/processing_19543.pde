
PFont font;


size(250,250); 
  smooth(); 
  font = loadFont("TrajanPro-Regular-48.vlw");
  //the exact file name of your VLW font
  background(233, 224, 131);
  textFont(font);


fill (181, 98, 85);
textSize(18);

for(int i=0; i<250; i+=10) {
for(int j=0; j<350; j+=25) 
{text("L4G0C8", j-i, i);//create the "texture"

}
}
text("L4G0C8", 175, 240);//create the text in the bottom


