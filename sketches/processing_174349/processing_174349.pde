
float easing = 0.7;
suiveur chef;
 
void setup(){
  size(400,400); 
  chef = new suiveur();
}
 
void draw(){
  //Static Alien Experiment
 


 
rectMode(CENTER);
fill(#009BFF);
rect(100,120,45,60);  //Body
 
fill(#009BFF);
rect(100,70,60,70);  //Head
 
fill(#009BFF);
ellipse(85,60,20,15);    //Right Eye
ellipse(115,60,20,15);   //Left Eye
 
ellipse(85,147,30,10);  //Right Foot
ellipse(115,147,30,10);  //Left Foot
 
strokeWeight(10);
stroke(150);
line(73,100,50,120); //Right Arm
line(127,100,150,120);  //Left Arm
 fill(#C700FF);


  background(255);
   chef.dessine(mouseX, mouseY);
}
 
class suiveur{
  suiveur suivant;
  float x,y;
  suiveur(){
    suivant = new suiveur(120);
    x=width/2;y=height/2;
  }
  suiveur(int n){
    if(n>0) suivant = new suiveur(n-1);
  }
  void dessine(float _x, float _y){
    x=_x+(x-_x)*easing;
    y=_y+(y-_y)*easing;
    rect(x,y,30,30);
     if(suivant!=null){
       suivant.dessine(x,y);
     }
  }
}

