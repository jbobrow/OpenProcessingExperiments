
int amount = 12;
createEllipse[] cirkel;
int index = 0;


void setup(){
  size(756, 800);
  smooth();

  
  cirkel = new createEllipse[amount];
  for(int i = 0; i<amount; i++){
    cirkel[i] = new createEllipse();
  }
}


void draw(){
 PImage b;
 b = loadImage("nederland.gif");
 background(b);
 fill(0);
 text("Provincies van Nederland", 10,20);
 for(int i=0; i<amount; i++){
   index = i;
   cirkel[i].checkRollover();
   cirkel[i].drawEllipse();
 }  
}

class createEllipse{



  
 float [] x1 = { 450, 700, 450, 640, 660, 610, 400, 300, 250, 100, 400, 520};
 float [] y1 = { 300, 90, 120, 220, 350, 460, 400, 300, 400, 600, 560, 700};
 

 
 String [] location = {"Flevoland","Groningen","Friesland","Drenthe","Overijssel","Gelderland","Utrecht","Noord-Holland","Zuid-Holland","Zeeland","Noord-Brabant","Limburg"};
 int [] txt_x1 = {125, 125, 125, 125 ,125, 125, 125, 115, 125, 125, 105, 125};
 int [] txt_y1 = {330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330};
 


  int diameter;
  color ellipse_col;
  
    
  createEllipse(){
   
    diameter = 50;
    ellipse_col = color(230, 230, 230);
  
  }
void drawEllipse(){
  stroke(0);
  fill(ellipse_col, 128);
  ellipse(x1[index], y1[index], diameter, diameter);

}  

  void checkRollover(){
    float disX = x1[index] - mouseX;
    float disY = y1[index] - mouseY;
    if(sqrt(sq(disX) + sq(disY)) < diameter/2){
      diameter = 75;
      ellipse_col = color(255, 0, 0);
      showInfobox();
      showInfo();
      
    } else {
      diameter = 20;
      ellipse_col = color(230, 230, 230);
    }
 
  }
  
  void showInfobox(){  
    fill(220,220,220); 
    rect(100, 300, 100, 50);
  }
  
  void showInfo(){
    int temp = 0;
    
    fill(0);
    text(location[index], txt_x1[index], txt_y1[index]);
    temp = txt_y1[index];

    
  }
  


}

