
float angle=sin(PI/2);

PFont myfont;
PImage line_im;


String [] chapters;
String [] chapters_2;
String [] chapters_3;
String [] chapters_4;

int chapterX=80;
int slide=1;

void setup() {
  size(877,620);
  smooth();
  myfont=loadFont("Calibri-20.vlw");
  line_im=loadImage("line.png");
  
  chapters=loadStrings("Chapter_list.txt");
  chapters_2=loadStrings("Chapter_list_2.txt");
  chapters_3=loadStrings("Chapter_list_3.txt");
    chapters_4=loadStrings("Chapter_list_4.txt");
}

void draw() {
  background(0);
  fill(255);
  
 image(line_im,chapterX-80,0);
 
  for(int lop=0;lop<27;lop++) {
    text(chapters[lop],chapterX+(20*lop),55+(20*lop));
    text(chapters_2[lop],chapterX+(20*lop)+width,55+(20*lop));
    text(chapters_3[lop],chapterX+(20*lop)+(width*2),55+(20*lop));
      text(chapters_4[lop],chapterX+(20*lop)+(width*3),55+(20*lop));
  }
  if(mouseX>750 && slide==1 ){
    chapterX=chapterX-6;
  
  if(chapterX<-797 && slide==1){
    delay(700);
    chapterX=-797;
    slide=2;
   
  }
}
   if(mouseX>750 && slide==2){
    chapterX=chapterX-6;
  
  if(chapterX<-1674 && slide==2){
    delay(700);
    chapterX=-1674;
    slide=3;
    
  }
}
    if(mouseX>750 && slide==3){
    chapterX=chapterX-6;
  
  if(chapterX<-2551 && slide==3){
    delay(700);
    chapterX=-2551;
    slide=4;
    
  }
}
  ///// reverse////
    if(mouseX<100 && slide==2 ){
    chapterX=chapterX+6;
  
  if(chapterX>80 && slide==2){
    delay(700);
    chapterX=80;
    slide=1;
    
  }
}
   if(mouseX<100 && slide==3){
    chapterX=chapterX+6;
  
  if(chapterX>-797 && slide==3){
    delay(700);
    chapterX=-797;
    slide=2;
   
  }
   }
    if(mouseX<100 && slide==4){
    chapterX=chapterX+6;
  
  if(chapterX>-1674 && slide==4){
    delay(700);
    chapterX=-1674;
    slide=3;
    
  }
    }
}


