
PFont font;
font = loadFont("TeluguMN-Bold-24.vlw");
String text1="People associate stories with familiar objects.";
String text2="How might we design for more persistent memories?";
String text3="How could this experience be different than drawing a picture or taking a photograph?";
String text4="We wondered how we might translate a story into meaningful objects.";
int i;


size(580,480);
background(0,220);
textFont(font);

//fill(20,60,135,255);
//text(text2,185, 158);
fill(80,235,155,255);
text(text3,0, 279);
fill(210,110,130,255);
text(text1,45,55);
fill(85,125,205,255);
text(text2,185, 158);
fill(155,80,90,255);
text(text4,185,365);

for(i=-10;i<480;i+=48){
 
  
  pushMatrix();
  //text(text1,0,i);
  textAlign(LEFT);
  scale(1, -1);
  fill(200,150,190,70);
  text(text1, 45, 30-i);
  
   popMatrix();

   pushMatrix();
  textAlign(LEFT);
 
  
  scale(1, -1);
  fill(120,90,190,87);
  text(text2, 185,23-i);
  
    popMatrix();
 pushMatrix();
 scale(1, -1);
  fill(40,190,160,59);
  text(text3, 0,-2-i);
  
    popMatrix();
    
   pushMatrix();
  textAlign(LEFT);
 
  
  scale(1, -1);
  fill(175,90,100,90);
  text(text4, 185,8-i);
  
    popMatrix();

}

