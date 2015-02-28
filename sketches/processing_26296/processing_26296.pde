
//Learning how to add TEXT
//(text,x position,yposition)
//can change both its fill (with normal fill command) and size (with new textSize command)
//can add opacity to text fill and put position as mouseX,mouseY to move text and it leaves a trail

//importance of sketch folder, sketch pde file, and data folder w/in sketch folder (on above toolbar, go to "sketch", "show sketch folder")

//learned how to choose a font, and then store it as a variable w/in processing (the box idea from last week)
PFont dialog;
PFont calibri;
PImage orange;

//telling processing to assign the file in blue type to "blackadder" command
//can now get rid of testSize command, b/c the file has a size
void setup(){
  size(600,600);
  background(255);
  dialog=loadFont("Dialog-72.vlw");
  calibri=loadFont("Calibri-72.vlw");
  orange=loadImage ("orange.jpg");
}

void draw(){
  background(255);
  
  //can also use the tint(0,0,255,100); for example
  image(orange,300,350);
  
  textFont(dialog);
  fill(0,100);
  text("At any given x",0,20);
  text("the incremental volume",0,50);
  text("(δV) is given by the",0,80);
  text("product of cross-sectional",0,110);
  text("area of the disk at x and ",0,140);
  text("ickness (δx) in the",0,170); 
  text("limit as δx approaches zero this becomes",0,200);
  text("ny given x, a right-angled",0,230);
  text("triangle connects x, y and r",0,260);
  text("to the origin, hence it follows",0,290);
  text("rom Pythagorean theorem that",0,320);
  text("gher dimensions, hypersphere",0,350);
  text("rsive formulas exist",0,380);
  
  textFont(calibri);
  textSize(300);
  fill(255,150,0,150);
  text("YUM",25,500);
}


