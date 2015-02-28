
PFont smallfont;
float angle=0.001;
void setup(){
  size(250,250);
  smooth();
}
void draw(){
  background(#FF6748);
  fill(0,80);
      smallfont=loadFont("CourierNewPSMT-70.vlw");
  textFont(smallfont);
    text("M",8,124);
    //different spacing - M
  text(" 5G",5,120);
    fill(0,130);
    text("2 4",25,190);
      textFont(smallfont,50);
        text("g",60,190);
        //smaller g & different spacing
    fill(0,100);
  translate(170,185);
  rotate(angle);
  textFont(smallfont,40);
  text("M5G",5,90);
            angle=angle+0.1;
        rotate(angle*2);      
text("2G4",0,12);
          angle=angle+0.2; 
             rotate(angle/2);           
text("M5G2G4",15,5);
          angle=angle+0.05; 
   
                      
}


