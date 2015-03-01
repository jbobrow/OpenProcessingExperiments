
// Monster Using Class
// cc Austin S. Lee 1/25 2015
 

class Monster {

  int X_AXIS= 2;
  color c0, c1, c2;
  int k=1;
  

  int[] myHair= new int[9];

  Monster() {
  }


  void update() {
    //size(400, 400);
    
    //c1= color(255, 20, 20);
    c1= color(random(255), random(255), random(255));
    c0= color(random(20), random(255), random(255));
    c2= color(250, 150, 250, 80);   
   // c0= color(250, 150, 250, 8);

    myHair[0]= 10;
    myHair[1]= 15;
    myHair[2]= 20;
    myHair[3]= 25;
    myHair[4]= 30;
    myHair[5]= 35;
    myHair[6]= 40;
    myHair[7]= 45;
    myHair[8]= 50;
  }
  void display() {
    

   
    rectMode(CENTER);
    //stroke(130,0,0);

    float i= mouseX/20;
    float lineEnd0=mouseY-10+random(8);
    float lineEnd1=mouseY-10+random(18);
    float eyeball= random(2);



    fill(255, 20, 20);
    noStroke();
    rect(mouseX+50, mouseY, 100, 100);
    setGradient(mouseX, mouseY-50, 100, 100, c1, c2, X_AXIS); 

    fill(255);
    //strokeWeight(3);
    ellipse(mouseX+65, mouseY, 25, 25 );
    ellipse(mouseX+35, mouseY, 30, 30 );


    //for (int j=0; j<5; j++) {
    float eyeballs = eyeball+i;
    if (eyeballs>width) {
      eyeballs=-1;
    }
    fill(10);
    noStroke();
    ellipse(mouseX+55+eyeballs, mouseY, 8, 8 );
    ellipse(mouseX+25+eyeballs, mouseY, 8, 8 );
    fill(255);
    noStroke();
    ellipse(mouseX+53+eyeballs, mouseY-2, 2, 2 );
    ellipse(mouseX+23+eyeballs, mouseY-2, 2, 2 );

    //eyelid
    if (mouseX>=width/2-10 && mouseX<width/2 ) {


      int j= 30;



      fill(0, 0, 0);
      ellipse(mouseX+65, mouseY+2, 25, 26 );
      ellipse(mouseX+35, mouseY+2, 30, 31 );  


      fill(255, 20, 20);
      ellipse(mouseX+65, mouseY, 25, 26 );
      ellipse(mouseX+35, mouseY, 30, 31 ); 

      setGradient(mouseX, mouseY-50, 100, 100, c1, c0, X_AXIS); 



      k++;
      if (k>100) {
        k=1;
      }
      float z= random(2);
      fill(255, 255, 255, 80);
      ellipse(mouseX+68-z+k*0.3, mouseY+14+k*0.6, random(3), 4);
      ellipse(mouseX+30+z+k*0.1, mouseY+14+k*0.5, random(3), 5);
    }
    noFill();

    stroke(0);
    strokeWeight(2);
    line(mouseX, mouseY, mouseX-40, lineEnd0);
    line(mouseX+100, mouseY, mouseX+140, lineEnd1);



    for (int h=0; h<9; h++) {
      line(mouseX+20+myHair[h], mouseY-50, mouseX+30+myHair[h]+random(10), mouseY-70+random(11));
    }


    //hair

    arc(mouseX+40, mouseY+26, 60, 1+eyeballs, 1, HALF_PI);

    fill(255, 20, 20);
    noStroke();
    ellipse(mouseX-40, lineEnd0, 20, 20);
    ellipse(mouseX+140, lineEnd1, 20, 20);
  }

  void setGradient(int x, int y, float w, float h, color c1, color c2, int axis) {
    noFill();
    if (axis== X_AXIS) {
      for (int i= x; i<= x+w; i++) {
        float inter= map(i, x, x+w, 0, 1);
        color c= lerpColor(c1, c2, inter);
        stroke(c);
        line(i, y, i, y+h);
      }
    }
  }
}

//press '1' for half size
//press '2' for really small 
// Monster Using Class
// cc Austin S. Lee 1/25 2015

Monster monster;
float s; //scale
int keyboard;

void setup(){
  size(400,400);
  background(255);
  monster= new Monster();
  
}

void draw(){
  //monster.update();
  //monster.display(); 
}

void mousePressed(){
  monster.update();
  
  if(keyboard== '1'){
    s= 0.5;
    scale(s);
    pushMatrix();
    translate(160,160);
    
    monster.display(); 
    popMatrix();
  }else if(keyboard=='2'){
    s=0.2;
    scale(s);
    pushMatrix();
    translate(800,800);
    monster.display(); 
    popMatrix();
  }else{
    s=1;
    scale(s);
    monster.display(); 
  }
  
  
 

}

void keyPressed(){
  keyboard= key;
  //background(255);
}




