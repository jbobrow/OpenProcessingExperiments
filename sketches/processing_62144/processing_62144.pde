

  PFont font;
  String p = "C";
  String o = "R";
  String r = "O";
  String n = "S";
  String o2 = "S";
  
  
  
void setup() {
  size(400,200);
  font = loadFont("AGBookRoundedBQ-Bold-72.vlw");
  textFont(font);
  
  
}

void draw() {
  background(255);
  fill(0);
  textAlign(CENTER);
  textSize(48);
  int px = 0;
  int py = 0;
  int x = 0;
  int y = 0;
  
  



  
  if (mouseX < 300 && mouseX > 10 && mouseY<150 && mouseY > 50) {
  pushMatrix();
  translate(50,100);
    text(o,x + 48,y);
  text(r,x+96,y);
  text(n,x+144,y);
    pushMatrix();
    int prot = 0;
    for(prot=0;prot<270; prot++);
    translate(mouseX-30,mouseY-100);
    rotate(radians(prot));
    text(p,0,0);
    popMatrix();
    if (mouseX<100 && mouseX>40) {
    pushMatrix();
    float oGrow = map(mouseX,40,100,1,2);
    scale(oGrow);
    translate(192-oGrow*100,0);
      text(o2, 100,0);

    popMatrix();
    } else 
    
    
  if (mouseX<250 && mouseX>200) {
    pushMatrix();
    float oGrow = map(mouseX,200,250,.3,.5);
    scale(oGrow);
    //map(oGrow,0,1,200,250);
    //translate(oGrow+200,0);
      text(o2, 450,0);

    popMatrix();
    } else {
        text(o2, 192,0);
    }
        
    
    
   
      
    popMatrix();
  } else {
      pushMatrix();
  translate(50,100);
  text(p,0,0);
  text(o,48,0);
  text(r,96,0);
  text(n,144,0);
  text(o2, 192,0);
  popMatrix();
  }
 
}

  


