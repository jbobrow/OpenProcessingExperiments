
void setup() {
 background(175,205,220);
 size(800,500);
 noStroke();
 setColor("grey");
 
 //S
 setColor("black");
 rect(370,380,70,20);
 rect(370,410,20,30);
 rect(390,420,50,20);
 rect(420,440,20,10);
 rect(370,460,70,20);
 
 //T
 setColor("grey");
 rect(450,380,50,20);
 rect(480,400,20,80);
 rect(510,380,20,20);
 
 //E
 for(int i=0; i<2; i++){
 rect(540,380,70,20);
 rect(540,400,20,50);
 rect(540,460,70,20);
 setColor("red");
 rect(570,420,20,20);
 setColor("grey");
 translate(170,0);
 }
 translate(-340,0);
 
 //V
 rect(620,380,20,100);
 rect(640,460,20,20);
 rect(660,440,20,20);
 rect(680,380,20,60);
 
 //Blocks
 setColor("white");
 rect(20,20,100,460);
 rect(140,20,100,140);
 rect(140,180,100,30);
 setColor("grey");
 rect(260,20,460,50);
 rect(740,20,40,50);
 
 for(int x=10; x>0; x--){
   fill(240,240,240,x*25);
   rect(260,90,20,20+x*10);
   translate(40,0);
 }
 
}

void setColor(String selection) {
  if(selection == "grey") fill(125,145,155);
  else if(selection == "black") fill(0,0,0);
  else if(selection == "red") fill(230,135,135);
  else if(selection == "white") fill(240,240,240);
}
