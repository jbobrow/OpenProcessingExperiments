
Ratoli[] andrea = new Ratoli[100];
Maxim maxim;
AudioPlayer player;

  
int tama = 0;
void setup(){
  size(500,500);
  maxim = new Maxim(this);
  player = maxim.loadFile("aliens.mp3");
  player.setLooping(true);

  
   for (int i = 0;i < andrea.length;i++){
    andrea[i] = new Ratoli(random(width),random(height),random(10,30), color(#D9C066));
      
  }
  
}
  
void draw(){
  background(51, 50, 109);
    for (int i = 0;i < andrea.length && i < tama;i++){
    andrea[i].dibuixa();
    andrea[i].moure();
      
  
  }
}
    
  
void mousePressed(){
  tama = tama + 1;
}

class Ratoli{
  float xPos;
  float yPos;
  color colour;
  float wd;
  float he;
  
  Ratoli(){
  xPos = width/2;
  yPos = height/2;
  colour = color(255,0,0);
  he= 20;
  wd =20;
    
  }
    
    Ratoli(float x, float y, float h, color co){
    xPos = x;
    yPos = y;
    colour = co;
    he = h;
      
    }
      
    void dibuixa(){
      textSize(15);
    fill(0);
    text("PLANETA NEPTÚ!!",350,350);
      
    fill(colour);
    ellipse(xPos-10, yPos-10, 20, 20);
    fill(255,0,0);
    ellipse(xPos-10, yPos-10, 40, 10);
    fill(0);
    ellipse(xPos-10,yPos-10,10,10);
    fill(colour);
    ellipse(mouseX,mouseY+10,40,40);
    fill(255,0,0);
    ellipse(mouseX, mouseY+10, 60, 10);
    fill(0);
    ellipse(mouseX,mouseY+10,10,10);
    fill(0,0,255);
    ellipse(200,400,300,250);
      
      
      
    }
  void moure(){
    xPos =  xPos + (mouseX-xPos)/he;
    yPos =  yPos + (mouseY-yPos)/he;
  }
}


