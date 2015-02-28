
//http://www.epa.gov/osw/nonhaz/municipal/pubs/msw_2010_rev_factsheet.pdf
int x;
int dir;

void setup() {
  size (800,1200);
  smooth();
}

void draw() {
  background (0);
  fill(153); // TEXT
  if (dir == 0){
  x++;}
  if (dir == 1){
  x--;}
  if (x >450){
  dir = 1;}
  if (x<0){
   dir = 0;}
  textSize(200);
  text("EPA",x,200);
  
  textSize(30);
  text("Generation and Recovery of Materials 2010",100, 250);
  
  textSize(15);
  text("http://www.epa.gov/wastes/nonhaz/municipal/pubs/msw_2010_rev_factsheet.pdf",114,298);
  
textSize(12);
  text("Paper and Paperboard", 325, 700);
  text("Metals",375,920);
  text("Glass", 375,820);
  text("Plastics",375,550);
  text("Rubber and Leather",375,450);
  
  //paper and paperboard
  if(mouseX>300&&mouseX;<500&&mouseY;>550&&mouseY;<650){
  arc(400,600,200,200,0,radians(360*.625));
  }
  arc(400,600,100,100,0,radians(360*.625)); 
 
 //glass
  fill(188,25,158);
  if(mouseX>400&&mouseX;<550&&mouseY;>650&&mouseY;<800){
  arc(400,750,200,200,0,radians(360*.271));
  }
  arc(400,750,100,100,0,radians(360*.271));
  
  //metals
  fill(48,202,206);
  if(mouseX>300&&mouseX;<500&&mouseY;>850&&mouseY;<900){
  arc(400,850,200,200,0,radians(360*.351));
  }
  arc(400,850,100,100,0,radians(360*.351));
  
  //plastic
  fill(114,167,240);
  if(mouseX>300&&mouseX;<500&&mouseY;>450&&mouseY;<550){
  arc(400,500,200,200,0,radians(360*.082));
  }
  arc(400,500,100,100,0,radians(360*.082));
  
  //rubber and leather
  fill(250,30,45);
  if(mouseX>350&&mouseX;<450&&mouseY;>400&&mouseY;<450){
  arc(400,390,200,200,0,radians(360*.15));
  }
  arc(400,390,100,100,0,radians(360*.15));
  
 //print(mouseX);
 //print("...");
 //print(mouseY); 
 //print("...");
}

