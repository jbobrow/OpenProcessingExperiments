
closer new_closer = new closer();
data_read first_data_read = new data_read();
controls new_controls = new controls();
start_only new_start_only = new start_only();
view_all_names new_view_all_names = new view_all_names();

float giros = 6;
PFont v22;
PFont v48;

String names[][] = new String [102][122]; 

int eksamhno[] = new int [122];

String ects[] = new String [122]; 
int ects_int[] = new int [122]; 

float nrpx[] = new float [122];
float nrpy[] = new float [122];
float nrpz[] = new float [122];
//color
float cr[] = new float [122];
float cg[] = new float [122];
float cb[] = new float [122];
float ca[] = new float [122];
int cd = 1; //diakopths
//camera
float xcam = 00;
float ycam = 00;
float zcam = 00;
float closer = 0;

float diafora;
float centerx = width/2;
float centery = height/2;
int how_many = 130;
float r = 180;
float restart = 0;

void setup() {
smooth();
  size(1000,500);
  frameRate(30);
  
  v22 = loadFont("verdana_24.vlw");
  v48 = loadFont("verdana_48.vlw");

  first_data_read.read_from_txt();
  
  new_start_only.colors();
  centerx = width/2;
 centery = height/2;
 new_start_only.eksamhno_run();
 print_ects();
  }
  


void draw() {
  
  background(20);


  
    new_closer.closer_find();
  new_start_only.xyzparticlespositions();
  new_view_all_names.run();

  emfanhsh_grammwn();
  
  
  new_controls.turn();

print_names(); 
  fill(20);
  rect(-1,-1,width+2,30);
print_eksamhno();
  
}

void emfanhsh_grammwn(){
  for(int j = 1;j<=118;j++){
    for(int jj = 1;jj<=117;jj++){
      if(names[6][jj].equals(names[2][j]+names[3][j]) == true) {
        draw_line(j,jj);
      }
      if(names[7][jj].equals(names[2][j]+names[3][j]) == true) {
        draw_line(j,jj);
      }
    }
  }
}

void draw_line(int j,int jj){
  stroke(cr[j],cg[j],cb[j],ca[j]);
  strokeWeight(0.25);
  if (new_closer.closer_i == j & new_closer.closer_distance < 10){
    stroke(cr[j],cg[j],cb[j],255);
    strokeWeight(1);
  }
  if (new_closer.closer_i == jj & new_closer.closer_distance < 10){
    stroke(cr[j],cg[j],cb[j],255);
    strokeWeight(1);
  }

  line(nrpx[j],nrpy[j],nrpx[jj],nrpy[jj]);

}

void print_names(){ 
  int p_e = 0;
  for(int j = 2;j<=118;j++){
    if(names[5][j-1].equals(" ") == false) {
      if(names[5][j].equals(" ") == false) {
        pushMatrix();
        translate(nrpx[j],nrpy[j]);
        fill(cr[j],cg[j],cb[j],255+ca[j]);
        noStroke();
         float aa = map(ects_int[j],0,15,3,13);
        if (new_closer.closer_i == j & new_closer.closer_distance < 10){
          fill(255);
          
         
          
          ellipse(0,0,aa,aa);
        
      
           
        }

        ellipse(0,0,aa,aa);
        popMatrix();
        

        
        
        
      }
    }
  }
}

void print_eksamhno(){
 for(int j = 2;j<=118;j++){

  

  textFont(v48,13);
  textAlign(CENTER,CENTER);
  
    
    fill(cr[j],cg[j],cb[j],255+ca[j]);
      if (new_closer.closer_i == j & new_closer.closer_distance < 10){
   
  
  
  
  text(names[5][j]+", "+eksamhno[j]+"ο εξάμηνο, "+ ects[j] +" διδακτικές μονάδες",width/2,15);
      }

 }
}

void print_ects(){
  println(names[3][11]);
    for(int j = 4;j<=118;j++){
          //  println(j);
      if(names[4][j].equals("Υ") == true) {
        ects[j] = names[10][j];
      

      } else if(names[4][j].equals("Ε") == true) {
        ects[j] = names[11][j];
      

      } else { ects[j] = "0";}
      
      
      if(ects[j].equals("-") == true) {
      ects[j] = "0";
      }


        //String[] list = split(ects[j], ".");
        
        
        
        ects_int[j] = Integer.parseInt(ects[j]);
        


    } 
}





