
String[] texte;
int[] commits;
int[] number;
PImage img;
float x;
float y;


void setup(){
  size(500, 500);
  x = width/2;
  y = 200;
  img = loadImage("1.png");
  
  Table teachers = loadTable("code_teachers_commits.tsv", "header");
  
  texte = new String[teachers.getRowCount()];
  commits = new int[teachers.getRowCount()];
  number = new int[teachers.getRowCount()];
  int i = 0;
  
  for(TableRow r : teachers.rows()){
    
    texte[i] = r.getString("texte");
    commits[i] = r.getInt("commits");
    number[i] = r.getInt("number");
    i++;
  }
}

void draw(){

  background(54, 0, 43);
  
  float xDraw;
  float yDraw;
  float yRun;
  float xRun;
  xDraw = sin(frameCount * 0.01) * 127;
  yDraw = cos(frameCount * 0.01) * 20;
   xRun = sin(frameCount * 0.01) * 150;
  yRun = cos(frameCount * 0.01) * 50;
  
  if (y + yRun > y){
//  ellipse(x + xRun, y + yDraw, 10, 10);
textAlign(CENTER);
  for(int i = 0; i < texte.length; i++){
    fill(255,156,3);
    textSize(commits[i]*5);
    text(texte[i], width/2, 150+i * 45);
  }
  image(img, x + xRun, y + yDraw, 50, 50);

}

else{ 
   image(img, x + xRun, y + yRun, 50, 50);
   textAlign(CENTER);
  for(int i = 0; i < texte.length; i++){
    fill(255,156,3);
    textSize(commits[i]*5);
    text(texte[i], width/2, 150+i * 45);
  }

//  ellipse(x + xRun, y + yRun, 10, 10);
  
} 
  
  
//  triangle text
//  textAlign(CENTER);
//  for(int i = 0; i < texte.length; i++){
//    fill(255,156,3);
//    textSize(commits[i]*5);
//    text(texte[i], width/2, 150+i * 45);
//  }
}



