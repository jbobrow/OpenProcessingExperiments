
//declare variables once at top
int x=50;
int y=50;
int zzColour=255;
int zzSize=60;
void setup() {
  size(300,300);
  background(255);


}

void draw() {
  background(mouseX+100,mouseY+10,180);
  //translate(mouseX, mouseY);
  fill(245);
  noStroke();
  beginShape();
 //center of form out
  for(int x=0; x <1000; x+=100)
  for(int y=0 ; y <1000 ; y+=100){
    pushMatrix();
    translate(x,y);
    
      if(mousePressed){
        background(mouseX+100,mouseY+10,180);
      }
   
    //zigzag01
    fill(mouseX+100,mouseY+100,30);
    quad(0,10,30,40,30,50,0,20);
    fill(255);
    quad(30,40,50,20,50,30,30,50);
    fill(mouseX+100,mouseY+100,80);
    quad(50,20,70,40,70,50,50,30);
    fill(255);
    quad(70,40,100,10,100,20,70,50);
 
 
    //zigzag02
    fill(255);
    quad(00,60,20,80,20,90,00,70);
    fill(pmouseX+100,pmouseY+100,50);
    quad(20,80,50,50,50,60,20,90);
    fill(255);
    quad(50,50,80,80,80,90,50,60);
    fill(pmouseX+100,pmouseY+100,150);
    quad(80,80,100,60,100,70,80,90);
 
    //zigzag03
    fill(mouseX+200,mouseY+200,30);
    quad(00,30,10,40,10,50,00,40);
    fill(255);
    quad(10,40,50,00,50,10,10,50);
    fill(mouseX+200,mouseY+200,30);
    quad(50,00,90,40,90,50,50,10);
    fill(255);
    quad(90,40,100,30,100,40,90,50);
 
    //zigzag04
    fill(mouseX+200,mouseY+200,30);
    quad(00,60,10,50,10,60,00,70);
    fill(255);
    quad(10,50,50,90,50,100,10,60);
    fill(mouseX+200,mouseY+200,30);
    quad(50,90,90,50,90,60,50,100);
    fill(255);
    quad(90,50,100,60,100,70,90,60);
 
    //zigzag05
    fill(mouseX+100,mouseY+100,100);
    quad(00,80,30,50,30,60,00,90);
    fill(255);
    quad(30,50,50,70,50,80,30,60);
    fill(mouseX+100,mouseY+100,100);
    quad(50,70,70,50,70,60,50,80);
    fill(255);
    quad(70,50,100,80,100,90,70,60);
 
    //zigzag06
    fill(mouseX+100,mouseY+100,30);
    quad(30,20,50,40,50,50,30,30);
    fill(255);
    quad(50,40,70,20,70,30,50,50);
    

    popMatrix();
  
  }

  endShape(CLOSE);
  

}
