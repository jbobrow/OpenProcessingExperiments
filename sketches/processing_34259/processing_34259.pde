
float mouseMove;
int r=0;
int g=0;
int b=0;

int moveCircle;
color redd= color(random(0,266),random(0,266),random(0,266));

void setup(){
 size(800,600);
 background(200);
 smooth();
 frameRate (10);

}

void draw() {
  mouseMove=abs(mouseX-pmouseY);
  
  
  float followcircle= mouseMove;
  stroke(255);
  color circle_color= color(150+random(0,255), 0, 20+random(0,255));
  fill(circle_color);
  ellipse(mouseX-random(-40,40),mouseY-random(-50,80), followcircle/9,followcircle/9);
  //rect(mouseMove+40,mouseMove/4,mouseMove/2,mouseMove/2);
  

  if (mousePressed == true){
    //strokeWeight(0.02+mouseMove/100);
    //stroke(0,10);
    //strokeWeight(0.1+mouseMove/70);
    float a = mouseX/5;
    
    strokeWeight(mouseMove/200);
    line(mouseX, mouseY, width, mouseX+20);
    line(mouseX, mouseY, pmouseX, mouseX/40);
    //line(mouseX, mouseY, 0, mouseY);
    
    strokeWeight(mouseMove/90);
    //troke(0);
    //stroke(220,0,150);
    //green
    //stroke(134,255,87);
    stroke(redd);
    line(mouseX, mouseY, width, mouseX);
    line(pmouseX, pmouseY,-40, mouseX);
    
    stroke(random(10,255),30);

   strokeWeight(0.2);
   fill(255, 20);
   ellipse(mouseX,mouseY, followcircle,followcircle);
   ellipse(mouseX/2,mouseY/2, followcircle/10,followcircle/10);

  stroke(random(0, 255),30);
   

 
  //background 
 if (mousePressed == true) {
  line(50, 0, mouseX, mouseY-a);
  line(100, 0, mouseX, mouseY-a);
  line(150, 0, mouseX, mouseY-a);
  line(200, 0, mouseX, mouseY-a);
  line(250, 0, mouseX, mouseY-a);
  line(300, 0, mouseX, mouseY-a);
  line(350, 0, mouseX, mouseY-a);
  line(400, 0, mouseX, mouseY-a);
  line(450, 0, mouseX, mouseY-a);
  line(50, 500, mouseX, mouseY+a);
  line(100, 500, mouseX, mouseY+a);
  line(150, 500, mouseX, mouseY+a);
  line(200, 500, mouseX, mouseY+a);
  line(250, 500, mouseX, mouseY+a);
  line(300, 500, mouseX, mouseY+a);
  line(350, 500, mouseX, mouseY+a);
  line(400, 500, mouseX, mouseY+a);
  line(450, 500, mouseX, mouseY+a);
  line(0, 50, mouseX-a, mouseY);
  line(0, 100, mouseX-a, mouseY);
  line(0, 150, mouseX-a, mouseY);
  line(0, 200, mouseX-a, mouseY);
  line(0, 250, mouseX-a, mouseY);
  line(0, 300, mouseX-a, mouseY);
  line(0, 350, mouseX-a, mouseY);
  line(0, 400, mouseX-a, mouseY);
  line(0, 450, mouseX-a, mouseY);
  line(500, 50, mouseX+a, mouseY);
  line(500, 100, mouseX+a, mouseY);
  line(500, 150, mouseX+a, mouseY);
  line(500, 200, mouseX+a, mouseY);
  line(500, 250, mouseX+a, mouseY);
  line(500, 300, mouseX+a, mouseY);
  line(500, 350, mouseX+a, mouseY);
  line(500, 400, mouseX+a, mouseY);
  line(500, 450, mouseX+a, mouseY);
}
   
  }
  
  if (keyPressed == true) {
    //saveFrame();
    background(random(0,256));
    
    if(key == 'r' || key == 'R'){}
    redd = color(random(0,266),random(0,266),random(0,266));
    
    //color red= color(random(0,266));
    //fill(red);
    //stroke(5);
    

      //for(int i=0; i< moveCircle; i++){
     //ellipse(mouseX[i]-random(40,40),mouseY[i]-random(-50,50), followcircle/9,followcircle/9);
      }
   }


  
  


                
