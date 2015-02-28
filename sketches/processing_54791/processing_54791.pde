

PFont font;

void setup(){
  size(600,600);
  background(255,255,255);
   font = loadFont("Futura-CondensedExtraBold-20.vlw");
}

void draw(){
 
  
for(int i = 0; i < 1000; i += 20) {
  for (int j = 0; j < 600; j = j+5) {
  
  if(i < 600) {
    fill(20,170,50,20);
    textFont(font);
    textSize(j);
    text("i         n         i          t          i          a          l          i         z        e",i, i, 600,600 );

    fill(200,0,10,60);
    textFont(font);
    textSize(j);
     text("  i         n         i          t          i          a          l          i         z        e",i, i, 600,600 );
 
    fill(200,150,10,80);
    textFont(font);
    textSize(j);
     text("    i         n         i          t          i          a          l          i         z        e",i, i, 600,600 );



  }
}
  
  }
}
   
   void mousePressed(){
      fill(255,255,255);
    textFont(font);
    textSize(20);
  text("i n i t i a l i z e",260,590);
  
   }
   




