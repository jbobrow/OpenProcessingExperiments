
// Projeto Final - Visualizacao de Dados
// Joao Penna e Ronan Lana

PImage dboard;
PImage buttonPressed;
PImage buttonReleased;

void setup() {
  
  size (1280, 720); 
  background(#cccccc);   
  noStroke();
  
  //layout
  dboard = loadImage("design1.png");
  buttonPressed = loadImage ("bp.png");
  buttonReleased = loadImage ("bu.png");
  image(dboard, 0, 0);
  
  
String lines[] = loadStrings("January_2014_Web_25_CSV.csv");
String [][] csv;
int csvWidth=0;

//calculate max width of csv file
for (int i=0; i < lines.length; i++) {
  String [] chars=split(lines[i],',');
  if (chars.length>csvWidth){
    csvWidth=chars.length;
  }
}

//create csv array based on # of rows and columns in csv file
csv = new String [lines.length][csvWidth];

//parse values into 2d array
for (int i=0; i < lines.length; i++) {
  String [] temp = new String [lines.length];
  temp= split(lines[i], ',');
  for (int j=0; j < temp.length; j++){
   csv[i][j]=temp[j];
  }
}

//test
println(csv[2][2]);
  
  //text
  fill (#51acd3);
  textSize(25);
  String textTop = "PewResearch Internet Project - Internet Use Dataset Visualization";
  String instructions = "SELECT A QUESTION ON THE LEFT AND THEN DRAW";
  String instructions2 = "A VISUALIZATION BASED ON THE PROFILE SELECTED";
  String profile = "Profile";
  text (textTop, 38,45);
  textSize (20);
  fill (#FFFFFF);
  text (profile, 1030, 90);
  text ("Questions", 600, 600); 
  textSize (14);
  text  (instructions, 885,535);
  text  (instructions2,885,550);
  textSize (20);
  text ("DRAW TOP", 990, 605);
  text ("DRAW BOTTOM", 990, 650);
  textSize (14);
  text ("Gender", 900, 145+50);
  text ("Region", 900, 195+50);
  text ("Employment", 900, 245+50);
  text ("Parent", 900, 295+50);
  text ("Race", 900, 345+50);
  text ("Hispanic", 900, 395+50);
  desenhadescricao();

}//void setup

void draw(){
  //resetting variables
  resetvar();
  
  //CSV file on directory
  table = loadTable ("January_2014_Web_25_CSV.csv", "header");
  for (TableRow row : table.rows()) {       
    int sex = row.getInt ("sex");
    int cregion = row.getInt ("cregion");
    int employ = row.getInt ("employ");
    int par = row.getInt ("par");
    int educ2 = row.getInt ("educ2");
    int hisp = row.getInt ("hisp");
    int race = row.getInt ("race"); 
    int inc = row.getInt ("inc"); 
    if (sex == psex || psex == 0){
      if (cregion == pcregion || pcregion == 0){
        if (employ == pemploy || pemploy == 0){ 
          if (par == ppar || ppar == 0){
            if (educ2 == peduc2 || peduc2 == 0){
              if (hisp == phisp || phisp == 0){
                if (race == prace || prace == 0){
                  if (inc == pinc || pinc == 0){
                    {
                      n++;
                    }
                    {//pial1
                      int pial1 = row.getInt("pial1");
                           if (pial1 == 1){ p11++;}
                      else if (pial1 == 2){ p12++;}
                      else if (pial1 == 8){ p18++;} 
                      else if (pial1 == 9){ p19++;} 
                      if (pial1 == 1 || pial1 == 2 || pial1 == 8 || pial1 == 9) { n1++; }
                    }
                    {//pial2
                      int pial2 = row.getInt("pial2");
                           if (pial2 == 1){ p21++;}
                      else if (pial2 == 2){ p22++;}
                      else if (pial2 == 8){ p28++;} 
                      else if (pial2 == 9){ p29++;}
                      if (pial2 == 1 || pial2 == 2 || pial2 == 8 || pial2 == 9) { n2++; }
                    }
                    {//pial3
                      int pial3 = row.getInt("pial3");
                           if (pial3 == 1){ p31++;}
                      else if (pial3 == 2){ p32++;}
                      else if (pial3 == 8){ p38++;} 
                      else if (pial3 == 9){ p39++;}
                      if (pial3 == 1 || pial3 == 2 || pial3 == 8 || pial3 == 9) { n3++; }
                    }
                    {//pial4
                      int pial4 = row.getInt("pial4");
                           if (pial4 == 1){ p41++;}
                      else if (pial4 == 2){ p42++;}
                      else if (pial4 == 3){ p43++;}
                      else if (pial4 == 4){ p44++;}
                      else if (pial4 == 8){ p48++;} 
                      else if (pial4 == 9){ p49++;}
                      if (pial4 == 1 || pial4 == 2 || pial4 == 3 || pial4 == 4 || pial4 == 8 || pial4 == 9) { n4++; }
                    }
                    {//eminuse
                      int eminuse = row.getInt("eminuse");
                           if (eminuse == 1){ eminuse1++;}
                      else if (eminuse == 2){ eminuse2++;}
                      else if (eminuse == 8){ eminuse8++;} 
                      else if (eminuse == 9){ eminuse9++;}
                      if (eminuse == 1 || eminuse == 2 || eminuse == 8 || eminuse == 9) { neminuse++; }
                    }
                    {//intmob
                      int intmob = row.getInt("intmob");
                           if (intmob == 1){ intmob1++;}
                      else if (intmob == 2){ intmob2++;}
                      else if (intmob == 8){ intmob8++;} 
                      else if (intmob == 9){ intmob9++;}
                      if (intmob == 1 || intmob == 2 || intmob == 8 || intmob == 9) { nintmob++; }
                    }
                    {//pial5a
                      int pial5a = row.getInt("pial5a");
                           if (pial5a == 1){ p5a1++;}
                      else if (pial5a == 2){ p5a2++;}
                      else if (pial5a == 3){ p5a3++;}
                      else if (pial5a == 4){ p5a4++;}
                      else if (pial5a == 5){ p5a5++;}
                      else if (pial5a == 6){ p5a6++;}
                      else if (pial5a == 7){ p5a7++;}
                      else if (pial5a == 8){ p5a8++;}
                      else if (pial5a == 9){ p5a9++;}
                      if (pial5a == 1 || pial5a == 2 || pial5a == 3 || pial5a == 4 || pial5a == 5 || pial5a == 6 || pial5a == 7 || pial5a == 8 || pial5a == 9) { n5a++; }
                    }
                    {//pial5b
                      int pial5b = row.getInt("pial5b");
                           if (pial5b == 1){ p5b1++;}
                      else if (pial5b == 2){ p5b2++;}
                      else if (pial5b == 3){ p5b3++;}
                      else if (pial5b == 4){ p5b4++;}
                      else if (pial5b == 5){ p5b5++;}
                      else if (pial5b == 6){ p5b6++;}
                      else if (pial5b == 7){ p5b7++;}
                      else if (pial5b == 8){ p5b8++;}
                      else if (pial5b == 9){ p5b9++;}
                      if (pial5b == 1 || pial5b == 2 || pial5b == 3 || pial5b == 4 || pial5b == 5 || pial5b == 6 || pial5b == 7 || pial5b == 8 || pial5b == 9) { n5b++; }
                    }
                    {//pial5c
                      int pial5c = row.getInt("pial5c");
                           if (pial5c == 1){ p5c1++;}
                      else if (pial5c == 2){ p5c2++;}
                      else if (pial5c == 3){ p5c3++;}
                      else if (pial5c == 4){ p5c4++;}
                      else if (pial5c == 5){ p5c5++;}
                      else if (pial5c == 6){ p5c6++;}
                      else if (pial5c == 7){ p5c7++;}
                      else if (pial5c == 8){ p5c8++;}
                      else if (pial5c == 9){ p5c9++;}
                      if (pial5c == 1 || pial5c == 2 || pial5c == 3 || pial5c == 4 || pial5c == 5 || pial5c == 6 || pial5c == 7 || pial5c == 8 || pial5c == 9) { n5c++; }

                    }
                    {//pial5d
                      int pial5d = row.getInt("pial5d");
                           if (pial5d == 1){ p5d1++;}
                      else if (pial5d == 2){ p5d2++;}
                      else if (pial5d == 3){ p5d3++;}
                      else if (pial5d == 4){ p5d4++;}
                      else if (pial5d == 5){ p5d5++;}
                      else if (pial5d == 6){ p5d6++;}
                      else if (pial5d == 7){ p5d7++;}
                      else if (pial5d == 8){ p5d8++;}
                      else if (pial5d == 9){ p5d9++;}
                      if (pial5d == 1 || pial5d == 2 || pial5d == 3 || pial5d == 4 || pial5d == 5 || pial5d == 6 || pial5d == 7 || pial5d == 8 || pial5d == 9) { n5d++; }

                    }
                    {//pial5e
                      int pial5e = row.getInt("pial5e");
                           if (pial5e == 1){ p5e1++;}
                      else if (pial5e == 2){ p5e2++;}
                      else if (pial5e == 3){ p5e3++;}
                      else if (pial5e == 4){ p5e4++;}
                      else if (pial5e == 5){ p5e5++;}
                      else if (pial5e == 6){ p5e6++;}
                      else if (pial5e == 7){ p5e7++;}
                      else if (pial5e == 8){ p5e8++;}
                      else if (pial5e == 9){ p5e9++;}
                      if (pial5e == 1 || pial5e == 2 || pial5e == 3 || pial5e == 4 || pial5e == 5 || pial5e == 6 || pial5e == 7 || pial5e == 8 || pial5e == 9) { n5e++; }
                    }
                    {//pial5f
                      int pial5f = row.getInt("pial5f");
                           if (pial5f == 1){ p5f1++;}
                      else if (pial5f == 2){ p5f2++;}
                      else if (pial5f == 3){ p5f3++;}
                      else if (pial5f == 4){ p5f4++;}
                      else if (pial5f == 5){ p5f5++;}
                      else if (pial5f == 6){ p5f6++;}
                      else if (pial5f == 7){ p5f7++;}
                      else if (pial5f == 8){ p5f8++;}
                      else if (pial5f == 9){ p5f9++;}
                      if (pial5f == 1 || pial5f == 2 || pial5f == 3 || pial5f == 4 || pial5f == 5 || pial5f == 6 || pial5f == 7 || pial5f == 8 || pial5f == 9) { n5f++; }
                    }
                    {//pial6
                      int pial6 = row.getInt("pial6");
                           if (pial6 == 1){ p61++;}
                      else if (pial6 == 2){ p62++;}
                      else if (pial6 == 3){ p63++;}
                      else if (pial6 == 4){ p64++;}
                      else if (pial6 == 8){ p68++;}
                      else if (pial6 == 9){ p69++;}
                      if (pial6 == 1 || pial6 == 2 || pial6 == 3 || pial6 == 4 || pial6 == 8 || pial6 == 9) { n6++; }
                    }
                    {//pial8a
                      int pial8a = row.getInt("pial8a");
                           if (pial8a == 1){ p8a1++;}
                      else if (pial8a == 2){ p8a2++;}
                      else if (pial8a == 8){ p8a8++;} 
                      else if (pial8a == 9){ p8a9++;}
                      if (pial8a == 1 || pial8a == 2 || pial8a == 8 || pial8a == 9) { n8a++; }
                    }
                    {//pial8b
                      int pial8b = row.getInt("pial8b");
                           if (pial8b == 1){ p8b1++;}
                      else if (pial8b == 2){ p8b2++;}
                      else if (pial8b == 8){ p8b8++;} 
                      else if (pial8b == 9){ p8b9++;} 
                      if (pial8b == 1 || pial8b == 2 || pial8b == 8 || pial8b == 9) { n8b++; }
                    }
                    {//pial8c
                      int pial8c = row.getInt("pial8c");
                           if (pial8c == 1){ p8c1++;}
                      else if (pial8c == 2){ p8c2++;}
                      else if (pial8c == 8){ p8c8++;} 
                      else if (pial8c == 9){ p8c9++;} 
                      if (pial8c == 1 || pial8c == 2 || pial8c == 8 || pial8c == 9) { n8c++; }
                    }
                    {//pial8d
                      int pial8d = row.getInt("pial8d");
                           if (pial8d == 1){ p8d1++;}
                      else if (pial8d == 2){ p8d2++;}
                      else if (pial8d == 8){ p8d8++;} 
                      else if (pial8d == 9){ p8d9++;} 
                      if (pial8d == 1 || pial8d == 2 || pial8d == 8 || pial8d == 9) { n8d++; }
                    }
                    {//pial9
                      int pial9 = row.getInt("pial9");
                           if (pial9 == 1){p91++;}
                      else if (pial9 == 2){p92++;}
                      else if (pial9 == 3){p93++;}
                      else if (pial9 == 4){p94++;}
                      else if (pial9 == 5){p95++;}
                      else if (pial9 == 8){p98++;}
                      else if (pial9 == 9){p99++;}
                      if (pial9 == 1 || pial9 == 2 || pial9 == 3 || pial9 == 4 || pial9 == 5 || pial9 == 8 || pial9 == 9) { n9++; }
                    }
                    {//pial10
                      int pial10 = row.getInt("pial10");
                           if (pial10 == 1){p101++;}
                      else if (pial10 == 2){p102++;}
                      else if (pial10 == 3){p103++;}
                      else if (pial10 == 4){p104++;}
                      else if (pial10 == 8){p108++;}
                      else if (pial10 == 9){p109++;}
                      if (pial10 == 1 || pial10 == 2 || pial10 == 3 || pial10 == 4 || pial10 == 8 || pial10 == 9) { n10++; }
                    }
                    {//pial11
                      int pial11 = row.getInt("pial11");
                           if (pial11 == 1){p111++;}
                      else if (pial11 == 2){p112++;}
                      else if (pial11 == 3){p113++;}
                      else if (pial11 == 8){p118++;}
                      else if (pial11 == 9){p119++;}
                      if (pial11 == 1 || pial11 == 2 || pial11 == 3 || pial11 == 8 || pial11 == 9) { n11++; }
                    }
                    {//pial12
                      int pial12 = row.getInt("pial12");
                           if (pial12 == 1){p121++;}
                      else if (pial12 == 2){p122++;}
                      else if (pial12 == 3){p123++;}
                      else if (pial12 == 8){p128++;}
                      else if (pial12 == 9){p129++;}
                      if (pial12 == 1 || pial12 == 2 || pial12 == 3 || pial12 == 8 || pial12 == 9) { n12++; }
                    }
                    {//pialql1
                      int pialql1 = row.getInt("pialql1");
                           if (pialql1 == 1){ ql1++;}
                      else if (pialql1 == 2){ ql2++;}
                      else if (pialql1 == 8){ ql8++;} 
                      else if (pialql1 == 9){ ql9++;}
                      if (pialql1 == 1 || pialql1 == 2 || pialql1 == 8 || pialql1 == 9) { nql1++; }
                    }
                    {//smart1
                      int smart1 = row.getInt("smart1");
                           if (smart1 == 1){ sm1++;}
                      else if (smart1 == 2){ sm2++;}
                      else if (smart1 == 8){ sm8++;} 
                      else if (smart1 == 9){ sm9++;}
                      if (smart1 == 1 || smart1 == 2 || smart1 == 8 || smart1 == 9) { nsm1++; }
                    }
                  }
                }
              }
            }
          }              
        }
      }
    }       
  }
  
  if (selectquestion == 0) image (buttonPressed, hf2,        vf2);
  else { image (buttonReleased, hf2,        vf2); } 
  if (selectquestion == 1) image (buttonPressed, hf2+blbs,   vf2);
  else { image (buttonReleased, hf2+blbs,   vf2); }
  if (selectquestion == 2) image (buttonPressed, hf2+blbs*2, vf2);
  else { image (buttonReleased, hf2+blbs*2, vf2); }
  if (selectquestion == 3) image (buttonPressed, hf2+blbs*3, vf2);
  else { image (buttonReleased, hf2+blbs*3, vf2); }
  if (selectquestion == 4) image (buttonPressed, hf2+blbs*4, vf2);
  else { image (buttonReleased, hf2+blbs*4, vf2); }
  if (selectquestion == 5) image (buttonPressed, hf2+blbs*5, vf2);
  else { image (buttonReleased, hf2+blbs*5, vf2); } 
  if (selectquestion == 6) image (buttonPressed, hf2+blbs*6, vf2);
  else { image (buttonReleased, hf2+blbs*6, vf2); } 
  if (selectquestion == 7) image (buttonPressed, hf2+blbs*7, vf2);
  else { image (buttonReleased, hf2+blbs*7, vf2); }
   
  if (selectquestion == 8) image (buttonPressed, hf2,        vf3);
  else { image (buttonReleased, hf2,        vf3); }
  if (selectquestion == 9) image (buttonPressed, hf2+blbs,   vf3);
  else { image (buttonReleased, hf2+blbs,   vf3); }
  if (selectquestion == 10) image (buttonPressed, hf2+blbs*2, vf3);
  else { image (buttonReleased, hf2+blbs*2, vf3); }
  if (selectquestion == 11) image (buttonPressed, hf2+blbs*3, vf3);
  else { image (buttonReleased, hf2+blbs*3, vf3); }
  if (selectquestion == 12) image (buttonPressed, hf2+blbs*4, vf3);
  else { image (buttonReleased, hf2+blbs*4, vf3); }
  if (selectquestion == 13) image (buttonPressed, hf2+blbs*5, vf3);
  else { image (buttonReleased, hf2+blbs*5, vf3); }
  if (selectquestion == 14) image (buttonPressed, hf2+blbs*6, vf3);
  else { image (buttonReleased, hf2+blbs*6, vf3); }
  /*  if (selectquestion == 15) image (buttonPressed, hf2+blbs*7, vf3);
  else { image (buttonReleased, hf2+blbs*7, vf3); }*/ 
  
  if (psex == 0) image (buttonPressed, hf,                   vf);
  else { image (buttonReleased, hf,                   vf); }
  if (psex == 1) image (buttonPressed, hf+blbs,              vf);
  else { image (buttonReleased, hf+blbs,              vf); }
  if (psex == 2) image (buttonPressed, hf+blbs*2,            vf);
  else { image (buttonReleased, hf+blbs*2,            vf); }
    
  if (pcregion == 0 ) image (buttonPressed, hf,        vs+vfbh      );
  else { image (buttonReleased, hf,        vs+vfbh      ); } 
  if (pcregion == 1 ) image (buttonPressed, hf+blbs,   vs+vfbh      );
  else { image (buttonReleased, hf+blbs,   vs+vfbh      ); }
  if (pcregion == 2 ) image (buttonPressed, hf+blbs*2, vs+vfbh      );
  else { image (buttonReleased, hf+blbs*2, vs+vfbh      ); }
  if (pcregion == 3 ) image (buttonPressed, hf+blbs*3, vs+vfbh      );
  else { image (buttonReleased, hf+blbs*3, vs+vfbh      ); }
  if (pcregion == 4 ) image (buttonPressed, hf+blbs*4, vs+vfbh      );
  else { image (buttonReleased, hf+blbs*4, vs+vfbh      ); }
    
  if (pemploy == 0 ) image (buttonPressed, hf,        vfbh+vsbh+vs );
  else { image (buttonReleased, hf,        vfbh+vsbh+vs ); }
  if (pemploy == 1 ) image (buttonPressed, hf+blbs,   vfbh+vsbh+vs );
  else { image (buttonReleased, hf+blbs,   vfbh+vsbh+vs ); }
  if (pemploy == 2 ) image (buttonPressed, hf+blbs*2, vfbh+vsbh+vs );
  else { image (buttonReleased, hf+blbs*2, vfbh+vsbh+vs ); }
  if (pemploy == 3 ) image (buttonPressed, hf+blbs*3, vfbh+vsbh+vs );
  else { image (buttonReleased, hf+blbs*3, vfbh+vsbh+vs ); }
    
  if (ppar == 0 ) image (buttonPressed, hf,        vfbh+vsbh*2+vs);
  else { image (buttonReleased, hf,        vfbh+vsbh*2+vs); }
  if (ppar == 1 ) image (buttonPressed, hf+blbs,   vfbh+vsbh*2+vs);
  else { image (buttonReleased, hf+blbs,   vfbh+vsbh*2+vs); } 
  if (ppar == 2 ) image (buttonPressed, hf+blbs*2, vfbh+vsbh*2+vs);
  else { image (buttonReleased, hf+blbs*2, vfbh+vsbh*2+vs); }
    
  if (prace == 0 ) image (buttonPressed, hf,        vfbh+vsbh*3+vs);
  else { image (buttonReleased, hf,        vfbh+vsbh*3+vs); }
  if (prace == 1 ) image (buttonPressed, hf+blbs,   vfbh+vsbh*3+vs);
  else { image (buttonReleased, hf+blbs,   vfbh+vsbh*3+vs); }
  if (prace == 2 ) image (buttonPressed, hf+blbs*2, vfbh+vsbh*3+vs);
  else { image (buttonReleased, hf+blbs*2, vfbh+vsbh*3+vs); }
  if (prace == 3 ) image (buttonPressed, hf+blbs*3, vfbh+vsbh*3+vs);
  else { image (buttonReleased, hf+blbs*3, vfbh+vsbh*3+vs); }
  if (prace == 4 ) image (buttonPressed, hf+blbs*4, vfbh+vsbh*3+vs);
  else { image (buttonReleased, hf+blbs*4, vfbh+vsbh*3+vs); }
  if (prace == 5 ) image (buttonPressed, hf+blbs*5, vfbh+vsbh*3+vs);
  else { image (buttonReleased, hf+blbs*5, vfbh+vsbh*3+vs); }
  if (prace == 6 ) image (buttonPressed, hf+blbs*6, vfbh+vsbh*3+vs);
  else { image (buttonReleased, hf+blbs*6, vfbh+vsbh*3+vs); }
    
  if (phisp == 0 ) image (buttonPressed, hf,        vfbh+vsbh*4+vs);
  else { image (buttonReleased, hf,        vfbh+vsbh*4+vs); } 
  if (phisp == 1 ) image (buttonPressed, hf+blbs,   vfbh+vsbh*4+vs);
  else { image (buttonReleased, hf+blbs,   vfbh+vsbh*4+vs); } 
  if (phisp == 2 ) image (buttonPressed, hf+blbs*2, vfbh+vsbh*4+vs);
  else { image (buttonReleased, hf+blbs*2, vfbh+vsbh*4+vs); }
    
}//draw


void mousePressed(){
   
  //button drawtop
  if (( mouseX > 940 && mouseX < 1184 ) && ( mouseY > 578 && mouseY < 620 )){
         if (selectquestion == 0 ){altura = cima; talt = -10; clearbgcima(); desenhapial1();}
    else if (selectquestion == 1 ){altura = cima; talt = -10; clearbgcima(); desenhapial2();}
    else if (selectquestion == 2 ){altura = cima; talt = -10; clearbgcima(); desenhapial3();}
    else if (selectquestion == 3 ){altura = cima; talt = -10; clearbgcima(); desenhapial4();}
    else if (selectquestion == 4 ){altura = cima; talt = -10; clearbgcima(); desenhapial5();}
    else if (selectquestion == 5 ){altura = cima; talt = -10; clearbgcima(); desenhapial6();}
    else if (selectquestion == 6 ){altura = cima; talt = -10; clearbgcima(); desenhapial8();}
    else if (selectquestion == 7 ){altura = cima; talt = -10; clearbgcima(); desenhapial9();}
    else if (selectquestion == 8 ){altura = cima; talt = -10; clearbgcima(); desenhapial10();}
    else if (selectquestion == 9 ){altura = cima; talt = -10; clearbgcima(); desenhapial11();}
    else if (selectquestion == 10){altura = cima; talt = -10; clearbgcima(); desenhapial12();}
    else if (selectquestion == 11){altura = cima; talt = -10; clearbgcima(); desenhapialql1();}
    else if (selectquestion == 12){altura = cima; talt = -10; clearbgcima(); desenhaeminuse();}
    else if (selectquestion == 13){altura = cima; talt = -10; clearbgcima(); desenhaintmob();}
    else if (selectquestion == 14){altura = cima; talt = -10; clearbgcima(); desenhasmart1();}
  }

    //button drawbot
  else if (( mouseX > 940 && mouseX < 1184 ) && ( mouseY > 624 && mouseY < 666 )){
         if (selectquestion == 0 ){altura = baixo; talt = 235; clearbgbaixo(); desenhapial1();}
    else if (selectquestion == 1 ){altura = baixo; talt = 235; clearbgbaixo(); desenhapial2();}
    else if (selectquestion == 2 ){altura = baixo; talt = 235; clearbgbaixo(); desenhapial3();}
    else if (selectquestion == 3 ){altura = baixo; talt = 235; clearbgbaixo(); desenhapial4();}
    else if (selectquestion == 4 ){altura = baixo; talt = 235; clearbgbaixo(); desenhapial5();}
    else if (selectquestion == 5 ){altura = baixo; talt = 235; clearbgbaixo(); desenhapial6();}
    else if (selectquestion == 6 ){altura = baixo; talt = 235; clearbgbaixo(); desenhapial8();}
    else if (selectquestion == 7 ){altura = baixo; talt = 235; clearbgbaixo(); desenhapial9();}
    else if (selectquestion == 8 ){altura = baixo; talt = 235; clearbgbaixo(); desenhapial10();}
    else if (selectquestion == 9 ){altura = baixo; talt = 235; clearbgbaixo(); desenhapial11();}
    else if (selectquestion == 10){altura = baixo; talt = 235; clearbgbaixo(); desenhapial12();}
    else if (selectquestion == 11){altura = baixo; talt = 235; clearbgbaixo(); desenhapialql1();}
    else if (selectquestion == 12){altura = baixo; talt = 235; clearbgbaixo(); desenhaeminuse();}
    else if (selectquestion == 13){altura = baixo; talt = 235; clearbgbaixo(); desenhaintmob();}
    else if (selectquestion == 14){altura = baixo; talt = 235; clearbgbaixo(); desenhasmart1();}
  }
  
  
  //buttonsprofile
  //gender
       if (( mouseX > hf        && mouseX < hfbl           ) && ( mouseY > vf && mouseY < vfbh ))    { psex = 0; }
  else if (( mouseX > hf+blbs   && mouseX < hf+bl*2 + bs   ) && ( mouseY > vf && mouseY < vfbh ))    { psex = 1; }
  else if (( mouseX > hf+blbs*2 && mouseX < hf+bl*3 + bs*2 ) && ( mouseY > vf && mouseY < vfbh ))    { psex = 2; }
  //region  
  else if (( mouseX > hf        && mouseX < hf+bl          ) && ( mouseY > vs+vfbh && mouseY < vfbh+vsbh))    { pcregion = 0; }
  else if (( mouseX > hf+blbs   && mouseX < hf+bl*2 + bs   ) && ( mouseY > vs+vfbh && mouseY < vfbh+vsbh))    { pcregion = 1; }
  else if (( mouseX > hf+blbs*2 && mouseX < hf+bl*3 + bs*2 ) && ( mouseY > vs+vfbh && mouseY < vfbh+vsbh))    { pcregion = 2; }
  else if (( mouseX > hf+blbs*3 && mouseX < hf+bl*4 + bs*3 ) && ( mouseY > vs+vfbh && mouseY < vfbh+vsbh))    { pcregion = 3; }
  else if (( mouseX > hf+blbs*4 && mouseX < hf+bl*5 + bs*4 ) && ( mouseY > vs+vfbh && mouseY < vfbh+vsbh))    { pcregion = 4; }
  //employ
  else if (( mouseX > hf        && mouseX < hf+bl          ) && ( mouseY > vfbh+vsbh+vs && mouseY < vfbh+vsbh*2))    { pemploy = 0; }
  else if (( mouseX > hf+blbs   && mouseX < hf+bl*2 + bs   ) && ( mouseY > vfbh+vsbh+vs && mouseY < vfbh+vsbh*2))    { pemploy = 1; }
  else if (( mouseX > hf+blbs*2 && mouseX < hf+bl*3 + bs*2 ) && ( mouseY > vfbh+vsbh+vs && mouseY < vfbh+vsbh*2))    { pemploy = 2; }
  else if (( mouseX > hf+blbs*3 && mouseX < hf+bl*4 + bs*3 ) && ( mouseY > vfbh+vsbh+vs && mouseY < vfbh+vsbh*2))    { pemploy = 3; }
  //parents
  else if (( mouseX > hf        && mouseX < hf+bl          ) && ( mouseY > vfbh+vsbh*2+vs && mouseY < vfbh+vsbh*3))    { ppar = 0; }
  else if (( mouseX > hf+blbs   && mouseX < hf+bl*2 + bs   ) && ( mouseY > vfbh+vsbh*2+vs && mouseY < vfbh+vsbh*3))    { ppar = 1; }
  else if (( mouseX > hf+blbs*2 && mouseX < hf+bl*3 + bs*2 ) && ( mouseY > vfbh+vsbh*2+vs && mouseY < vfbh+vsbh*3))    { ppar = 2; }
  //race
  else if (( mouseX > hf        && mouseX < hf+bl          ) && ( mouseY > vfbh+vsbh*3+vs && mouseY < vfbh+vsbh*4))    { prace = 0; }
  else if (( mouseX > hf+blbs   && mouseX < hf+bl*2 + bs   ) && ( mouseY > vfbh+vsbh*3+vs && mouseY < vfbh+vsbh*4))    { prace = 1; }
  else if (( mouseX > hf+blbs*2 && mouseX < hf+bl*3 + bs*2 ) && ( mouseY > vfbh+vsbh*3+vs && mouseY < vfbh+vsbh*4))    { prace = 2; }
  else if (( mouseX > hf+blbs*3 && mouseX < hf+bl*4 + bs*3 ) && ( mouseY > vfbh+vsbh*3+vs && mouseY < vfbh+vsbh*4))    { prace = 3; }
  else if (( mouseX > hf+blbs*4 && mouseX < hf+bl*5 + bs*4 ) && ( mouseY > vfbh+vsbh*3+vs && mouseY < vfbh+vsbh*4))    { prace = 4; }
  else if (( mouseX > hf+blbs*5 && mouseX < hf+bl*6 + bs*5 ) && ( mouseY > vfbh+vsbh*3+vs && mouseY < vfbh+vsbh*4))    { prace = 5; }
  else if (( mouseX > hf+blbs*6 && mouseX < hf+bl*7 + bs*6 ) && ( mouseY > vfbh+vsbh*3+vs && mouseY < vfbh+vsbh*4))    { prace = 6; }
  //hispanic
  else if (( mouseX > hf        && mouseX < hf+bl          ) && ( mouseY > vfbh+vsbh*4+vs && mouseY < vfbh+vsbh*5))    { phisp = 0; }
  else if (( mouseX > hf+blbs   && mouseX < hf+bl*2 + bs   ) && ( mouseY > vfbh+vsbh*4+vs && mouseY < vfbh+vsbh*5))    { phisp = 1; }
  else if (( mouseX > hf+blbs*2 && mouseX < hf+bl*3 + bs*2 ) && ( mouseY > vfbh+vsbh*4+vs && mouseY < vfbh+vsbh*5))    { phisp = 2; }
  
  /*
  else if (( mouseX > hf        && mouseX < hf+bl          ) && ( mouseY > vfbh+vsbh*4+vs && mouseY < vfbh+vsbh*5))    { }
  else if (( mouseX > hf+blbs   && mouseX < hf+bl*2 + bs   ) && ( mouseY > vfbh+vsbh*4+vs && mouseY < vfbh+vsbh*5))    { }
  else if (( mouseX > hf+blbs*2 && mouseX < hf+bl*3 + bs*2 ) && ( mouseY > vfbh+vsbh*4+vs && mouseY < vfbh+vsbh*5))    { }
  else if (( mouseX > hf+blbs*4 && mouseX < hf+bl*5 + bs*4 ) && ( mouseY > vfbh+vsbh*3+vs && mouseY < vfbh+vsbh*4))    { }
  //educ2
  //pinc 
  */
  
//select question
  else if (( mouseX > hf2        && mouseX < hf2+bl          ) && ( mouseY > vf2 && mouseY < vf2+bh))    { selectquestion = 0; }
  else if (( mouseX > hf2+blbs   && mouseX < hf2+bl*2 + bs   ) && ( mouseY > vf2 && mouseY < vf2+bh))    { selectquestion = 1; }
  else if (( mouseX > hf2+blbs*2 && mouseX < hf2+bl*3 + bs*2 ) && ( mouseY > vf2 && mouseY < vf2+bh))    { selectquestion = 2; }
  else if (( mouseX > hf2+blbs*3 && mouseX < hf2+bl*4 + bs*3 ) && ( mouseY > vf2 && mouseY < vf2+bh))    { selectquestion = 3; }
  else if (( mouseX > hf2+blbs*4 && mouseX < hf2+bl*5 + bs*4 ) && ( mouseY > vf2 && mouseY < vf2+bh))    { selectquestion = 4; }
  else if (( mouseX > hf2+blbs*5 && mouseX < hf2+bl*6 + bs*5 ) && ( mouseY > vf2 && mouseY < vf2+bh))    { selectquestion = 5; }
  else if (( mouseX > hf2+blbs*6 && mouseX < hf2+bl*7 + bs*6 ) && ( mouseY > vf2 && mouseY < vf2+bh))    { selectquestion = 6; }
  else if (( mouseX > hf2+blbs*7 && mouseX < hf2+bl*8 + bs*7 ) && ( mouseY > vf2 && mouseY < vf2+bh))    { selectquestion = 7; }

  else if (( mouseX > hf2        && mouseX < hf2+bl          ) && ( mouseY > vf3 && mouseY < vf3+bh))    { selectquestion = 8; }
  else if (( mouseX > hf2+blbs   && mouseX < hf2+bl*2 + bs   ) && ( mouseY > vf3 && mouseY < vf3+bh))    { selectquestion = 9; }
  else if (( mouseX > hf2+blbs*2 && mouseX < hf2+bl*3 + bs*2 ) && ( mouseY > vf3 && mouseY < vf3+bh))    { selectquestion = 10; }
  else if (( mouseX > hf2+blbs*3 && mouseX < hf2+bl*4 + bs*3 ) && ( mouseY > vf3 && mouseY < vf3+bh))    { selectquestion = 11; }
  else if (( mouseX > hf2+blbs*4 && mouseX < hf2+bl*5 + bs*4 ) && ( mouseY > vf3 && mouseY < vf3+bh))    { selectquestion = 12; }
  else if (( mouseX > hf2+blbs*5 && mouseX < hf2+bl*6 + bs*5 ) && ( mouseY > vf3 && mouseY < vf3+bh))    { selectquestion = 13; }
  else if (( mouseX > hf2+blbs*6 && mouseX < hf2+bl*7 + bs*6 ) && ( mouseY > vf3 && mouseY < vf3+bh))    { selectquestion = 14; }
  else if (( mouseX > hf2+blbs*7 && mouseX < hf2+bl*8 + bs*7 ) && ( mouseY > vf3 && mouseY < vf3+bh))    { selectquestion = 15; clearbgcima(); clearbgbaixo(); }
}

void keyPressed (){ 
  //funcionalidades para salvar
  if (key == 's' || key == 'S') saveFrame ("line-######.png");
  if (key == '1') saveFrame ("screenshot1.png");  if (key == '2') saveFrame ("screenshot2.png");
  if (key == '3') saveFrame ("screenshot3.png");  if (key == '4') saveFrame ("screenshot4.png");
  if (key == '5') saveFrame ("screenshot5.png");  if (key == '6') saveFrame ("screenshot6.png");
  if (key == '7') saveFrame ("screenshot7.png");  if (key == '8') saveFrame ("screenshot8.png");
  if (key == '9') saveFrame ("screenshot9.png");  if (key == '0') saveFrame ("screenshot0.png");
}

void mouseMoved(){
        if (( mouseX > hf        && mouseX < hfbl           ) && ( mouseY > vf && mouseY < vfbh ))    {desenhadescricao(); textSize(14); fill (#ffffff); text("All", 950, 140 ); }
  else if (( mouseX > hf+blbs   && mouseX < hf+bl*2 + bs   ) && ( mouseY > vf && mouseY < vfbh ))    {desenhadescricao(); textSize(14); fill (#ffffff); text("Only male", 950, 140 ); }
  else if (( mouseX > hf+blbs*2 && mouseX < hf+bl*3 + bs*2 ) && ( mouseY > vf && mouseY < vfbh ))    {desenhadescricao(); textSize(14); fill (#ffffff); text("Only female", 950, 140 ); }
  //region  
  else if (( mouseX > hf        && mouseX < hf+bl          ) && ( mouseY > vs+vfbh && mouseY < vfbh+vsbh))    {desenhadescricao(); textSize(14); fill (#ffffff); text("All", 950, 140 ); }
  else if (( mouseX > hf+blbs   && mouseX < hf+bl*2 + bs   ) && ( mouseY > vs+vfbh && mouseY < vfbh+vsbh))    {desenhadescricao(); textSize(14); fill (#ffffff); text("North-east", 950, 140 ); }
  else if (( mouseX > hf+blbs*2 && mouseX < hf+bl*3 + bs*2 ) && ( mouseY > vs+vfbh && mouseY < vfbh+vsbh))    {desenhadescricao(); textSize(14); fill (#ffffff); text("Mid-west", 950, 140 ); }
  else if (( mouseX > hf+blbs*3 && mouseX < hf+bl*4 + bs*3 ) && ( mouseY > vs+vfbh && mouseY < vfbh+vsbh))    {desenhadescricao(); textSize(14); fill (#ffffff); text("South", 950, 140 ); }
  else if (( mouseX > hf+blbs*4 && mouseX < hf+bl*5 + bs*4 ) && ( mouseY > vs+vfbh && mouseY < vfbh+vsbh))    {desenhadescricao(); textSize(14); fill (#ffffff); text("West", 950, 140 );}
  //employ
  else if (( mouseX > hf        && mouseX < hf+bl          ) && ( mouseY > vfbh+vsbh+vs && mouseY < vfbh+vsbh*2))    {desenhadescricao(); textSize(14); fill (#ffffff); text("All", 950, 140 ); }
  else if (( mouseX > hf+blbs   && mouseX < hf+bl*2 + bs   ) && ( mouseY > vfbh+vsbh+vs && mouseY < vfbh+vsbh*2))    {desenhadescricao(); textSize(14); fill (#ffffff); text("Employed full-time", 950, 140 ); }
  else if (( mouseX > hf+blbs*2 && mouseX < hf+bl*3 + bs*2 ) && ( mouseY > vfbh+vsbh+vs && mouseY < vfbh+vsbh*2))    {desenhadescricao(); textSize(14); fill (#ffffff); text("Employed part-time", 950, 140 ); }
  else if (( mouseX > hf+blbs*3 && mouseX < hf+bl*4 + bs*3 ) && ( mouseY > vfbh+vsbh+vs && mouseY < vfbh+vsbh*2))    {desenhadescricao(); textSize(14); fill (#ffffff); text("Not employed", 950, 140 ); }
  //parents
  else if (( mouseX > hf        && mouseX < hf+bl          ) && ( mouseY > vfbh+vsbh*2+vs && mouseY < vfbh+vsbh*3))    {desenhadescricao(); textSize(14); fill (#ffffff); text("All", 950, 140 ); }
  else if (( mouseX > hf+blbs   && mouseX < hf+bl*2 + bs   ) && ( mouseY > vfbh+vsbh*2+vs && mouseY < vfbh+vsbh*3))    {desenhadescricao(); textSize(14); fill (#ffffff); text("Yes", 950, 140 ); }
  else if (( mouseX > hf+blbs*2 && mouseX < hf+bl*3 + bs*2 ) && ( mouseY > vfbh+vsbh*2+vs && mouseY < vfbh+vsbh*3))    {desenhadescricao(); textSize(14); fill (#ffffff); text("No", 950, 140 ); }
  //race
  else if (( mouseX > hf        && mouseX < hf+bl          ) && ( mouseY > vfbh+vsbh*3+vs && mouseY < vfbh+vsbh*4))    {desenhadescricao(); textSize(14); fill (#ffffff); text("All", 950, 140 );}
  else if (( mouseX > hf+blbs   && mouseX < hf+bl*2 + bs   ) && ( mouseY > vfbh+vsbh*3+vs && mouseY < vfbh+vsbh*4))    {desenhadescricao(); textSize(14); fill (#ffffff); text("White", 950, 140 );}
  else if (( mouseX > hf+blbs*2 && mouseX < hf+bl*3 + bs*2 ) && ( mouseY > vfbh+vsbh*3+vs && mouseY < vfbh+vsbh*4))    {desenhadescricao(); textSize(14); fill (#ffffff); text("Black", 950, 140 );}
  else if (( mouseX > hf+blbs*3 && mouseX < hf+bl*4 + bs*3 ) && ( mouseY > vfbh+vsbh*3+vs && mouseY < vfbh+vsbh*4))    {desenhadescricao(); textSize(14); fill (#ffffff); text("Asian", 950, 140 ); }
  else if (( mouseX > hf+blbs*4 && mouseX < hf+bl*5 + bs*4 ) && ( mouseY > vfbh+vsbh*3+vs && mouseY < vfbh+vsbh*4))    {desenhadescricao(); textSize(14); fill (#ffffff); text("Mixed", 950, 140 ); }
  else if (( mouseX > hf+blbs*5 && mouseX < hf+bl*6 + bs*5 ) && ( mouseY > vfbh+vsbh*3+vs && mouseY < vfbh+vsbh*4))    {desenhadescricao(); textSize(14); fill (#ffffff); text("Indian", 950, 140 ); }
  else if (( mouseX > hf+blbs*6 && mouseX < hf+bl*7 + bs*6 ) && ( mouseY > vfbh+vsbh*3+vs && mouseY < vfbh+vsbh*4))    {desenhadescricao(); textSize(14); fill (#ffffff); text("Other", 950, 140 ); }
  //hispanic
  else if (( mouseX > hf        && mouseX < hf+bl          ) && ( mouseY > vfbh+vsbh*4+vs && mouseY < vfbh+vsbh*5))    {desenhadescricao(); textSize(14); fill (#ffffff); text("All", 950, 140 ); }
  else if (( mouseX > hf+blbs   && mouseX < hf+bl*2 + bs   ) && ( mouseY > vfbh+vsbh*4+vs && mouseY < vfbh+vsbh*5))    {desenhadescricao(); textSize(14); fill (#ffffff); text("Yes", 950, 140 ); }
  else if (( mouseX > hf+blbs*2 && mouseX < hf+bl*3 + bs*2 ) && ( mouseY > vfbh+vsbh*4+vs && mouseY < vfbh+vsbh*5))    {desenhadescricao(); textSize(14); fill (#ffffff); text("No", 950, 140 ); }
  else {desenhadescricao();} 
}

void resetvar (){
  x = 170;
  y = 50;
  
  n = n1 = n2 = n3 = n4 = n5a = n5b = n5c = n5d = n5e = n5f = n6 = n8a = n8b = n8c = n8d = n9 = n10 = n11 = n12 = nql1 = nsm1 = neminuse = nintmob = 0;
  total = 0;
  p11 = p12 = p18 = p19 = p11x = p12x = p18x = p19x = p21 = p22 = p28 = p29 = p21x = p22x = p28x = p29x = 0;
  p31 = p32 = p38 = p39 = p31x = p32x = p38x = p39x = p41 = p42 = p48 = p49 = p41x = p41x = p48x = p49x = p44 = p43 = 0;
  eminuse1 =  eminuse2 =  eminuse8 =  eminuse9 = eminuse1c =  eminuse2c =  eminuse8c =  eminuse9c = 0;
  intmob1 =  intmob2 =  intmob8 =  intmob9 = intmob1c =  intmob2c =  intmob8c =  intmob9c = 0;
  p5a1 = p5a2 = p5a3 = p5a4 = p5a5 = p5a6 = p5a7 = p5a8 = p5a9 = p5a1x = p5a2x = p5a3x = p5a4x = p5a5x = p5a6x = p5a7x = p5a8x = p5a9x = 0;
  p5b1 = p5b2 = p5b3 = p5b4 = p5b5 = p5b6 = p5b7 = p5b8 = p5b9 = p5b1x = p5b2x = p5b3x = p5b4x = p5b5x = p5b6x = p5b7x = p5b8x = p5b9x = 0;
  p5c1 = p5c2 = p5c3 = p5c4 = p5c5 = p5c6 = p5c7 = p5c8 = p5c9 = p5c1x = p5c2x = p5c3x = p5c4x = p5c5x = p5c6x = p5c7x = p5c8x = p5c9x = 0;
  p5d1 = p5d2 = p5d3 = p5d4 = p5d5 = p5d6 = p5d7 = p5d8 = p5d9 = p5d1x = p5d2x = p5d3x = p5d4x = p5d5x = p5d6x = p5d7x = p5d8x = p5d9x = 0;
  p5e1 = p5e2 = p5e3 = p5e4 = p5e5 = p5e6 = p5e7 = p5e8 = p5e9 = p5e1x = p5e2x = p5e3x = p5e4x = p5e5x = p5e6x = p5e7x = p5e8x = p5e9x = 0;
  p5f1 = p5f2 = p5f3 = p5f4 = p5f5 = p5f6 = p5f7 = p5f8 = p5f9 = p5f1x = p5f2x = p5f3x = p5f4x = p5f5x = p5f6x = p5f7x = p5f8x = p5f9x = 0;
  p61 = p62 = p63 = p64 = p68 = p69 = p61x = p62x = p63x = p64x = p68x = p69x = 0;
  p8a1 = p8a2 = p8a8 = p8a9 = p8a1x = p8a2x = p8a8x = p8a9x = p8b1 = p8b2 = p8b8 = p8b9 = p8b1x = p8b2x = p8b8x = p8b9x = 0;
  p8c1 = p8c2 = p8c8 = p8c9 = p8c1x = p8c2x = p8c8x = p8c9x = p8d1 = p8d2 = p8d8 = p8d9 = p8d1x = p8d2x = p8d8x = p8d9x = 0;
  p91 = p92 = p93 = p94 = p95 = p98 = p99 = p91x = p92x = p93x = p94x = p95x = p98x = p99x = 0;
  p101 = p102 = p103 = p104 = p108 = p109 = p101x = p102x = p103x = p104x = p108x = p109x = 0;
  p111 = p112 = p113 = p114 = p118 = p119 = p111x = p112x = p113x = p114x = p118x = p119x = 0;
  p121 = p122 = p123 = p124 = p128 = p129 = p121x = p122x = p123x = p124x = p128x = p129x = 0;
  ql1 = ql2 = ql8 = ql9 = ql1x = ql2x = ql8x = ql9x = sm1 = sm2 = sm8 = sm9 = sm1x = sm2x = sm8x = sm9x = 0;
}

//Global Variables

String p1t = "Do you use a computer at your workplace, at school, at home, or anywhere else on at least an occasional basis?";
String p2t = "Did you happen to use the internet or email YESTERDAY on a computer or mobile device?";
String p3t = "When you went online yesterday, did you go online from home?";
String p4t = "Did you go online from work yesterday?";
String p5t = "How hard would it be for you to give up your...";
String p5at = "How hard would it be for you to give up your landline telephone";
String p5bt = "How hard would it be for you to give up your television";
String p5ct = "How hard would it be for you to give up your cell phone or smartphone";
String p5dt = "How hard would it be for you to give up The internet";
String p5et = "How hard would it be for you to give up E-mail";
String p5ft = "How hard would it be for you to give up Social media such as Facebook or Twitter";
String p6t = "Which ONE of these statements comes closest to the reason that you would find it hard to give up the internet?";
 String p6at = "It would be hard to give up the internet because being online is ESSENTIAL to me because I NEED it for my job or for another reason";
 String p6bt = "It would be hard to give up the internet because I really enjoy being online?";
 String p6ct = "Both equally";
 String p6dt = "Neither";
String p7t = "Thinking back...What YEAR did you first start using the internet?";
String p8t = "Have you ever experienced any of the following things online? Have you ever...";
 String p8at = "Seen an online group come together to help a person or a community solve a problem";
 String p8bt = "Left an online group because the interaction became too heated or members were unpleasant to one another";
 String p8ct = "Been treated unkindly or been attacked by someone online";
 String p8dt = "Been treated kindly or generously by others online";
String p9t = "Thinking about your relationships in general... OVERALL, would you say that it strenghens or weakens your relations?";
String p10t = "Based on all of your online experiences, would you say that people you have witnessed or encountered on the internet are";
String p11t = "Overall, when you add up all the advantages and disadvantages of the internet, would you say the internet has mostly been";
String p12t = "How about you, personally? Overall, when you add up all the advantages and disadvantages of the internet, would you say the internet has mostly been";
String eminuset = "Do you use the internet or email, at least occasionally?";
String intmobt = "Do you access the internet on a cell phone, tablet or other handheld device, at least occasionally?";
String smart1t = "Is your cell phone a smartphone?";
String ql1t = "Next... Do you have a cell phone, or not?";

Table table;
int x, y;
int n;
int n1, n2, n3, n4, n5a, n5b, n5c, n5d, n5e, n5f, n6, n8a, n8b, n8c, n8d, n9, n10, n11, n12, nql1, nsm1, neminuse, nintmob;
int talt;

int psex = 0; //1 Male 2 Female
int pcregion = 0; //1 North-East 2 Mid-West 3 South 4 West
int pemploy = 0; //1  Employed full-time 2  Employed part-time 3  Not employed 9  (DO NOT READ) Don’t Know / Refused
int ppar = 0; //1  Yes 2  No 9  Don’t know / Refused
int peduc2 = 0; //1  Less than high school (Grades 1-8 or no formal schooling) 2  High school incomplete (Grades 9-11 or Grade 12 with NO diploma) 3  High school graduate (Grade 12 with diploma or GED certificate) 4  Some college, no degree (includes community college) 5  Two year associate degree from a college or university 6  Four year college or university degree/Bachelor’s degree (e.g., BS, BA, AB) 7  Some postgraduate or professional schooling, no postgraduate degree 8  Postgraduate or professional degree, including master’s, doctorate, medical or law degree (e.g., MA, MS, PhD, MD, JD) 9  Don’t know / Refused
int phisp = 0; //1  Yes 2  No 9  Don’t know / Refused
int prace = 0; //1  White 2  Black or African-American 3  Asian or Pacific Islander 4  Mixed race  5  Native American/American Indian 6  Other (SPECIFY) 9 Don’t know / Refused
int pinc = 0; //1  Less than $10,000 2  $10,000 to under $20,000 3  $20,000 to under $30,000 4  $30,000 to under $40,000 5  $40,000 to under $50,000 6  $50,000 to under $75,000 7  $75,000 to under $100,000 8  $100,000 to under $150,000 (OR) 9  $150,000 or more 99 Don’t know / Refused
int sex, cregion, employ, par, educ2, hisp, race, inc;

int total = 0;
int altura = 0;
int auxdesenha = 0;
int selectquestion = 0;

int askall = 1006;
int askint = 857;
int askcell = 928;
int askland = 717;
int askhard = 633;

int cima = 130;
int baixo = 370;

int hf2 = 50;
int vf2 = 595;
int vf3 = 645;
int hf = 900; //x value of the first button
int vf = 200; //y value of the first button
int bl = 30; //button lenght
int bh = 30; //button height
int bs = 20; //horizontal button spacing
int vs = 20; //vetical button spacing
int blbs = bl+bs;
int hfbl = hf+bl;
int vfbh = vf+bh;
int vsbh = vs+bh;

color [] palette = {#B2912F, #5DA5DA, #FAA43A, #B276B2, #F17CB0, #5d0c00,  #B2912F ,  #feb24c,    #ffeda0,   #b7e86c,   #4D4D4D,  #f03b20,  #FFE702, #B7E86C, #61FF34, #7CE8C9, #26F1FF, #73C8E8, #26A4FF, #0C4FE8, #5963FF, #9A89E8, #743FFF, #E8B5E8, #CE33FF, #E858C4, #FF3D75, #E85B48, #FF986F, #CE7E68, #FF8707, #E8BD6E, #FFC515};
                   //0dkre   1yes      2no     3both    4neither 5veryhard  0dknore 7nottoohard 8bitgard 9impossible 10donothave #11(6)hard

int p11, p12, p18, p19, p11x, p12x, p18x, p19x, p21, p22, p28, p29, p21x, p22x, p28x, p29x;
int p31, p32, p38, p39, p31x, p32x, p38x, p39x, p41, p42, p43, p44, p48, p49, p41x, p42x, p43x, p44x, p48x, p49x;
int eminuse1, eminuse2, eminuse8, eminuse9, eminuse1c, eminuse2c, eminuse8c, eminuse9c;
int intmob1, intmob2, intmob8, intmob9, intmob1c, intmob2c, intmob8c, intmob9c;
int p5a1, p5a2, p5a3, p5a4, p5a5, p5a6, p5a7, p5a8, p5a9;
int p5a1x, p5a2x, p5a3x, p5a4x, p5a5x, p5a6x, p5a7x, p5a8x, p5a9x;
int p5b1, p5b2, p5b3, p5b4, p5b5, p5b6, p5b7, p5b8, p5b9;
int p5b1x, p5b2x, p5b3x, p5b4x, p5b5x, p5b6x, p5b7x, p5b8x, p5b9x;
int p5c1, p5c2, p5c3, p5c4, p5c5, p5c6, p5c7, p5c8, p5c9;
int p5c1x, p5c2x, p5c3x, p5c4x, p5c5x, p5c6x, p5c7x, p5c8x, p5c9x;
int p5d1, p5d2, p5d3, p5d4, p5d5, p5d6, p5d7, p5d8, p5d9;
int p5d1x, p5d2x, p5d3x, p5d4x, p5d5x, p5d6x, p5d7x, p5d8x, p5d9x;
int p5e1, p5e2, p5e3, p5e4, p5e5, p5e6, p5e7, p5e8, p5e9;
int p5e1x, p5e2x, p5e3x, p5e4x, p5e5x, p5e6x, p5e7x, p5e8x, p5e9x;
int p5f1, p5f2, p5f3, p5f4, p5f5, p5f6, p5f7, p5f8, p5f9;
int p5f1x, p5f2x, p5f3x, p5f4x, p5f5x, p5f6x, p5f7x, p5f8x, p5f9x;
int p61, p62, p63, p64, p68, p69, p61x, p62x, p63x, p64x, p68x, p69x;
int p8a1, p8a2, p8a8, p8a9, p8a1x, p8a2x, p8a8x, p8a9x, p8b1, p8b2, p8b8, p8b9, p8b1x, p8b2x, p8b8x, p8b9x;
int p8c1, p8c2, p8c8, p8c9, p8c1x, p8c2x, p8c8x, p8c9x, p8d1, p8d2, p8d8, p8d9, p8d1x, p8d2x, p8d8x, p8d9x;
int p91, p92, p93, p94, p95, p98, p99, p91x, p92x, p93x, p94x, p95x, p98x, p99x;
int p101, p102, p103, p104, p108, p109, p101x, p102x, p103x, p104x, p108x, p109x;
int p111, p112, p113, p114, p118, p119, p111x, p112x, p113x, p114x, p118x, p119x;
int p121, p122, p123, p124, p128, p129, p121x, p122x, p123x, p124x, p128x, p129x;
int ql1, ql2, ql8, ql9, ql1x, ql2x, ql8x, ql9x;
int sm1, sm2, sm8, sm9, sm1x, sm2x, sm8x, sm9x;
  

void desenhapial1(){
  fill (#cccccc);
  rect (x,y+altura,503,20);
  p11x = p11/2;
  p12x = p12/2;
  fill (palette[0]);
  rect (x,y+altura,n/2,20);//all
  fill (palette[1]);
  rect (x, y+altura, p11x, 20);
  fill (palette[2]);
  rect (p11x+x, y+altura, p12x, 20);

  p18x = p18/2;
  p19x = p19/2;
  fill (palette[6]);
  rect (p11x+p12x+x, y+altura, 0, 20);
  
  fill (#51acd3);
  rect (30,74+talt,808,20);
  fill (#FFFFFF);
  textSize (14);
  text (p1t,30,90+talt);
  desenhalegenda1();
}

void desenhapial2(){
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p21x = p21/2;
    p22x = p22/2;    
    fill (palette[0]);
    rect (x,y+altura,n2/2,20);//internet
    fill (palette[1]);
    rect (x, y+altura, p21x, 20);
    fill (palette[2]);
    rect (p21x+x, y+altura, p22x, 20);
    
    p28x = p28/2;
    p29x = p29/2;
    fill (palette[6]);
    rect (p21x+p22x+x, y+altura, p28x+p29x, 20);
    fill (#51acd3);
    rect (30,74+talt,808,20);
    fill (#FFFFFF);
    textSize (16);
    text (p2t,30,90+talt);
    desenhalegenda1();
}


void desenhapial3(){
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p31x = p31/2;
    p32x = p32/2;
    fill (palette[0]);
    rect (x,y+altura,n3/2,20);
    fill (palette[1]);
    rect (x, y+altura, p31x, 20);
    fill (palette[2]);
    rect (p31x+x, y+altura, p32x, 20);

    p38x = p38/2;
    p39x = p39/2;
    fill (palette[6]);
    rect (p31x+p32x+x, y+altura, p38x+p39x, 20);
    fill (#51acd3);
    rect (30,74+talt,808,20);
    fill (#FFFFFF);
    text (p3t,30,90+talt);
    desenhalegenda1();
}

void desenhapial4(){
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p41x = p41/2;
    p42x = p42/2;
    fill (palette[0]);
    rect (x,y+altura,n4/2,20);
    fill (palette[1]);
    rect (x, y+altura, p41x, 20);
    fill (palette[2]);
    rect (p41x+x, y+altura, p42x, 20);
    
    p43x = p43/2;
    p44x = p44/2;
    fill (palette[3]);
    rect (p41x+p42x+x, y+altura, p43x, 20);
    fill (palette[4]);
    rect (p41x+p42x+p43x+x, y+altura, p44x, 20);

    p48x = p48/2;
    p49x = p49/2;
    fill (palette[6]);
    rect (p41x+p42x+p43x+p44x+x, y+altura, p48x+p49x, 20);
    fill (#51acd3);
    rect (30,74+talt,808,20);
    fill (#FFFFFF);
    text (p4t,30,90+talt);
    
    textSize (13);
    text ("Don't Know", 730, y + altura - 45);
    text ("Yes", 730, y + altura - 15);
    text ("No", 730, y + altura + 15);
    text ("Didn't work", 730, y+altura+45);
    text ("Unemployed", 730, y+altura+75);
  
    fill (palette[0]);
    rect(700, y + altura - 60, 20, 20);
    fill (palette[1]);
    rect(700, y + altura - 30, 20, 20);
    fill (palette[2]);
    rect(700, y + altura, 20, 20);
    fill (palette[3]);
    rect(700, y + altura + 30, 20, 20);
    fill (palette[4]);
    rect(700, y + altura + 60, 20, 20);
}

void desenhaeminuse(){
    fill (#cccccc);
    rect (x,y+altura,503,20);
    eminuse1c = eminuse1/2;
    eminuse2c = eminuse2/2;
    fill (palette[0]);
    rect (x,y+altura,neminuse/2,20);//all
    fill (palette[1]);
    rect (x, y+altura, eminuse1c, 20);
    fill (palette[2]);
    rect (eminuse1c+x, y+altura, eminuse2c, 20);

    eminuse8c = eminuse8/2;
    eminuse9c = eminuse9/2;
    fill (palette[6]);
    rect (eminuse1c+eminuse2c+x, y+altura, eminuse8c+eminuse9c, 20);
    fill (#51acd3);
    rect (30,74+talt,808,20);
    fill (#FFFFFF);
    textSize (16);
    text (eminuset,30,90+talt);
    desenhalegenda1();
}

void desenhaintmob(){
    fill (#cccccc);
    rect (x,y+altura,503,20);
    intmob1c = intmob1/2;
    intmob2c = intmob2/2;
    fill (palette[0]);
    rect (x,y+altura,nintmob/2,20);//all
    fill (palette[1]);
    rect (x, y+altura, intmob1c, 20);
    fill (palette[2]);
    rect (intmob1c+x, y+altura, intmob2c, 20);

    intmob8c = intmob8/2;
    intmob9c = intmob9/2;
    fill (palette[6]);
    rect (intmob1c+intmob2c+x, y+altura, intmob8c+intmob9c, 20);
    fill (#51acd3);
    rect (30,74+talt,808,20);
    fill (#FFFFFF);
    textSize (16);
    text (intmobt,30,90+talt);
    desenhalegenda1();
}

void desenhapial5a(){
    altura = altura - 60;  
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p5a1x = p5a1/2;
    p5a2x = p5a2/2;
    p5a3x = p5a3/2;
    p5a4x = p5a4/2;
    p5a5x = p5a5/2;
    fill (palette[0]);
    rect (x,y+altura,n5a/2,20);//landlinecell
    fill (palette[5]);
    rect (x, y+altura, p5a1x, 20);
    fill (palette[11]);
    rect (p5a1x+x, y+altura, p5a2x, 20);
    fill (palette[7]);
    rect (p5a1x+p5a2x+x, y+altura, p5a3x, 20);
    fill (palette[8]);
    rect (p5a1x+p5a2x+p5a3x+x, y+altura, p5a4x, 20);
    fill (palette[9]);
    rect (p5a1x+p5a2x+p5a3x+p5a4x+x, y+altura, p5a5x, 20);
    fill (palette[10]);
    rect (p5a1x+p5a2x+p5a3x+p5a4x+p5a5x+x, y+altura, p5a6x, 20);
    p5a8x = p5a8/2;
    p5a9x=  p5a9/2;
    fill (palette[0]);
    rect (p5a1x+p5a2x+p5a3x+p5a4x+p5a5x+p5a6x+x, y+altura, p5a8x+p5a9x ,20);
    altura = altura + 60;
}

void desenhapial5b(){
    altura = altura - 30;
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p5b1x = p5b1/2;
    p5b2x = p5b2/2;
    p5b3x = p5b3/2;
    p5b4x = p5b4/2;
    p5b5x = p5b5/2;
    fill (palette[0]);
    rect (x,y+altura,n5b/2,20);
    fill (palette[5]);
    rect (x, y+altura, p5b1x, 20);
    fill (palette[11]);
    rect (p5b1x+x, y+altura, p5b2x, 20);
    fill (palette[7]);
    rect (p5b1x+p5b2x+x, y+altura, p5b3x, 20);
    fill (palette[8]);
    rect (p5b1x+p5b2x+p5b3x+x, y+altura, p5b4x, 20);
    fill (palette[9]);
    rect (p5b1x+p5b2x+p5b3x+p5b4x+x, y+altura, p5b5x, 20);
    fill (palette[10]);
    rect (p5b1x+p5b2x+p5b3x+p5b4x+p5b5x+x, y+altura, p5b6x, 20);
    p5b8x = p5b8/2;
    p5b9x=  p5b9/2;
    fill (palette[0]);
    rect (p5b1x+p5b2x+p5b3x+p5b4x+p5b5x+p5b6x+x, y+altura, p5b8x+p5b9x ,20);
    altura = altura +30;
}

void desenhapial5c(){
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p5c1x = p5c1/2;
    p5c2x = p5c2/2;
    p5c3x = p5c3/2;
    p5c4x = p5c4/2;
    p5c5x = p5c5/2;
    fill (#cccccc);
    rect (x,y+altura,503,20);
    fill (palette[0]);
    rect (x,y+altura,n5c/2,20);//cell
    fill (palette[5]);
    rect (x, y+altura, p5c1x, 20);
    fill (palette[11]);
    rect (p5c1x+x, y+altura, p5c2x, 20);
    fill (palette[7]);
    rect (p5c1x+p5c2x+x, y+altura, p5c3x, 20);
    fill (palette[8]);
    rect (p5c1x+p5c2x+p5c3x+x, y+altura, p5c4x, 20);
    fill (palette[9]);
    rect (p5c1x+p5c2x+p5c3x+p5c4x+x, y+altura, p5c5x, 20);
    fill (palette[10]);
    rect (p5c1x+p5c2x+p5c3x+p5c4x+p5c5x+x, y+altura, p5c6x, 20);
    p5c8x = p5c8/2;
    p5c9x=  p5c9/2;
    fill (palette[0]);
    rect (p5c1x+p5c2x+p5c3x+p5c4x+p5c5x+p5c6x+x, y+altura, p5c8x+p5c9x ,20);
}

void desenhapial5d(){
    altura = altura + 30;
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p5d1x = p5d1/2;
    p5d2x = p5d2/2;
    p5d3x = p5d3/2;
    p5d4x = p5d4/2;
    p5d5x = p5d5/2;
    fill (palette[0]);
    rect (x,y+altura,n5d/2,20);
    fill (palette[5]);
    rect (x, y+altura, p5d1x, 20);
    fill (palette[11]);
    rect (p5d1x+x, y+altura, p5d2x, 20);
    fill (palette[7]);
    rect (p5d1x+p5d2x+x, y+altura, p5d3x, 20);
    fill (palette[8]);
    rect (p5d1x+p5d2x+p5d3x+x, y+altura, p5d4x, 20);
    fill (palette[9]);
    rect (p5d1x+p5d2x+p5d3x+p5d4x+x, y+altura, p5d5x, 20);
    fill (palette[10]);
    rect (p5d1x+p5d2x+p5d3x+p5d4x+p5d5x+x, y+altura, p5d6x, 20); 
    p5d8x = p5d8/2;
    p5d9x=  p5d9/2;
    fill (palette[0]);
    rect (p5d1x+p5d2x+p5d3x+p5d4x+p5d5x+p5d6x+x, y+altura, p5d8x+p5d9x ,20);
    altura = altura - 30;
}

void desenhapial5e(){
    altura = altura +60;
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p5e1x = p5e1/2;
    p5e2x = p5e2/2;
    p5e3x = p5e3/2;
    p5e4x = p5e4/2;
    p5e5x = p5e5/2;
    fill (palette[0]);
    rect (x,y+altura,n5e/2,20);
    fill (palette[5]);
    rect (x, y+altura, p5e1x, 20);
    fill (palette[11]);
    rect (p5e1x+x, y+altura, p5e2x, 20);
    fill (palette[7]);
    rect (p5e1x+p5e2x+x, y+altura, p5e3x, 20);
    fill (palette[8]);
    rect (p5e1x+p5e2x+p5e3x+x, y+altura, p5e4x, 20);
    fill (palette[9]);
    rect (p5e1x+p5e2x+p5e3x+p5e4x+x, y+altura, p5e5x, 20);
    fill (palette[10]);
    rect (p5e1x+p5e2x+p5e3x+p5e4x+p5e5x+x, y+altura, p5e6x, 20);
    p5e8x = p5e8/2;
    p5e9x=  p5e9/2;
    fill (palette[0]);
    rect (p5e1x+p5e2x+p5e3x+p5e4x+p5e5x+p5e6x+x, y+altura, p5e8x+p5e9x ,20);
    altura = altura - 60;
}

void desenhapial5f(){
    altura = altura +90;
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p5f1x = p5f1/2;
    p5f2x = p5f2/2;
    p5f3x = p5f3/2;
    p5f4x = p5f4/2;
    p5f5x = p5f5/2;
    fill (palette[0]);
    rect (x,y+altura,n5f/2,20);
    fill (palette[5]);
    rect (x, y+altura, p5f1x, 20);
    fill (palette[11]);
    rect (p5f1x+x, y+altura, p5f2x, 20);
    fill (palette[7]);
    rect (p5f1x+p5f2x+x, y+altura, p5f3x, 20);
    fill (palette[8]);
    rect (p5f1x+p5f2x+p5f3x+x, y+altura, p5f4x, 20);
    fill (palette[9]);
    rect (p5f1x+p5f2x+p5f3x+p5f4x+x, y+altura, p5f5x, 20);
    fill (palette[10]);
    rect (p5f1x+p5f2x+p5f3x+p5f4x+p5f5x+x, y+altura, p5f6x, 20);
    p5f8x = p5f8/2;
    p5f9x=  p5f9/2;
    fill (palette[0]);
    rect (p5f1x+p5f2x+p5f3x+p5f4x+p5f5x+p5f6x+x, y+altura, p5f8x+p5f9x ,20);
    altura = altura - 90;
}


void desenhapial6(){
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p61x = p61/2;
    p62x = p62/2;
    p63x = p63/2;
    p64x = p64/2;
    fill (palette[0]);
    rect (x,y+altura,n6/2,20);//hard
    fill (palette[1]);
    rect (x, y+altura, p61x, 20);
    fill (palette[2]);
    rect (p61x+x, y+altura, p62x, 20);
    fill (palette[3]);
    rect (p61x+p62x+x, y+altura, p63x, 20);
    fill (palette[4]);
    rect (p61x+p62x+p63x+x, y+altura, p64x, 20);
    p68x = p68/2;
    p69x=  p69/2;
    fill (palette[6]);
    rect (p61x+p62x+p63x+p64x+x, y+altura, p68x+p69x ,20);
    fill (#51acd3);
    rect (30,74+talt,808,20);
    fill (#FFFFFF);
    textSize (13);
    text (p6t,30,90+talt);
    
  text ("Don't know", 730, y + altura - 45);
  text ("Needs at job", 730, y + altura - 15);
  text ("Enjoys", 730, y + altura + 15);
  text ("Both", 730, y+altura+45);
  text ("Neither", 730, y+altura+75);
  
  fill (palette[0]);
  rect(700, y + altura - 60, 20, 20);
  fill (palette[1]);
  rect(700, y + altura - 30, 20, 20);
  fill (palette[2]);
  rect(700, y + altura, 20, 20);
  fill (palette[3]);
  rect(700, y + altura + 30, 20, 20);
  fill (palette[4]);
  rect(700, y + altura + 60, 20, 20);
}

void desenhapial8a(){
    altura = altura - 70;
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p8a1x = p8a1/2;
    p8a2x = p8a2/2;
    fill (palette[0]);
    rect (x,y+altura,n8a/2,20);
    fill (palette[1]);
    rect (x, y+altura, p8a1x, 20);
    fill (palette[2]);
    rect (p8a1x+x, y+altura, p8a2x, 20);
    p8a8x = p8a8/2;
    p8a9x=  p8a9/2;
    fill (palette[7]);
    rect (p8a1x+p8a2x+x, y+altura, p8a8x+p8a9x ,20);
    altura = altura + 70;
}

void desenhapial8b(){
    altura = altura - 20;
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p8b1x = p8b1/2;
    p8b2x = p8b2/2;
    fill (palette[0]);
    rect (x,y+altura,n8b/2,20);
    fill (palette[1]);
    rect (x, y+altura, p8b1x, 20);
    fill (palette[2]);
    rect (p8b1x+x, y+altura, p8b2x, 20);
    p8b8x = p8b8/2;
    p8b9x=  p8b9/2;
    fill (palette[6]);
    rect (p8b1x+p8b2x+x, y+altura, p8b8x+p8b9x ,20);
    altura = altura+20;
}

void desenhapial8c(){
    altura = altura +30;
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p8c1x = p8c1/2;
    p8c2x = p8c2/2;
    fill (palette[0]);
    rect (x,y+altura,n8c/2,20);
    fill (palette[1]);
    rect (x, y+altura, p8c1x, 20);
    fill (palette[2]);
    rect (p8c1x+x, y+altura, p8c2x, 20);
    p8c8x = p8c8/2;
    p8c9x=  p8c9/2;
    fill (palette[7]);
    rect (p8c1x+p8c2x+x, y+altura, p8c8x+p8c9x ,20);
    altura = altura -30;
}

void desenhapial8d(){
    altura = altura + 80;
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p8d1x = p8d1/2;
    p8d2x = p8d2/2;
    fill (palette[0]);
    rect (x,y+altura,n8d/2,20);
    fill (palette[1]);
    rect (x, y+altura, p8d1x, 20);
    fill (palette[2]);
    rect (p8d1x+x, y+altura, p8d2x, 20);
    p8d8x = p8d8/2;
    p8d9x=  p8d9/2;
    fill (palette[6]);
    rect (p8d1x+p8d2x+x, y+altura, p8d8x+p8d9x ,20);
    altura = altura - 80;
}

void desenhapial9(){
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p91x = p91/2;
    p92x = p92/2;
    p93x = p93/2;
    p94x = p94/2;
    p95x = p95/2;
    fill (palette[0]);
    rect (x,y+altura,n9/2,20);
    fill (palette[1]);
    rect (x, y+altura, p91x, 20);
    fill (palette[2]);
    rect (p91x+x, y+altura, p92x, 20);
    fill (palette[3]);
    rect (p91x+p92x+x, y+altura, p93x, 20);
    fill (palette[4]);
    rect (p91x+p92x+p93x+x, y+altura, p94x, 20);
    fill (palette[5]);
    rect (p91x+p92x+p93x+p94x+x, y+altura, p95x, 20);

    p98x = p98/2;
    p99x=  p99/2;
    fill (palette[6]);
    rect (p91x+p92x+p93x+p94x+p95x+x, y+altura, p98x+p99x ,20);
    
    fill (#51acd3);
    rect (30,74+talt,808,20);
    fill (#FFFFFF);
    textSize (13);
    text (p9t,30,90+talt);
    
    text ("Don't know", 730, y + altura - 45);
    text ("Strenghtens", 730, y + altura - 15);
    text ("Weakens", 730, y + altura + 15);
    text ("Both", 730, y+altura+45);
    text ("Neither", 730, y+altura+75);
    text ("N/A", 730, y+altura+105); 
  
  fill (palette[0]);
  rect(700, y + altura - 60, 20, 20);
  fill (palette[1]);
  rect(700, y + altura - 30, 20, 20);
  fill (palette[2]);
  rect(700, y + altura, 20, 20);
  fill (palette[3]);
  rect(700, y + altura + 30, 20, 20);
  fill (palette[4]);
  rect(700, y + altura + 60, 20, 20);
  fill (palette[5]);
  rect(700, y + altura + 90, 20, 20);
    
    
}

void desenhapial10(){
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p101x = p101/2;
    p102x = p102/2;
    p103x = p103/2;
    p104x = p104/2;
    fill (palette[0]);
    rect (x,y+altura,n10/2,20);
    fill (palette[1]);
    rect (x, y+altura, p101x, 20);
    fill (palette[2]);
    rect (p101x+x, y+altura, p102x, 20);
    fill (palette[3]);
    rect (p101x+p102x+x, y+altura, p103x, 20);
    fill (palette[4]);
    rect (p101x+p102x+p103x+x, y+altura, p104x, 20);
    p108x = p108/2;
    p109x=  p109/2;
    fill (palette[6]);
    rect (p101x+p102x+p103x+p104x+x, y+altura, p108x+p109x ,20);
    fill (#51acd3);
    rect (30,74+talt,808,20);
    fill (#FFFFFF);
    textSize (13);
    text (p10t,30,90+talt);

    text ("Don't Know", 730, y + altura - 45);
    text ("Mostly kind", 730, y + altura - 15);
    text ("Mostly unkind", 730, y + altura + 15);
    text ("Both", 730, y+altura+45);
    text ("Neither", 730, y+altura+75);
  
  fill (palette[0]);
  rect(700, y + altura - 60, 20, 20);
  fill (palette[1]);
  rect(700, y + altura - 30, 20, 20);
  fill (palette[2]);
  rect(700, y + altura, 20, 20);
  fill (palette[3]);
  rect(700, y + altura + 30, 20, 20);
  fill (palette[4]);
  rect(700, y + altura + 60, 20, 20);

}

void desenhapial11(){
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p111x = p111/2;
    p112x = p112/2;
    p113x = p113/2;
    fill (palette[0]);
    rect (x,y+altura,n11/2,20);
    fill (palette[1]);
    rect (x, y+altura, p111x, 20);
    fill (palette[2]);
    rect (p111x+x, y+altura, p112x, 20);
    fill (palette[3]);
    rect (p111x+p112x+x, y+altura, p113x, 20);
    p118x = p118/2;
    p119x=  p119/2;
    fill (palette[6]);
    rect (p111x+p112x+p113x+x, y+altura, p118x+p119x ,20);
    fill (#51acd3);
    rect (30,74+talt,808,20);
    fill (#FFFFFF);
    textSize (11);
    text (p11t,30,90+talt);
    
    text ("Don't Know", 730, y + altura - 45);
    text ("Good thing", 730, y + altura - 15);
    text ("Bad thing", 730, y + altura + 15);
    text ("Both", 730, y+altura+45);
  
  fill (palette[0]);
  rect(700, y + altura - 60, 20, 20);
  fill (palette[1]);
  rect(700, y + altura - 30, 20, 20);
  fill (palette[2]);
  rect(700, y + altura, 20, 20);
  fill (palette[3]);
  rect(700, y + altura + 30, 20, 20);

}

void desenhapial12(){
    fill (#cccccc);
    rect (x,y+altura,503,20);
    p121x = p121/2;
    p122x = p122/2;
    p123x = p123/2;
    fill (palette[0]);
    rect (x,y+altura,n12/2,20);
    fill (palette[1]);
    rect (x, y+altura, p121x, 20);
    fill (palette[2]);
    rect (p121x+x, y+altura, p122x, 20);
    fill (palette[3]);
    rect (p121x+p122x+x, y+altura, p123x, 20);
    p128x = p128/2;
    p129x=  p129/2;
    fill (palette[6]);
    rect (p121x+p122x+p123x+x, y+altura, p128x+p129x ,20);
    fill (#51acd3);
    rect (30,74+talt,808,20);
    fill (#FFFFFF);
    textSize (11);
    text (p12t,30,90+talt);
    
        text ("Don't Know", 730, y + altura - 45);
    text ("Good thing", 730, y + altura - 15);
    text ("Bad thing", 730, y + altura + 15);
    text ("Both", 730, y+altura+45);
  
  fill (palette[0]);
  rect(700, y + altura - 60, 20, 20);
  fill (palette[1]);
  rect(700, y + altura - 30, 20, 20);
  fill (palette[2]);
  rect(700, y + altura, 20, 20);
  fill (palette[3]);
  rect(700, y + altura + 30, 20, 20);
}

void desenhapialql1(){
    fill (#cccccc);
    rect (x,y+altura,503,20);
    ql1x = ql1/2;
    ql2x = ql2/2;
    fill (palette[0]);
    rect (x,y+altura,nql1/2,20);
    fill (palette[1]);
    rect (x, y+altura, ql1x, 20);
    fill (palette[2]);
    rect (ql1x+x, y+altura, ql2x, 20);
    ql8x =ql8/2;
    ql9x= ql9/2;
    fill (palette[6]);
    rect (ql1x + ql2x + x, y+altura, ql8x+ ql9x ,20);
    fill (#51acd3);
    rect (30,74+talt,808,20);
    fill (#FFFFFF);
    textSize (16);
    text (ql1t,30,90+talt);
    desenhalegenda1();
}

void desenhasmart1(){
    fill (#cccccc);
    rect (x,y+altura,503,20);
    sm1x = sm1/2;
    sm2x = sm2/2;
    fill (palette[0]);
    rect (x,y+altura,nsm1/2,20);
    fill (palette[1]);
    rect (x, y+altura, sm1x, 20);
    fill (palette[2]);
    rect (sm1x+x, y+altura, sm2x, 20);
    sm8x = sm8/2;
    sm9x=  sm9/2;
    fill (palette[6]);
    rect (sm1x+sm2x+x, y+altura, sm8x+sm9x ,20);
    fill (#51acd3);
    rect (30,74+talt,808,20);
    fill (#FFFFFF);
    textSize (16);
    text (smart1t,30,90+talt);
    desenhalegenda1();
}

void desenhapial5(){
  fill (#51acd3);
  rect (30,74+talt,808,20);
  fill (#FFFFFF);
  textSize (16);
  text (p5t,30,90+talt);
  desenhapial5a();
  desenhapial5b();
  desenhapial5c();
  desenhapial5d();
  desenhapial5e();
  desenhapial5f();
  textSize (11);
  fill (#ffffff);
  text ("LANDLINE TELEPHONE", 45, 126 + altura - 120);
  text ("TELEVISION", 45, 126 + altura - 90);
  text ("CELLPHONE", 45, 126 + altura - 60);
  text ("THE INTERNET", 45, 126 + altura - 30);
  text ("E-MAIL", 45, 126 + altura);
  text ("SOCIAL MEDIA", 45, 126 + altura + 30);
  
  
  text ("Very hard", 730, y + altura - 45);
  text ("Somewhat hard", 730, y + altura - 15);
  text ("Not too hard", 730, y + altura + 15);
  text ("Not hard at all", 730, y+altura+45);
  text ("Impossible", 730, y+altura+75);
  text ("Don't know", 730, y+altura+105); 
  
  fill (palette[5]);
  rect(700, y + altura - 60, 20, 20);
  fill (palette[11]);
  rect(700, y + altura - 30, 20, 20);
  fill (palette[7]);
  rect(700, y + altura, 20, 20);
  fill (palette[8]);
  rect(700, y + altura + 30, 20, 20);
  fill (palette[9]);
  rect(700, y + altura + 60, 20, 20);
  fill (palette[0]);
  rect(700, y + altura + 90, 20, 20);
  
}

void desenhapial8(){
  fill (#51acd3);
  rect (30,74+talt,808,20);
  fill (#FFFFFF);
  textSize (16);
  text (p8t,30,90+talt);
  desenhapial8a();
  desenhapial8b();
  desenhapial8c();
  desenhapial8d();
  textSize (11);
  fill (#ffffff);
  text (p8at, 45, 126 + altura - 150);
  text (p8bt, 45, 126 + altura - 100);
  text (p8ct, 45, 126 + altura - 50);
  text (p8dt, 45, 126 + altura - 0);
  desenhalegenda1();
}

void clearbgcima (){
  fill (#aaaaaa);
  rect (37, 93, 785, 200);

}

void clearbgbaixo (){
  fill (#aaaaaa);
  rect (37, 338, 785, 200);
}

void desenhalegenda1(){
  fill (#FFFFFF);
  text ("Don't Know", 730, y + altura - 45);
  text ("Yes", 730, y + altura - 15);
  text ("No", 730, y + altura + 15);
  
  fill (palette[0]);
  rect(700, y + altura - 60, 20, 20);
  fill (palette[1]);
  rect(700, y + altura - 30, 20, 20);
  fill (palette[2]);
  rect(700, y + altura, 20, 20);
}

void desenhadescricao(){
  fill (#5ab3ca);
  rect (900, 108, 325, 52);
}




