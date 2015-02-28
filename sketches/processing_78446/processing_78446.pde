
String word = "This spring morning in bed.I'm lying Not to awake till birds are crying.After one night of wind and showers.How many are the fallen flowers!";
PFont f;
char[]letters;
float c=0.05;;


void setup(){
  size(500,500);
  f = loadFont("BookAntiqua-48.vlw");
  textFont(f);
  letters = word.toCharArray();
  fill(255);
  smooth();
}
  

void draw(){
  background(0);
  pushMatrix();
  translate(250,250);
  for (int i=0;i<letters. length; i++){
    float angle = map(mouseX, 0, width,0,PI/8); 
    rotate (angle);
   text(letters[i],mouseX, 0);
   fill(i,i,i);
 

  // translate(textWidth(letters[i]),0);
   }
   
  
 
  popMatrix();
 


 


 
  }




