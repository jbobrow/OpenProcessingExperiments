
void setup(){
  size(600,600);
  noLoop();  
  background(255);
}

int[] shulte=new int[49];

void swap(int i, int j){
  int temp;
  
  temp=shulte[j];
  shulte[j]=shulte[i];
  shulte[i]=temp;
}


void shakeit(int nums){
  for(int k=0;k<nums;k++)
  {
     for(int i=0;i<48;i++){
      swap(i,int(random(0,49)));
     }
  }
}

void generate(){
   for(int i=0;i<48;i++){
      shulte[i]=i+1;
   }
   
   shakeit(int(random(6,10)));
}

void draw(){
  // 
  fill(255);
  PFont font;
  font=createFont("Times New Roman",36);
  textFont(font);
  textAlign(CENTER,BOTTOM);
  generate();
  
  int element;
  int hgap=60;
  int vgap=60;
  int topmargin=115;
  int margin=7;
    for(int i=0; i<margin; i++) {
      for(int j=0; j<margin; j++) {
            element=shulte[i+j*margin]+1; 
            if (element>25){
               fill(200,0,0);
               text(element-25, topmargin+j*hgap, topmargin+i*vgap);
            } else {
               fill(0,0,0);
               text(element, topmargin+j*hgap, topmargin+i*vgap);
            }
      }
    }
}
