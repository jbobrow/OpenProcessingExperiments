
//Robert Esposito
//Introduction to Digital Media
//Section B
//9.12.12

int growingDiameter=0;   //Global Variable -int-Diameter
int randomRed=0;
boolean boolGrowing=false;

void setup() {

  size(1200, 600);
  background(101, 151, 193);

}

void draw() {

  background(0);
  stroke(255, 20, 90);


  for (int i = 0; i < 100; i++) {
    float r = random(30);
    stroke(60);
     

  }

fill(255,25);
  bezier(0,100,mouseX, mouseY,mouseX, mouseY,100,0);
  bezier(500,0,mouseX, mouseY,mouseX, mouseY,700,0);
  bezier(0,200,mouseX, mouseY,mouseX, mouseY,0,400);
  bezier(0,500,mouseX, mouseY,mouseX, mouseY,100,600);
  
  bezier(1100,0,mouseX, mouseY,mouseX, mouseY,1200,100);
  bezier(1200,200,mouseX, mouseY,mouseX, mouseY,1200,400);
  bezier(1200,500,mouseX, mouseY,mouseX, mouseY,1100,600);
  bezier(500,600,mouseX, mouseY,mouseX, mouseY,700,600);


 if (boolGrowing==true) {

    if (growingDiameter<1000) {
      growingDiameter++;
    }

    else {
      growingDiameter=0;
    }
  }
stroke(255,255,255);
fill(255,0,0,70);
  ellipse(mouseX, mouseY, random(growingDiameter, growingDiameter),growingDiameter);  
     stroke(255,0,0);
   line(pmouseX, pmouseY, 0,random(600)); 
   line(pmouseX, pmouseY, random(1200),600); 
   line(pmouseX, pmouseY, 1200,random(600)); 
   line(pmouseX, pmouseY,random(1200),0); 
}

void mouseClicked() {

  boolGrowing=!boolGrowing;
  
}

void keyPressed(){
  if(key=='s'){
    save("robertEsposito.png");
  }
}
