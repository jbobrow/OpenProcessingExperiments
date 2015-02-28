
float[] xtag=new float[150];
float[] ytag=new float[150];
float[] xtree=new float[150];
float[] ytree=new float[150];

void setup(){
 size(877,620);
  smooth(); 
  
  for(int lop=0; lop<70;lop++){
    xtag[lop]=random(50,820);
    ytag[lop]=random(50,470);
     
    xtree[lop]=random(250,640);
    ytree[lop]=random(250,450);
  }
}

void draw(){
  background(0);
 for(int lop=0;lop<70;lop++) {
    strokeWeight(random(1,28));
    //strokeWeight(28);
    //stroke(70,random(255),0,80);
    stroke(70,100,0,130);

    line(xtag[lop],ytag[lop],xtag[lop],ytag[lop]);

    strokeWeight(2);
    stroke(102,51,0,80);
    line(xtag[lop],ytag[lop],xtree[lop],ytree[lop]);
    strokeWeight(3);
    line(xtree[lop],ytree[lop],420,500);
    strokeWeight(8);
    line(420,500,420,600);
 } 
  
  
}

